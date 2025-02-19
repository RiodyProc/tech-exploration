#include "display.h"
#include "fonts.h"
#include <string.h>
#ifdef LCD_DYNAMIC_MEM
#include "stdlib.h"
#endif

#define ABS(x) ((x) > 0 ? (x) : -(x))

#define min(x1,x2)	(x1 < x2 ? x1 : x2)
#define max(x1,x2)	(x1 > x2 ? x1 : x2)

#define min3(x1,x2,x3)	min(min(x1,x2),x3)
#define max3(x1,x2,x3)	max(max(x1,x2),x3)

#define LCD_CS_LOW		if (lcd->spi_data.cs_port) { lcd->spi_data.cs_port->BSRR = (uint32_t)lcd->spi_data.cs_pin << 16U; }
#define LCD_CS_HI		if (lcd->spi_data.cs_port) { lcd->spi_data.cs_port->BSRR = lcd->spi_data.cs_pin; }
#define LCD_DC_LOW		{lcd->spi_data.dc_port->BSRR = (uint32_t)lcd->spi_data.dc_pin << 16U; }
#define LCD_DC_HI		{lcd->spi_data.dc_port->BSRR = lcd->spi_data.dc_pin; }

#define DISABLE_IRQ		__disable_irq(); __DSB(); __ISB();
#define ENABLE_IRQ		__enable_irq();

LCD_Handler *LCD = 0; // List of displays

// Callback for transmission stream interrupt
// This handler should be specified in the interrupt handler functions in the DMA streams,
// which are used by the displays - stm32f4xx_it.c
void Display_TC_Callback(DMA_TypeDef *dma_x, uint32_t stream)
{
    // Reset the interrupt flags
    uint8_t shift[8] = {0, 6, 16, 22, 0, 6, 16, 22}; // Bit shift in the flag register IFCR (L and H)
    volatile uint32_t *ifcr_tx = (stream > 3) ? &(dma_x->HIFCR) : &(dma_x->LIFCR);
    *ifcr_tx = 0x3F << shift[stream];
    uint32_t stream_ct = 0;
    DMA_TypeDef *dma_ct = 0;
    LCD_Handler *lcd = LCD; // Pointer to the first display in the list
    // Traverse through the list of displays (while there is a next one)
    while (lcd) {
        // Get DMA stream parameters for the display
        dma_ct = lcd->spi_data.dma_tx.dma;
        stream_ct = lcd->spi_data.dma_tx.stream;
        // Check if the current DMA stream matches the one associated with the i-th display
        if (dma_ct == dma_x && stream_ct == stream) {
            if (lcd->spi_data.cs_port) { // Does CS control exist?
                // Is CS pin low?
                if (lcd->spi_data.cs_port->ODR & lcd->spi_data.cs_pin) { // Check pin state in output register
                    lcd = (LCD_Handler *)lcd->next;  // If CS is high, this display is not active
                    continue;  // Move to the next display
                }
            }
            // Pointer to the stream: controller address + offset
            DMA_Stream_TypeDef *dma_TX = ((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)dma_x + STREAM_OFFSET_TAB[stream])));
            // Disable DMA stream
            dma_TX->CR &= ~DMA_SxCR_EN;
            while (dma_TX->CR & DMA_SxCR_EN) { __NOP(); } // Wait until stream is disabled
            if (lcd->size_mem) { // If data is not completely transferred from memory, restart DMA and exit the interrupt
                if (lcd->size_mem > 65535) {
                    dma_TX->NDTR = 65535;
                    lcd->size_mem -= 65535;
                }
                else {
                    dma_TX->NDTR = lcd->size_mem;
                    lcd->size_mem = 0;
                }
                // Enable DMA stream
                dma_TX->CR |= (DMA_SxCR_EN);
                return;
            }
#ifdef LCD_DYNAMIC_MEM
            // Clear display buffer
            if (lcd->tmp_buf) {
                // Since memory is allocated dynamically, to avoid collisions,
                // disable interrupts before freeing memory
                DISABLE_IRQ
                free(lcd->tmp_buf);
                lcd->tmp_buf = 0;
                ENABLE_IRQ
            }
#endif
            // Disable SPI from accepting DMA requests
            lcd->spi_data.spi->CR2 &= ~SPI_CR2_TXDMAEN;
            while (lcd->spi_data.spi->SR & SPI_SR_BSY) { __NOP(); } // Wait until SPI is free
            // Disconnect the display from MK (pull the CS pin high)
            if (!lcd->cs_control) { LCD_CS_HI }
            // Disable SPI
            lcd->spi_data.spi->CR1 &= ~SPI_CR1_SPE;
            return;
        }
        // Move to the next display in the list
        lcd = (LCD_Handler *)lcd->next;
    }
}

inline void LCD_SetCS(LCD_Handler *lcd)
{
    LCD_CS_HI
}

inline void LCD_ResCS(LCD_Handler *lcd)
{
    LCD_CS_LOW
}

inline void LCD_SetDC(LCD_Handler *lcd)
{
    LCD_DC_HI
}

inline void LCD_ResDC(LCD_Handler *lcd)
{
    LCD_DC_LOW
}

typedef enum {
    lcd_write_command = 0,
    lcd_write_data
} lcd_dc_select;

inline static void LCD_WRITE_DC(LCD_Handler* lcd, uint8_t data, lcd_dc_select lcd_dc)
{
    SPI_TypeDef *spi = lcd->spi_data.spi;
    if (lcd_dc == lcd_write_command)  {
        LCD_DC_LOW
    }
    else {
        LCD_DC_HI
    }
    spi->DR = data; // Command
    while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
    while (spi->SR & SPI_SR_BSY)    { __NOP(); } // Wait until SPI is free
}

void LCD_HardWareReset (LCD_Handler* lcd)
{
    if (lcd->spi_data.reset_port) {
        lcd->spi_data.reset_port->BSRR = (uint32_t)lcd->spi_data.reset_pin << 16U;
        LL_mDelay(25);
        lcd->spi_data.reset_port->BSRR = lcd->spi_data.reset_pin;
        LL_mDelay(25);
    }
}

// Reads data from the display window with the top-left corner coordinates (x, y), width w, height h into the data buffer
void LCD_ReadImage(LCD_Handler* lcd, uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t *data)
{
	uint16_t x1 = x + w - 1, y1 = y + h - 1; // Defining the coordinates of the bottom-right corner of the window
	// Check the window parameters as we do not operate outside the display dimensions
	if (x >= lcd->Width || y >= lcd->Height || x1 >= lcd->Width || y1 >= lcd->Height) return;
	// Recalculate window coordinates based on the display matrix and controller characteristics.
	// The relevant offsets in the display driver determine these characteristics, considering dimensional differences,
	// the initial offset of the display matrix relative to the controller's memory field, and the image orientation on the matrix
	x += lcd->x_offs;
	y += lcd->y_offs;
	x1 += lcd->x_offs;
	y1 += lcd->y_offs;
	// Create the control string for the display driver interpreter, which tells the display controller
	// that we are defining a memory area and want to read this area. Pre-switch the display to
	// 18-bit color mode, as the Memory Read command (0x2E) should only work in 18-bit color mode.
	uint8_t set_win_and_read[] = { // Color mode selection command
								   LCD_UPR_COMMAND, 0x3A, 1, 0x66, // 0x66 - 18-bit color, 0x55 - 16-bit color
								   // Setting addresses that define the block:
								   LCD_UPR_COMMAND, 0x2A, 4, 0, 0, 0, 0, // column
								   LCD_UPR_COMMAND, 0x2B, 4, 0, 0, 0, 0, // row
								   // Memory Read command (read memory)
								   LCD_UPR_COMMAND, 0x2E, 0,
								   LCD_UPR_END };
	// Insert the specified window coordinates into the control string
	set_win_and_read[7]  = x >> 8;  set_win_and_read[8]  = x & 0xFF;
	set_win_and_read[9]  = x1 >> 8; set_win_and_read[10] = x1 & 0xFF;
	set_win_and_read[14] = y >> 8;  set_win_and_read[15] = y & 0xFF;
	set_win_and_read[16] = y1 >> 8; set_win_and_read[17] = y1 & 0xFF;
	// Wait until the display is ready to accept new commands and data
	while (LCD_GetState(lcd) != LCD_STATE_READY) { __NOP(); }
	lcd->cs_control = 1; // Disable CS line control from the command interpreter
	SPI_TypeDef *spi = lcd->spi_data.spi;
	uint32_t spi_param = spi->CR1; // Save current SPI parameters
	// Configure SPI (SPI is already disabled)
	spi->CR1 &= ~(SPI_CR1_BIDIMODE |  // 4-wire SPI
				  SPI_CR1_RXONLY   |
				  SPI_CR1_CRCEN    |
				  SPI_CR1_BR_Msk   |  // SPI speed mask
				  SPI_CR1_DFF); 	  // 8-bit frame size
	// Set SPI speed for reading from the display.
	// The parameter SPI_SPEED_DISPLAY_READ is configured in display.h
	// In reading mode, according to display controller specifications,
	// the speed is usually lower than in data writing mode.
	spi->CR1 |= (uint32_t)((SPI_SPEED_DISPLAY_READ & 7) << 3);
	LCD_CS_LOW // Connect display controller to the MCU
	// Send the control string to the display controller via the interpreter
	// Do not toggle the CS line after sending the 0x2E command, as the controller
	// might think we want to interrupt the read operation.
	LCD_String_Interpretator(lcd, set_win_and_read);
	LCD_DC_HI // Set DC line of the display controller to "data". However, my experiments show that
	// reading works even in "command" mode, which is strange, since according to the specification, the first command,
	// including NOP, should interrupt the read operation. In any case, reading continues until we have read
	// the entire selected area or manually interrupt the process.
	uint32_t len = w * h; // Number of pixels to read
	uint16_t *data_ptr = data; // Pointer to the buffer location for storing pixels
	uint8_t r, g, b; // Variables for color components
	spi->CR1 |= SPI_CR1_SPE; // Enable SPI
	//-------------------------- 8 idle clock cycles (see specification) --------------------------
	// The display controller prepares to transmit pixel color data during these 8 cycles
	spi->DR = 0x00;
	while (!(spi->SR & SPI_SR_RXNE)) { __NOP(); } // Wait for response from the display controller
	r = spi->DR;
	//------------------------------ Read color data of len pixels ------------------------------
	while (len--) {
		// Read the color components sequentially
		// According to the specification, the sequence of reading color components is r, g, b.
		// If the colors do not match the actual ones, reduce the SPI reading speed,
		// but sometimes stability can be improved by pulling up the MISO line to the power supply.
		// Interestingly, the first sign of speed exceeding is when the color components b and r are swapped.
		spi->DR = 0x20;
		while (!(spi->SR & SPI_SR_RXNE)) { __NOP(); }// Wait for response from the display controller
		b = spi->DR;
		spi->DR = 0x20;
		while (!(spi->SR & SPI_SR_RXNE)) { __NOP(); }
		g = spi->DR;
		spi->DR = 0x20;
		while (!(spi->SR & SPI_SR_RXNE)) { __NOP(); }
		r = spi->DR;
		*data_ptr++ = LCD_Color(lcd, r, g, b); // Convert color from R8G8B8 to R5G6B5 and store it
	}
	LCD_CS_HI // Disconnect the display controller from the MCU
	lcd->cs_control = 0; // Re-enable CS line control from the command interpreter
	while (spi->SR & SPI_SR_BSY) { __NOP(); } // Wait for SPI to become free
	spi->CR1 &= ~SPI_CR1_SPE; // Disable SPI
	spi->CR1 = spi_param; // Restore the previous SPI parameters
	// Restore 16-bit color mode
	uint8_t color_restore[]  = { LCD_UPR_COMMAND, 0x3A, 1, 0x55, LCD_UPR_END };
	LCD_String_Interpretator(lcd, color_restore);
}

// Command interpreter for control codes: "command", "data", "pause", "end of packet"
void LCD_String_Interpretator(LCD_Handler* lcd, uint8_t *str)
{
	SPI_TypeDef *spi = lcd->spi_data.spi;
	int i;
	while (LCD_GetState(lcd) == LCD_STATE_BUSY) { __NOP(); } // Wait for the display to be free
	if (!lcd->cs_control) { LCD_CS_LOW }
	spi->CR1 &= ~ (SPI_CR1_BIDIMODE |  	// Set mode
				   SPI_CR1_RXONLY |   	// Transmit only
				   SPI_CR1_CRCEN | 		// Disable hardware CRC calculation
				   SPI_CR1_DFF); 		// Set 8-bit transmission
	spi->CR1 |= SPI_CR1_SPE; // Enable SPI
	while (1) {
		switch (*str++) {
			// Control code "command"
			case LCD_UPR_COMMAND:
				// Send the command code to the display controller
				LCD_WRITE_DC(lcd, *str++, lcd_write_command);
				// Number of command parameters
				i = *str++;
				// Send the parameters to the display controller
				while(i--) {
					LCD_WRITE_DC(lcd, *str++, lcd_write_data);
				}
				break;
			// Control code "data"
			case LCD_UPR_DATA:
				// Number of data elements
				i = *str++;
				// Send the data to the display controller
				while(i--) {
					LCD_WRITE_DC(lcd, *str++, lcd_write_data);
				}
				break;
			// Control code "pause"
			case LCD_UPR_PAUSE:
				// Wait according to the parameter (0...255)
				LL_mDelay(*str++);
				break;
			// Control code "end of packet"
			case LCD_UPR_END:
			default:
				if (!lcd->cs_control) { LCD_CS_HI }
				// Disable SPI
				spi->CR1 &= ~SPI_CR1_SPE;
				return;
		}
	}
}

// create a display handler and add it to the lcds list
// returns a pointer to the created handler or 0 in case of failure
LCD_Handler* LCD_DisplayAdd(LCD_Handler *lcds,     /* pointer to the list of displays
													  (the first display in the list) */
#ifndef LCD_DYNAMIC_MEM
							LCD_Handler *lcd,	   /* pointer to the created display handler
													  in case of static memory allocation */
#endif
							uint16_t resolution1,
							uint16_t resolution2,
							uint16_t width_controller,
							uint16_t height_controller,
							int16_t w_offs,
							int16_t h_offs,
							LCD_PageOrientation orientation,
							DisplayInitCallback init,
							DisplaySetWindowCallback set_win,
							DisplaySleepInCallback sleep_in,
							DisplaySleepOutCallback sleep_out,
							void *connection_data,
							LCD_DATA_BUS data_bus,
							LCD_BackLight_data bkl_data
					   )
{
#ifdef LCD_DYNAMIC_MEM
	LCD_Handler* lcd = (LCD_Handler*)malloc(sizeof(LCD_Handler));
#endif
	if (!lcd) return 0;
	memset(lcd, 0, sizeof(LCD_Handler));
	LCD_DMA_TypeDef *hdma = 0;
	lcd->data_bus = data_bus;
	// initialize connection data
	lcd->spi_data = *((LCD_SPI_Connected_data*)connection_data);
	hdma = &lcd->spi_data.dma_tx;
	// DMA configuration
	if (hdma->dma) {
		DMA_Stream_TypeDef *dma_x = ((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)hdma->dma + STREAM_OFFSET_TAB[hdma->stream])));
		dma_x->CR &= ~DMA_SxCR_EN; // disable DMA channel
		while(dma_x->CR & DMA_SxCR_EN) { __NOP(); } // wait for channel to be disabled
		if (lcd->data_bus == LCD_DATA_8BIT_BUS) {
			dma_x->CR &= ~(DMA_SxCR_MSIZE | DMA_SxCR_PSIZE);
			dma_x->CR |= LL_DMA_MDATAALIGN_BYTE | LL_DMA_PDATAALIGN_BYTE;
		}
		else if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
			dma_x->CR &= ~(DMA_SxCR_MSIZE | DMA_SxCR_PSIZE);
			dma_x->CR |= LL_DMA_MDATAALIGN_HALFWORD | LL_DMA_PDATAALIGN_HALFWORD;
		}
		// disable interrupts for certain DMA stream events and double buffering mode
		dma_x->CR &= ~(DMA_SxCR_DMEIE | DMA_SxCR_HTIE | DMA_SxCR_DBM | DMA_SxCR_TEIE);
		dma_x->FCR &= ~DMA_SxFCR_FEIE;
		// enable interrupt at end of transfer
		dma_x->CR |= DMA_SxCR_TCIE;
		dma_x->CR &= ~DMA_SxCR_PINC; // disable peripheral address increment
		dma_x->CR |= DMA_SxCR_MINC;  // enable memory address increment
	}
	// display orientation and coordinate offset configuration
	uint16_t max_res = max(resolution1, resolution2);
	uint16_t min_res = min(resolution1, resolution2);
	if (orientation==PAGE_ORIENTATION_PORTRAIT || orientation==PAGE_ORIENTATION_PORTRAIT_MIRROR) {
		lcd->Width = min_res;
		lcd->Height = max_res;
		lcd->Width_Controller = width_controller;
		lcd->Height_Controller = height_controller;
		if (orientation==PAGE_ORIENTATION_PORTRAIT) {
			lcd->x_offs = w_offs;
			lcd->y_offs = h_offs;
		}
		else {
			lcd->x_offs = lcd->Width_Controller - lcd->Width - w_offs;
			lcd->y_offs = lcd->Height_Controller - lcd->Height - h_offs;
		}
	}
	else if (orientation==PAGE_ORIENTATION_LANDSCAPE || orientation==PAGE_ORIENTATION_LANDSCAPE_MIRROR)	{
		lcd->Width = max_res;
		lcd->Height = min_res;
		lcd->Width_Controller = height_controller;
		lcd->Height_Controller = width_controller;
		if (orientation==PAGE_ORIENTATION_LANDSCAPE) {
			lcd->x_offs = h_offs;
			lcd->y_offs = lcd->Height_Controller - lcd->Height - w_offs;
		}
		else {
			lcd->x_offs = lcd->Width_Controller - lcd->Width - h_offs;
			lcd->y_offs = w_offs;
		}
	}
	else {
		LCD_Delete(lcd);
		return 0;
	}

	if (lcd->Width_Controller < lcd->Width ||
		lcd->Height_Controller < lcd->Height ||
		init==NULL ||
		set_win==NULL )	{
		LCD_Delete(lcd);
		return 0;
	}
	lcd->Orientation = orientation;
	lcd->Init_callback = init;
	lcd->SetActiveWindow_callback = set_win;
	lcd->SleepIn_callback = sleep_in;
	lcd->SleepOut_callback = sleep_out;
	lcd->bkl_data = bkl_data;
	lcd->display_number = 0;
	lcd->next = 0;
	lcd->prev = 0;
#ifndef LCD_DYNAMIC_MEM
	lcd->tmp_buf = lcd->display_work_buffer;
#endif
	if (!lcds) {
		return lcd;
	}
	LCD_Handler *prev = lcds;
	while (prev->next) {
		prev = (LCD_Handler *)prev->next;
		lcd->display_number++;
	}
	lcd->prev = (void*)prev;
	prev->next = (void*)lcd;
	return lcd;
}

// deletes the display
void LCD_Delete(LCD_Handler* lcd)
{
	if (lcd) {
#ifdef LCD_DYNAMIC_MEM
		if (lcd->tmp_buf) {
			free(lcd->tmp_buf);
		}
#endif
		memset(lcd, 0, sizeof(LCD_Handler));
#ifdef LCD_DYNAMIC_MEM
		free(lcd);
#endif
	}
}

// initializes the display
void LCD_Init(LCD_Handler* lcd)
{
	LCD_HardWareReset(lcd);
	LCD_String_Interpretator(lcd, lcd->Init_callback(lcd->Orientation));
	LCD_SetBackLight(lcd, lcd->bkl_data.bk_percent);
}

// returns the backlight brightness, %
inline uint8_t LCD_GetBackLight(LCD_Handler* lcd)
{
	return lcd->bkl_data.bk_percent;
}

// returns the display width, pixels
inline uint16_t LCD_GetWidth(LCD_Handler* lcd)
{
	return lcd->Width;
}

// returns the display height, pixels
inline uint16_t LCD_GetHeight(LCD_Handler* lcd)
{
	return lcd->Height;
}

// returns the display status: busy or ready (needed for sending new data to the display)
// the display is busy if the SPI to which it is connected is in use
inline LCD_State LCD_GetState(LCD_Handler* lcd)
{
	if (lcd->spi_data.spi->CR1 & SPI_CR1_SPE) {
		return LCD_STATE_BUSY;
	}
	return LCD_STATE_READY;
}

// controls the backlight
void LCD_SetBackLight(LCD_Handler* lcd, uint8_t bk_percent)
{
	if (bk_percent > 100) {
		bk_percent = 100;
	}
	lcd->bkl_data.bk_percent = bk_percent;
	// backlight using PWM
	if (lcd->bkl_data.htim_bk) {
		// calculate the % brightness as a fraction of the counter period
		uint32_t bk_value = lcd->bkl_data.htim_bk->ARR * bk_percent / 100;
		// set the PWM duty cycle for the specific channel
		switch(lcd->bkl_data.channel_htim_bk) {
			case LL_TIM_CHANNEL_CH1:
				lcd->bkl_data.htim_bk->CCR1 = bk_value;
				break;
			case LL_TIM_CHANNEL_CH2:
				lcd->bkl_data.htim_bk->CCR2 = bk_value;
				break;
			case LL_TIM_CHANNEL_CH3:
				lcd->bkl_data.htim_bk->CCR3 = bk_value;
				break;
			case LL_TIM_CHANNEL_CH4:
				lcd->bkl_data.htim_bk->CCR4 = bk_value;
				break;
			default:
				break;
		}
		// if the timer is not running, start it
		if (!(lcd->bkl_data.htim_bk->CR1 & TIM_CR1_CEN)) {
			// enable the channel
			lcd->bkl_data.htim_bk->CCER |= lcd->bkl_data.channel_htim_bk;
			// enable the counter
			lcd->bkl_data.htim_bk->CR1 |= TIM_CR1_CEN;
		}
	}
	// backlight without PWM (simple on/off), if PWM timer is unavailable
	else if (lcd->bkl_data.blk_port) {
		if (bk_percent) {
			lcd->bkl_data.blk_port->BSRR = lcd->bkl_data.blk_pin;
		}
		else {
			lcd->bkl_data.blk_port->BSRR = (uint32_t)lcd->bkl_data.blk_pin << 16U;
		}
	}
}

// Switch display to "sleep mode" (turn off the display and backlight)
void LCD_SleepIn(LCD_Handler* lcd)
{
	// Backlight using PWM
	if (lcd->bkl_data.htim_bk) {
		// Turn off backlight by setting duty cycle to zero
		switch(lcd->bkl_data.channel_htim_bk) {
			case LL_TIM_CHANNEL_CH1:
				lcd->bkl_data.htim_bk->CCR1 = 0;
				break;
			case LL_TIM_CHANNEL_CH2:
				lcd->bkl_data.htim_bk->CCR2 = 0;
				break;
			case LL_TIM_CHANNEL_CH3:
				lcd->bkl_data.htim_bk->CCR3 = 0;
				break;
			case LL_TIM_CHANNEL_CH4:
				lcd->bkl_data.htim_bk->CCR4 = 0;
				break;
			default:
				break;
		}
	}
	// Backlight without PWM (just on/off), if PWM timer is unavailable
	else if (lcd->bkl_data.blk_port) {
		lcd->bkl_data.blk_port->BSRR = (uint32_t)lcd->bkl_data.blk_pin << 16U;
	}
	if (lcd->SleepIn_callback) {
		LCD_String_Interpretator(lcd, lcd->SleepIn_callback());
	}
}

// Wake up the display from "sleep mode" (turn on the display and backlight)
void LCD_SleepOut(LCD_Handler* lcd)
{
	if (lcd->SleepOut_callback) {
		LCD_String_Interpretator(lcd, lcd->SleepOut_callback());
	}
	// Turn on backlight
	LCD_SetBackLight(lcd, lcd->bkl_data.bk_percent);
}

// Set the active display window
void LCD_SetActiveWindow(LCD_Handler* lcd, uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2)
{
	LCD_String_Interpretator(lcd, lcd->SetActiveWindow_callback(x1 + lcd->x_offs, y1 + lcd->y_offs, x2 + lcd->x_offs, y2 + lcd->y_offs));
}

// Write a block of data to the display
void LCD_WriteData(LCD_Handler *lcd, uint16_t *data, uint32_t len)
{
	SPI_TypeDef *spi = lcd->spi_data.spi;
	while (LCD_GetState(lcd) == LCD_STATE_BUSY) { __NOP(); } // Wait until display is free
	if (!lcd->cs_control) { LCD_CS_LOW }
	if (!lcd->dc_control) { LCD_DC_HI  }
	spi->CR1 &= ~ (SPI_CR1_BIDIMODE |  	// Set mode here
				   SPI_CR1_RXONLY |   	// Transmit only
				   SPI_CR1_CRCEN | 		// Disable hardware CRC calculation
				   SPI_CR1_DFF); 		// 8-bit data transfer
	if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
		spi->CR1 |= SPI_CR1_DFF; // 16-bit data transfer
	}
	spi->CR1 |= SPI_CR1_SPE; // Enable SPI
	if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
		while (len) {
			spi->DR = *data++; // Write data to register
			while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
			len--;
		}
	}
	else {
		len *= 2;
		uint8_t *data1 = (uint8_t*)data;
		while (len)	{
			spi->DR = *data1++; // Write data to register
			while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
			len--;
		}
	}
	while (spi->SR & SPI_SR_BSY) { __NOP(); } // Wait until SPI is free
	if (!lcd->cs_control) { LCD_CS_HI }
	// Disable SPI
	spi->CR1 &= ~SPI_CR1_SPE;
}

// Write a block of data to the display using DMA
void LCD_WriteDataDMA(LCD_Handler *lcd, uint16_t *data, uint32_t len)
{
	if (lcd->spi_data.dma_tx.dma) {
		if (lcd->data_bus == LCD_DATA_8BIT_BUS) {
			len *= 2;
		}
		SPI_TypeDef *spi = lcd->spi_data.spi;
		while (LCD_GetState(lcd) == LCD_STATE_BUSY) { __NOP(); } // Wait until display is free
		if (!lcd->cs_control) { LCD_CS_LOW }
		if (!lcd->dc_control) { LCD_DC_HI  }
		lcd->size_mem = len;
		spi->CR1 &= ~ (SPI_CR1_BIDIMODE |  	// Set mode here
					   SPI_CR1_RXONLY |   	// Transmit - transfer
					   SPI_CR1_CRCEN | 		// Disable hardware CRC calculation
					   SPI_CR1_DFF); 		// 8-bit data transfer
		if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
			spi->CR1 |= SPI_CR1_DFF; // 16-bit data transfer
		}
		spi->CR1 |= SPI_CR1_SPE; // Enable SPI
		DMA_TypeDef *dma_x = lcd->spi_data.dma_tx.dma;
		uint32_t stream = lcd->spi_data.dma_tx.stream;
		DMA_Stream_TypeDef *dma_TX = ((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)dma_x + STREAM_OFFSET_TAB[stream])));
		uint8_t shift[8] = {0, 6, 16, 22, 0, 6, 16, 22}; // Bitwise shift in the flag registers IFCR (L and H)
		volatile uint32_t *ifcr_tx = (stream > 3) ? &(dma_x->HIFCR) : &(dma_x->LIFCR);
		// Reset TX interrupt flags
		*ifcr_tx = 0x3F<<shift[stream];
		// Enable SPI to accept DMA requests
		spi->CR2 |= SPI_CR2_TXDMAEN;
		// Set addresses, length, increments
		dma_TX->PAR = (uint32_t)(&spi->DR); // Peripheral address - DR register of SPI
		dma_TX->M0AR = (uint32_t)data; // Memory address - data buffer for outgoing data
		dma_TX->CR &= ~DMA_SxCR_PINC; // Disable peripheral address increment
		dma_TX->CR |= DMA_SxCR_MINC;  // Enable memory address increment
		if (len <= 65535) {
			dma_TX->NDTR = (uint32_t)len; // Set transfer size
			lcd->size_mem = 0;
		}
		else {
			dma_TX->NDTR = 65535;
			lcd->size_mem = len - 65535;
		}
		dma_TX->CR |= (DMA_SxCR_EN); // Enable DMA stream (start DMA transfer)
		return;
	}
	LCD_WriteData(lcd, data, len);
}

void LCD_FillWindow(LCD_Handler* lcd, uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint32_t color)
{
	uint16_t tmp;
	if (x1 > x2) { tmp = x1; x1 = x2; x2 = tmp; }
	if (y1 > y2) { tmp = y1; y1 = y2; y2 = tmp; }
	if (x1 > lcd->Width - 1 || y1 > lcd->Height - 1) return;
	if (x2 > lcd->Width - 1)  x2 = lcd->Width - 1;
	if (y2 > lcd->Height - 1) y2 = lcd->Height - 1;
	uint32_t len = (x2 - x1 + 1) * (y2 - y1 + 1); // Number of pixels to fill
	LCD_SetActiveWindow(lcd, x1, y1, x2, y2);
	if (!lcd->cs_control) LCD_CS_LOW
	if (!lcd->dc_control) LCD_DC_HI
	uint16_t color16 = lcd->fill_color = LCD_Color_24b_to_16b(lcd, color);
	SPI_TypeDef *spi = lcd->spi_data.spi;
	spi->CR1 &= ~ (SPI_CR1_BIDIMODE |  	// Set mode here
				   SPI_CR1_RXONLY |   	// Transmit only
				   SPI_CR1_CRCEN | 		// Disable hardware CRC calculation
				   SPI_CR1_DFF); 		// 8-bit data transfer
	if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
		spi->CR1 |= SPI_CR1_DFF; // 16-bit data transfer
	}
	spi->CR1 |= SPI_CR1_SPE; // Enable SPI
	if (lcd->spi_data.dma_tx.dma)
	{
		if (lcd->data_bus == LCD_DATA_8BIT_BUS)	{
			len *= 2;
		}
		DMA_TypeDef *dma_x = lcd->spi_data.dma_tx.dma;
		uint32_t stream = lcd->spi_data.dma_tx.stream;
		DMA_Stream_TypeDef *dma_TX = ((DMA_Stream_TypeDef *)((uint32_t)((uint32_t)dma_x + STREAM_OFFSET_TAB[stream])));
		uint8_t shift[8] = {0, 6, 16, 22, 0, 6, 16, 22}; // Bitwise shift in the flag registers IFCR (L and H)
		volatile uint32_t *ifcr_tx = (stream > 3) ? &(dma_x->HIFCR) : &(dma_x->LIFCR);
		// Reset TX interrupt flags
		*ifcr_tx = 0x3F<<shift[stream];
		// Enable SPI to accept DMA requests
		spi->CR2 |= SPI_CR2_TXDMAEN;
		// Set addresses, length, increments
		dma_TX->PAR = (uint32_t)(&spi->DR); // Peripheral address - DR register of SPI
		dma_TX->M0AR = (uint32_t)&lcd->fill_color; // Memory address - data buffer for outgoing data
		dma_TX->CR &= ~DMA_SxCR_PINC; // Disable peripheral address increment
		dma_TX->CR &= ~DMA_SxCR_MINC; // Disable memory address increment
		if (len <= 65535) {
			dma_TX->NDTR = (uint32_t)len; // Set transfer size
			lcd->size_mem = 0;
		}
		else {
			dma_TX->NDTR = 65535;
			lcd->size_mem = len - 65535;
		}
		dma_TX->CR |= (DMA_SxCR_EN); // Enable DMA stream (start DMA transfer)
		return;
	}
	if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
		while(len) {
			spi->DR = color16; // Write data to register
			while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
			len--;
		}
	}
	else {
		uint8_t color1 = color16 & 0xFF, color2 = color16 >> 8;
		while(len) {
			spi->DR = color1;
			while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
			spi->DR = color2;
			while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
			len--;
		}
	}
	while (spi->SR & SPI_SR_BSY) { __NOP(); } // Wait until SPI is free
	if (!lcd->cs_control) LCD_CS_HI
	// Disable SPI
	spi->CR1 &= ~SPI_CR1_SPE;
}

/* Fill the entire display with the specified color */
void LCD_Fill(LCD_Handler* lcd, uint32_t color)
{
	LCD_FillWindow(lcd, 0, 0, lcd->Width - 1, lcd->Height - 1, color);
}

/* Draw a pixel at the given coordinates */
void LCD_DrawPixel(LCD_Handler* lcd, int16_t x, int16_t y, uint32_t color)
{
	if (x > lcd->Width - 1 || y > lcd->Height - 1 || x < 0 || y < 0)	return;
	LCD_SetActiveWindow(lcd, x, y, x, y);
	uint16_t color1 = LCD_Color_24b_to_16b(lcd, color);
	LCD_WriteData(lcd, &color1, 1);
}

/*
 * Draw a line between two points
 * Horizontal and vertical lines are drawn very quickly
 */
void LCD_DrawLine(LCD_Handler* lcd, int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint32_t color)
{
	if(x0 == x1) {
		if(y0 > y1) { y0 ^= y1; y1 ^= y0; y0 ^= y1; } 
		for (int i = y0; i <= y1; i++) {
			LCD_DrawPixel(lcd, x0, i, color);
		}
	} else if (y0 == y1) {
		if(x0 > x1) { x0 ^= x1; x1 ^= x0; x0 ^= x1; } 
		for (int i = x0; i <= x1; i++) {
			LCD_DrawPixel(lcd, i, y0, color);
		}
	}
}

/* Draws a rectangle using the coordinates of the top-left and bottom-right corners */
void LCD_DrawRectangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint32_t color)
{
	LCD_DrawLine(lcd, x1, y1, x2, y1, color);
	LCD_DrawLine(lcd, x1, y1, x1, y2, color);
	LCD_DrawLine(lcd, x1, y2, x2, y2, color);
	LCD_DrawLine(lcd, x2, y1, x2, y2, color);
}

/* Draws a filled rectangle using the coordinates of the top-left and bottom-right corners */
void LCD_DrawFilledRectangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint32_t color)
{
	int16_t tmp;
	if (x1 > x2) { tmp = x1; x1 = x2; x2 = tmp; }
	if (y1 > y2) { tmp = y1; y1 = y2; y2 = tmp; }
	if (x2 < 0 || x1 > lcd->Width - 1)  return;
	if (y2 < 0 || y1 > lcd->Height - 1) return;
	if (x1 < 0) x1 = 0;
	if (y1 < 0) y1 = 0;
	LCD_FillWindow(lcd, x1, y1, x2, y2, color);
}

/* Draws a triangle using the coordinates of three points */
void LCD_DrawTriangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, uint32_t color)
{
	LCD_DrawLine(lcd, x1, y1, x2, y2, color);
	LCD_DrawLine(lcd, x2, y2, x3, y3, color);
	LCD_DrawLine(lcd, x3, y3, x1, y1, color);
}

/* Types of segment intersections */
typedef enum {
	LINES_NO_INTERSECT = 0, // do not intersect
	LINES_INTERSECT,        // intersect
	LINES_MATCH             // coincide (overlap)
} INTERSECTION_TYPES;

/*
 * Determines the type of intersection and the coordinates (on the x-axis) of the intersection
 * of a segment with coordinates (x1,y1)-(x2,y2) with the horizontal line y = y0
 * Returns one of the intersection types from INTERSECTION_TYPES, and in the variables x_min, x_max - the coordinate
 * or the intersection range (if they overlap).
 * In match, increments the number of overlaps (count results from all relevant calls)
 */
static INTERSECTION_TYPES LinesIntersection(int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t y0, int16_t *x_min, int16_t *x_max, uint8_t *match)
{
	if (y1 == y2) { // Special case - segment is parallel to the x-axis
		if (y0 == y1) { // Check for coincidence
			*x_min = min(x1, x2);
			*x_max = max(x1, x2);
			(*match)++;
			return LINES_MATCH;
		}
		return LINES_NO_INTERSECT;
	}
	if (x1 == x2) { // Special case - segment is parallel to the y-axis
		if (min(y1, y2) <= y0 && y0 <= max(y1, y2)) {
			*x_min = *x_max = x1;
			return LINES_INTERSECT;
		}
		return LINES_NO_INTERSECT;
	}
	// Determine the intersection point of the lines (the equation of the line is obtained from the coordinates of the points defining the segment)
	*x_min = *x_max = (x2 - x1) * (y0 - y1) / (y2 - y1) + x1;
	if (min(x1, x2) <= *x_min && *x_min <= max(x1, x2)) { // If the x-coordinate of the intersection point belongs to the segment,
		return LINES_INTERSECT;                             // then it is an intersection
	}
	return LINES_NO_INTERSECT;
}

/* Draws a filled triangle using the coordinates of three points */
void LCD_DrawFilledTriangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, uint32_t color)
{
	// Sort the coordinates in ascending order of y
	int16_t tmp;
	if (y1 > y2) {
		tmp = y1; y1 = y2; y2 = tmp;
		tmp = x1; x1 = x2; x2 = tmp;
	}
	if (y1 > y3) {
		tmp = y1; y1 = y3; y3 = tmp;
		tmp = x1; x1 = x3; x3 = tmp;
	}
	if (y2 > y3) {
		tmp = y2; y2 = y3; y3 = tmp;
		tmp = x2; x2 = x3; x3 = tmp;
	}
	// Check if the triangle fits within the display area
	if (y1 > lcd->Height - 1 || y3 < 0) return;
	int16_t xmin = min3(x1, x2, x3);
	int16_t xmax = max3(x1, x2, x3);
	if (xmax < 0 || xmin > lcd->Width - 1) return;
	uint8_t c_mas, match;
	int16_t x_mas[8], x_min, x_max;
	// "Clip" coordinates that go outside the display area
	int16_t y_start = y1 < 0 ? 0: y1;
	int16_t y_end = y3 > lcd->Height - 1 ? lcd->Height - 1: y3;
	// Iterate over the points in the y-coordinate range and find the intersection of the segment y = y[i] (where y[i]=y1...y3, 1)
	// with the sides of the triangle
	for (int16_t y = y_start; y < y_end; y++) {
		c_mas = match = 0;
		if (LinesIntersection(x1, y1, x2, y2, y, &x_mas[c_mas], &x_mas[c_mas + 1], &match)) {
			c_mas += 2;
		}
		if (LinesIntersection(x2, y2, x3, y3, y, &x_mas[c_mas], &x_mas[c_mas + 1], &match)) {
			c_mas += 2;
		}
		if (LinesIntersection(x3, y3, x1, y1, y, &x_mas[c_mas], &x_mas[c_mas + 1], &match)) {
			c_mas += 2;
		}
		if (!c_mas) continue;
		x_min = x_max = x_mas[0];
		while (c_mas) {
			x_min = min(x_min, x_mas[c_mas - 2]);
			x_max = max(x_max, x_mas[c_mas - 1]);
			c_mas -= 2;
		}
		LCD_DrawLine(lcd, x_min, y, x_max, y, color);
	}
}

/* Draws a circle with a given center and radius */
void LCD_DrawCircle(LCD_Handler* lcd, int16_t x0, int16_t y0, int16_t r, uint32_t color)
{
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	LCD_DrawPixel(lcd, x0, y0 + r, color);
	LCD_DrawPixel(lcd, x0, y0 - r, color);
	LCD_DrawPixel(lcd, x0 + r, y0, color);
	LCD_DrawPixel(lcd, x0 - r, y0, color);

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		LCD_DrawPixel(lcd, x0 + x, y0 + y, color);
		LCD_DrawPixel(lcd, x0 - x, y0 + y, color);
		LCD_DrawPixel(lcd, x0 + x, y0 - y, color);
		LCD_DrawPixel(lcd, x0 - x, y0 - y, color);

		LCD_DrawPixel(lcd, x0 + y, y0 + x, color);
		LCD_DrawPixel(lcd, x0 - y, y0 + x, color);
		LCD_DrawPixel(lcd, x0 + y, y0 - x, color);
		LCD_DrawPixel(lcd, x0 - y, y0 - x, color);
	}
}

/* Draws a filled circle with a given center and radius */
void LCD_DrawFilledCircle(LCD_Handler* lcd, int16_t x0, int16_t y0, int16_t r, uint32_t color)
{
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	LCD_DrawLine(lcd, x0 - r, y0, x0 + r, y0, color);

	while (x < y) {
		if (f >= 0)	{
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		LCD_DrawLine(lcd, x0 - x, y0 + y, x0 + x, y0 + y, color);
		LCD_DrawLine(lcd, x0 + x, y0 - y, x0 - x, y0 - y, color);

		LCD_DrawLine(lcd, x0 + y, y0 + x, x0 - y, y0 + x, color);
		LCD_DrawLine(lcd, x0 + y, y0 - x, x0 - y, y0 - x, color);
	}
}

/*
 * Displays a block of memory (image) from the data address in the given area of the display:
 * x, y - coordinates of the top-left corner of the display area;
 * w, h - width and height of the display area;
 * data - pointer to the memory block (image) to display on the screen;
 * dma_use_flag - flag indicating DMA usage (0 - without DMA, !=0 - with DMA)
 */
void LCD_DrawImage(LCD_Handler* lcd, uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t *data, uint8_t dma_use_flag)
{
	if ((x >= lcd->Width) || (y >= lcd->Height) || (x + w - 1) >= lcd->Width || (y + h - 1) >= lcd->Height) return;
	LCD_SetActiveWindow(lcd, x, y, x + w - 1, y + h - 1);
	if (dma_use_flag) {
		LCD_WriteDataDMA(lcd, data, w * h);
	}
	else {
		LCD_WriteData(lcd, data, w * h);
	}
}

/*
 * Displays a character with the code ch at the initial coordinates (x, y), using the font font, text color txcolor,
 * and background color bgcolor on the display.
 * modesym defines how the character will be displayed:
 *    LCD_SYMBOL_PRINT_FAST - fast output with complete clearing of the character space;
 *    LCD_SYMBOL_PRINT_PSETBYPSET - output character point by point, ignoring the background color bgcolor (overlay mode).
 * The width of the character is up to 32 pixels (4 bytes per line). The height of the character is not limited by the library.
 */
void LCD_WriteChar(LCD_Handler* lcd, uint16_t x, uint16_t y, char ch, FontDef *font, uint32_t txcolor, uint32_t bgcolor, LCD_PrintSymbolMode modesym)
{
	int i, j, k;
	uint32_t tmp = 0;
	const uint8_t *b = font->data;
	uint16_t color;
	uint16_t txcolor16 = LCD_Color_24b_to_16b(lcd, txcolor);
	uint16_t bgcolor16 = LCD_Color_24b_to_16b(lcd, bgcolor);
	ch = ch < font->firstcode || ch > font->lastcode ? 0: ch - font->firstcode;
	int bytes_per_line = ((font->width - 1) >> 3) + 1;
	if (bytes_per_line > 4) { // Support for characters up to 32 pixels wide (4 bytes per line)
		return;
	}
	k = 1 << ((bytes_per_line << 3) - 1);
	b += ch * bytes_per_line * font->height;
	SPI_TypeDef *spi = lcd->spi_data.spi;
	if (modesym == LCD_SYMBOL_PRINT_FAST) {
		LCD_SetActiveWindow(lcd, x, y, x + font->width - 1, y + font->height - 1);
		LCD_CS_LOW
		LCD_DC_HI
		spi->CR1 &= ~SPI_CR1_SPE; // Turn off SPI to change parameters
		spi->CR1 &= ~ (SPI_CR1_BIDIMODE |  	// Set mode
					   SPI_CR1_RXONLY |   	//  Transmit only
					   SPI_CR1_CRCEN | 		// Disable hardware CRC calculation
					   SPI_CR1_DFF); 		// 8-bit transfer
		if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
			spi->CR1 |= SPI_CR1_DFF; // 16-bit transfer
		}
		spi->CR1 |= SPI_CR1_SPE; // Turn on SPI
		for (i = 0; i < font->height; i++) {
			if (bytes_per_line == 1)      { tmp = *((uint8_t*)b);  }
			else if (bytes_per_line == 2) { tmp = *((uint16_t*)b); }
			else if (bytes_per_line == 3) { tmp = (*((uint8_t*)b)) | ((*((uint8_t*)(b + 1))) << 8) |  ((*((uint8_t*)(b + 2))) << 16); }
			else { tmp = *((uint32_t*)b); }
			b += bytes_per_line;
			for (j = 0; j < font->width; j++)
			{
				color = (tmp << j) & k ? txcolor16: bgcolor16;
				while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
				if (lcd->data_bus == LCD_DATA_16BIT_BUS) {
					spi->DR = color;
				}
				else {
					uint8_t color1 = color & 0xFF, color2 = color >> 8;
					spi->DR = color1;
					while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
					spi->DR = color2;
				}
			}
		}
		while (!(spi->SR & SPI_SR_TXE)) { __NOP(); } // Wait for transmission to complete
		while (spi->SR & SPI_SR_BSY) { __NOP(); } // Wait for SPI to be ready
		// Turn off SPI
		spi->CR1 &= ~SPI_CR1_SPE;
		LCD_CS_HI
	}
	else {
		for (i = 0; i < font->height; i++) {
			if (bytes_per_line == 1) { tmp = *((uint8_t*)b); }
			else if (bytes_per_line == 2) { tmp = *((uint16_t*)b); }
			else if (bytes_per_line == 3) { tmp = (*((uint8_t*)b)) | ((*((uint8_t*)(b + 1))) << 8) |  ((*((uint8_t*)(b + 2))) << 16); }
			else if (bytes_per_line == 4) { tmp = *((uint32_t*)b); }
			b += bytes_per_line;
			for (j = 0; j < font->width; j++) {
				if ((tmp << j) & k) {
					LCD_DrawPixel(lcd, x + j, y + i, txcolor);
				}
			}
		}
	}
}

// Displays a string str of text starting at position x, y, with font font, text color color, and background color bgcolor
// modesym defines how the text will be displayed:
// LCD_SYMBOL_PRINT_FAST - fast output with complete clearing of the character space
// LCD_SYMBOL_PRINT_PSETBYPSET - output point by point, ignoring the background color bgcolor (allows overlaying text on images)
void LCD_WriteString(LCD_Handler* lcd, uint16_t x, uint16_t y, const char *str, FontDef *font, uint32_t color, uint32_t bgcolor, LCD_PrintSymbolMode modesym)
{
	while (*str) {
		if (x + font->width > lcd->Width) {
			x = 0;
			y += font->height;
			if (y + font->height > lcd->Height) {
				break;
			}
		}
		LCD_WriteChar(lcd, x, y, *str, font, color, bgcolor, modesym);
		x += font->width;
		str++;
	}
	lcd->AtPos.x = x;
	lcd->AtPos.y = y;
}

inline uint16_t LCD_Color (LCD_Handler *lcd, uint8_t r, uint8_t g, uint8_t b)
{
	uint16_t color = (((uint16_t)r & 0xF8) << 8) | (((uint16_t)g & 0xFC) << 3) | (((uint16_t)b >> 3));
	if (lcd->data_bus == LCD_DATA_8BIT_BUS) {// 8-bit transfer
		color = (color >> 8) | ((color & 0xFF) << 8);
	}
	return color;
}

inline uint16_t LCD_Color_24b_to_16b(LCD_Handler *lcd, uint32_t color)
{
	uint8_t r = (color >> 16) & 0xff;
	uint8_t g = (color >> 8) & 0xff;
	uint8_t b = color & 0xff;
	return LCD_Color(lcd, r, g, b);
}

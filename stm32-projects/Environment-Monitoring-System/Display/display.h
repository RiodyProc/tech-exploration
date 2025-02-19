#ifndef INC_DISPLAY_H_
#define INC_DISPLAY_H_

#include "main.h"
#include "fonts.h"

/* ----------------------------- SPI speed when reading from the display -------------------------
   From 0 (max) to 7 (min), where: 0 -> clk/2, 1 -> clk/4, ..., 7 -> clk/256
   Applied for reading information from the display controller, e.g. LCD_ReadImage
 -------------------------------------------------------------------------------------------*/
#define SPI_SPEED_DISPLAY_READ	2

/* -------------------------------------------------------------------------------------------------------------------
                            Mechanism selection for memory allocation management
 ----------------------------------------------------------------------------------------------------------------------*/
//#define LCD_DYNAMIC_MEM                //Use dynamic memory allocation (malloc, free) in the driver.
//If you want to use static memory allocation,
//comment this line out.

#ifndef LCD_DYNAMIC_MEM                    //Size of the static buffer for the display driver.
#define LCD_STATIC_WORK_BUFFER_SIZE	750	//Used when static memory allocation is enabled.
//The size of this buffer should be twice the size of
//the planned maximum block of data to be transferred to the display.
#endif
/* --------------------------------------------------------------------------------------------------------------------- */

//Some predefined colors
//Format 0xRRGGBB
#define	COLOR_BLACK			0x000000
#define	COLOR_BLUE			0x0000FF
#define	COLOR_RED			0xFF0000
#define	COLOR_GREEN			0x00FF00
#define COLOR_CYAN			0x00FFFF
#define COLOR_MAGENTA		0xFF00FF
#define COLOR_YELLOW		0xFFFF00
#define COLOR_WHITE			0xFFFFFF
#define COLOR_NAVY			0x000080
#define COLOR_DARKGREEN		0x2F4F2F
#define COLOR_DARKCYAN		0x008B8B
#define COLOR_MAROON		0xB03060
#define COLOR_PURPLE		0x800080
#define COLOR_OLIVE			0x808000
#define COLOR_LIGHTGREY		0xD3D3D3
#define COLOR_DARKGREY		0xA9A9A9
#define COLOR_ORANGE		0xFFA500
#define COLOR_GREENYELLOW	0xADFF2F

#define LCD_UPR_COMMAND		0
#define LCD_UPR_DATA		1
#define LCD_UPR_PAUSE		2
#define LCD_UPR_END			3

//Data width
typedef enum {
	LCD_DATA_UNKNOW_BUS,
	LCD_DATA_8BIT_BUS,
	LCD_DATA_16BIT_BUS
} LCD_DATA_BUS;

//Display statuses
typedef enum {
	LCD_STATE_READY,
	LCD_STATE_BUSY,
	LCD_STATE_ERROR,
	LCD_STATE_UNKNOW
} LCD_State;

//Display orientation
typedef enum {
	PAGE_ORIENTATION_PORTRAIT,			//Portrait
	PAGE_ORIENTATION_LANDSCAPE,			//Landscape
	PAGE_ORIENTATION_PORTRAIT_MIRROR,	//Portrait upside down
	PAGE_ORIENTATION_LANDSCAPE_MIRROR	//Landscape upside down
} LCD_PageOrientation;

//Symbol printing modes
typedef enum {
	LCD_SYMBOL_PRINT_FAST,		//Fast, with background erasure
	LCD_SYMBOL_PRINT_PSETBYPSET	//Slow, pixel-by-pixel, no background erasure
} LCD_PrintSymbolMode;

//DMA data
typedef struct {
	DMA_TypeDef *dma;
	uint32_t stream;
} LCD_DMA_TypeDef;

//SPI connection data
typedef struct {
	SPI_TypeDef *spi;
	LCD_DMA_TypeDef dma_tx;
	GPIO_TypeDef *reset_port;
	uint16_t reset_pin;
	GPIO_TypeDef *dc_port;
	uint16_t dc_pin;
	GPIO_TypeDef *cs_port;
	uint16_t cs_pin;
} LCD_SPI_Connected_data;

//Backlight data
typedef struct {
	TIM_TypeDef *htim_bk;		//------- For PWM backlight: timer
	uint32_t channel_htim_bk;	//----------------------------- Timer channel

	GPIO_TypeDef *blk_port;		//For simply turning the backlight on/off if htim_bk = 0 (no PWM, defined output port)
	uint16_t blk_pin;			//----------------------------------------------------------------------- Port pin

	uint8_t bk_percent;			//Backlight brightness for PWM mode, %
								//0 - backlight off, > 0 backlight on if htim_bk = 0 (no PWM, defined output port)
} LCD_BackLight_data;

//Callbacks
typedef uint8_t* (*DisplayInitCallback)(uint8_t);
typedef uint8_t* (*DisplaySetWindowCallback)(uint16_t, uint16_t, uint16_t, uint16_t);
typedef uint8_t* (*DisplaySleepInCallback)(void);
typedef uint8_t* (*DisplaySleepOutCallback)(void);

//Print position
typedef struct {
	uint16_t x;
	uint16_t y;
} LCD_xy_pos;

//Display handler
typedef struct {
	uint16_t Width_Controller;    	//Maximum matrix width supported by the display controller, pixels
	uint16_t Height_Controller;		//Maximum matrix height supported by the display controller, pixels
	uint16_t Width;					//Actual width of the used display matrix, pixels
	uint16_t Height;				//Actual height of the used display matrix, pixels
	LCD_PageOrientation Orientation;//Display orientation
	int16_t x_offs;					//X offset
	int16_t y_offs;					//Y offset
	LCD_xy_pos AtPos;				//Current symbol print position
	DisplayInitCallback Init_callback;					//Initialization callback
	DisplaySetWindowCallback SetActiveWindow_callback;	//Active window setup callback
	DisplaySleepInCallback SleepIn_callback;			//Sleep entry callback
	DisplaySleepOutCallback SleepOut_callback;			//Sleep exit callback
	LCD_SPI_Connected_data spi_data;					//SPI connection data
	LCD_DATA_BUS data_bus;								//Data bus width
	LCD_BackLight_data bkl_data;						//Backlight data
	uint16_t *tmp_buf;									//Display buffer pointer
#ifndef LCD_DYNAMIC_MEM
	uint16_t display_work_buffer[LCD_STATIC_WORK_BUFFER_SIZE];
#endif
	uint32_t size_mem;									//Size of untransferred data - for DMA restart
	uint8_t display_number;								//Display number
	uint8_t cs_control;
	uint8_t dc_control;
	uint16_t fill_color;
	void *prev;					//Pointer to the previous display
	void *next;					//Pointer to the next display
} LCD_Handler;

extern LCD_Handler *LCD;		//Pointer to the list of displays (first display in the list)

//Callback (to be added to the DMA interrupt handler, see stm32f4xx_it.c file)
extern void Display_TC_Callback(DMA_TypeDef*, uint32_t);

void LCD_SetCS(LCD_Handler *lcd);
void LCD_ResCS(LCD_Handler *lcd);
void LCD_SetDC(LCD_Handler *lcd);
void LCD_ResDC(LCD_Handler *lcd);

//Creates a display handler and adds it to the list of displays
//Returns pointer to the created display or 0 on failure
LCD_Handler* LCD_DisplayAdd(LCD_Handler *lcds,			/* Pointer to the first display in the list, or 0 if no displays are in the list */
#ifndef LCD_DYNAMIC_MEM
							LCD_Handler *lcd,	        /* Pointer to the display handler to be created
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
					   );

//Removes the display handler
void LCD_Delete(LCD_Handler* lcd);
//Hardware reset of the display
void LCD_HardWareReset(LCD_Handler* lcd);
//Display initialization
void LCD_Init(LCD_Handler* lcd);
//Command string interpreter
void LCD_String_Interpretator(LCD_Handler* lcd, uint8_t *str);
//Sets the display backlight brightness
void LCD_SetBackLight(LCD_Handler* lcd, uint8_t bk_percent);
//Returns the current backlight brightness of the display
uint8_t LCD_GetBackLight(LCD_Handler* lcd);
//Returns the width of the display, pixels
uint16_t LCD_GetWidth(LCD_Handler* lcd);
//Returns the height of the display, pixels
uint16_t LCD_GetHeight(LCD_Handler* lcd);
//Returns the display status
LCD_State LCD_GetState(LCD_Handler* lcd);
//Puts the display to sleep
void LCD_SleepIn(LCD_Handler* lcd);
//Wakes the display from sleep
void LCD_SleepOut(LCD_Handler* lcd);
//Sets the active window
void LCD_SetActiveWindow(LCD_Handler* lcd, uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);
//Sends data to the display without DMA
void LCD_WriteData(LCD_Handler *lcd, uint16_t *data, uint32_t len);
//Sends data to the display with DMA
void LCD_WriteDataDMA(LCD_Handler *lcd, uint16_t *data, uint32_t len);
//Fills a window with the specified coordinates and color
void LCD_FillWindow(LCD_Handler* lcd, uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint32_t color);
//Fills the entire screen with the specified color
void LCD_Fill(LCD_Handler* lcd, uint32_t color);
//Draws a pixel at the specified coordinates with the specified color
void LCD_DrawPixel(LCD_Handler* lcd, int16_t x, int16_t y, uint32_t color);
//Draws a line with the specified coordinates and color
void LCD_DrawLine(LCD_Handler* lcd, int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint32_t color);
//Draws a rectangle with the specified coordinates and color
void LCD_DrawRectangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint32_t color);
//Draws a filled rectangle with the specified coordinates and color
void LCD_DrawFilledRectangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint32_t color);
//Draws a triangle
void LCD_DrawTriangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, uint32_t color);
//Draws a filled triangle
void LCD_DrawFilledTriangle(LCD_Handler* lcd, int16_t x1, int16_t y1, int16_t x2, int16_t y2, int16_t x3, int16_t y3, uint32_t color);
//Draws a circle with the specified center and radius
void LCD_DrawCircle(LCD_Handler* lcd, int16_t x0, int16_t y0, int16_t r, uint32_t color);
//Draws a filled circle
void LCD_DrawFilledCircle(LCD_Handler* lcd, int16_t x0, int16_t y0, int16_t r, uint32_t color);
//Transfers a memory block to the display (e.g. part of an image)
void LCD_DrawImage(LCD_Handler* lcd, uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t *data, uint8_t dma_use_flag);
//Reads data from the display window with the top-left corner (x, y), width w, height h into the data buffer
//Data buffer format is 16-bit (R5G6B5 color)
void LCD_ReadImage(LCD_Handler* lcd, uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t *data);
//Displays a character at the specified position
void LCD_WriteChar(LCD_Handler* lcd, uint16_t x, uint16_t y, char ch, FontDef *font, uint32_t txcolor, uint32_t bgcolor, LCD_PrintSymbolMode modesym);
//Displays a string of characters at the specified position
void LCD_WriteString(LCD_Handler* lcd, uint16_t x, uint16_t y, const char *str, FontDef *font, uint32_t color, uint32_t bgcolor, LCD_PrintSymbolMode modesym);
//Converts a color from R8G8B8 (24 bits) to 16-bit R5G6B5
uint16_t LCD_Color(LCD_Handler *lcd, uint8_t r, uint8_t g, uint8_t b);
uint16_t LCD_Color_24b_to_16b(LCD_Handler *lcd, uint32_t color);

#endif /* inc_display_h_ */

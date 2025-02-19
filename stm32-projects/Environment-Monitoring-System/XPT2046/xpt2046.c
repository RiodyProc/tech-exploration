#include <string.h>
#include "xpt2046.h"

XPT2046_Handler *touch = 0;

static uint8_t get_touch(XPT2046_Handler *t);
static int get_adc_in(XPT2046_Handler *t, uint8_t command, uint8_t repeat);
static uint32_t connect_on(XPT2046_ConnectionData *cnt_data);
static void connect_off(XPT2046_ConnectionData *cnt_data, uint32_t speed);

/*
 * Initialization of the touchscreen handler
 * t - pointer to the user-created handler
 * timer_period - period of the internal timer of the handler
 * cnt_data - pointer to the XPT2046 connection data
 */
void XPT2046_InitTouch(XPT2046_Handler *t, uint32_t timer_period, XPT2046_ConnectionData *cnt_data)
{
	memset(t, 0, sizeof(XPT2046_Handler));  // Memory initialization occupied by the handler.
	t->timer_period = timer_period; 		// Initialize the internal timer period of the handler.
	t->cnt_data = *cnt_data;				// XPT2046 connection data.
	touch = t;								// Assign the address of the handler to the global pointer
											// This assignment activates interrupt handlers:
											// - XPT2046_EXTICallback - in the EXTI interrupt handler;
											// - XPT2046_TIMCallback - in the system timer interrupt handler.
	int v;									// Wait for successful data exchange with XPT2046.
	do {									// Send a control byte/command for conversion,
		v = get_adc_in(t, XPT2046_INI, 1);	// after which the ADC will be turned off and the PENIRQ line of XPT2046 will be enabled.
	} while (v == -100000);					// This will allow the microcontroller to generate interrupts on the falling edge
											// of the signal at the T_IRQ input.
}

/*
 * Touchscreen polling procedure.
 * Used when polling the touchscreen, when obtaining touchscreen coordinates
 * in an interrupt is disabled.
 * Returns 3 statuses:
 * 0 - polling was successful;
 * 1 - polling not performed, no touchscreen contact;
 * 2 - polling not performed, SPI is busy.
 * If polling is allowed in an interrupt, it always returns 0.
 */
uint8_t XPT2046_GetTouch(XPT2046_Handler *t)
{
	if (!t->fl_interrupt) { 		// If updating touchscreen coordinates in an interrupt is disabled,
		uint8_t res = get_touch(t); // start the touchscreen polling procedure.
		if (res == 1) {				// If "no touchscreen contact" error (1) occurs:
			t->click = 0; 								// - reset the touchscreen contact flag;
			t->status = XPT2046_STATUS_NOCLICK;			// - status "no click"
			t->last_click_time = t->click_time_counter;	// - redefine the duration of the "last touch";
			t->fl_wait_exti = 1;						// - set the flag to wait for enabling the exti interrupt;
			t->timer_counter = t->timer_period;			// - reload the internal timer counter of the handler
														// to indicate the time to wait for enabling the exti interrupt.
			return 1;				// - return the error "no touchscreen contact".
		}							// If polling ended with "spi busy" error (2)
		return res;					// or without errors (0), return these polling completion codes.
	}
	return 0;						// If polling is allowed in an interrupt:
									// without starting the polling procedure, it always returns 0
}

/*
 * EXTI interrupt handler for the falling edge of the signal at the T_IRQ input
 * (add to the appropriate EXTIx_IRQHandler handler - see the stm32f4xx_it.c file)
 */
void XPT2046_EXTICallback(XPT2046_Handler *t)
{
    if (t) {													  // If the handler is initialized:
   		if (!(t->cnt_data.irq_port->IDR & t->cnt_data.irq_pin)) { // If the T_IRQ line is low:
   			t->fl_timer = 1; 									  // - enable the handler's timer;
   			t->timer_counter = t->timer_period;			  		  // - initialize the handler's timer counter;
   			t->click_time_counter = 0; 							  // - initialize the counter for the duration of the current touchscreen touch;
   			NVIC_ClearPendingIRQ(t->cnt_data.exti_irq);			  // - remove the pending interrupt for the exti channel;
   			NVIC_DisableIRQ(t->cnt_data.exti_irq);				  // - disable interrupt for the exti channel.
   		}
    }
	__DSB(); // Data synchronization barrier
}

/*
 * System timer interrupt handler
 * (add to the SysTick_Handler - see the stm32f4xx_it.c file)
 */
void XPT2046_TIMCallback(XPT2046_Handler *t)
{
	if (t) {												// If the handler is initialized:
		if (t->fl_timer) { 									// If the handler's timer is enabled,
			t->timer_counter--;								// decrease the handler's timer counter.
			if (t->timer_counter) return;					// If the timer counter has not reached zero, exit.
			t->timer_counter = t->timer_period;				// Reload the handler's timer counter.
			if (t->fl_wait_exti) {							// If the exti wait flag is set,
				t->fl_wait_exti = 0;						// reset this flag
				t->fl_timer = 0;							// and disable the handler's timer.
				NVIC_ClearPendingIRQ(t->cnt_data.exti_irq);	// Remove the pending interrupt for the exti channel.
				NVIC_EnableIRQ(t->cnt_data.exti_irq); 		// Enable interrupt for the exti channel.
				__DSB();									// Data synchronization barrier.
				return;										// Exit the handler.
			}
			if (t->fl_interrupt) {			// If updating touchscreen coordinates in an interrupt is enabled,
				uint8_t res = get_touch(t); // start the touchscreen polling procedure.
				if (res == 1) { 			// If an error occurs while polling the touchscreen:
					t->click = 0; 								// - reset the touchscreen contact flag;
					t->last_click_time = t->click_time_counter;	// - redefine the duration of the "last touch";
					t->fl_wait_exti = 1;						// - set the flag to wait for enabling the exti interrupt;
					t->timer_counter = t->timer_period;			// - reload the internal timer counter of the handler
																// to indicate the time to wait for enabling the exti interrupt.
					__DSB();  				// Data synchronization barrier.
					return;					// Exit the handler.
				}
			}
			t->click_time_counter++; 		// Increase the counter for the duration of the current touchscreen touch.
		}
	}
	__DSB();								// Data synchronization barrier.
}

/*
 * Measure temperature using the built-in XPT2046 temperature sensor.
 * Returns temperature in degrees Celsius.
 * Returns -100000 in case of an error (minus one hundred thousand).
 */
int XPT2046_GetTemp(XPT2046_Handler *t)
{
  	// First voltage measurement
	int v1 = get_adc_in(t, XPT2046_TEMP0, XPT2046_OTHER_REPEATED_MEASUREMENTS);
	// Second voltage measurement (with a 91 times higher current)
	int v2 = get_adc_in(t, XPT2046_TEMP1, XPT2046_OTHER_REPEATED_MEASUREMENTS);
	if (v1 == -100000 || v2 == -100000) return -100000; // Return error in case of SPI being busy
	// Calculate temperature using the formula (see the XPT2046 datasheet):
	//                t = 2.573 * (v2 - v1) - 273
	return ((((2573 * XPT2046_VREF) / 1000) * (v2 - v1)) >> 12) - 273;
}

/*
 * Measurement of the battery voltage at the VBAT input of the XPT2046 (pin 7 of the TSSOP-16 package).
 * Returns the voltage in millivolts.
 * Returns -100000 in case of an error (minus one hundred thousand).
 */
int XPT2046_GetVbat(XPT2046_Handler *t)
{
	int v = get_adc_in(t, XPT2046_VBAT, XPT2046_OTHER_REPEATED_MEASUREMENTS);
	if (v == -100000) return -100000;
											// The VBAT input of the XPT2046 has a voltage divider
	return 4 * ((v * XPT2046_VREF) / 4096); // The voltage divider reduces the input voltage by 4.
											// This is why I first divide by 4096 and then multiply by 4,
											// although it could be written as division by 1024 for clarity.
}

/*
 * Measurement of the voltage at the AUX input of the XPT2046 (pin 8 of the TSSOP-16 package).
 * Returns the voltage in millivolts.
 * Returns -100000 in case of an error (minus one hundred thousand).
 */
int XPT2046_GetAux(XPT2046_Handler *t)
{
	int v = get_adc_in(t, XPT2046_AUX, XPT2046_OTHER_REPEATED_MEASUREMENTS);
	if (v == -100000) return -100000;
	return (v * XPT2046_VREF) / 4096;
}

/*
 * Measurement of the XPT2046 ADC voltage on a given input (specified by the command).
 * Returns the measurement result as a 12-bit digital value corresponding to the measured voltage.
 * If necessary, the measured parameter can be converted to voltage in volts/millivolts
 * by using the formula: Vv = Vb * VREF / 4096, where:
 * Vb - the 12-bit measured value returned by this procedure;
 * Vm - the calculated voltage in volts/millivolts;
 * VREF - the reference voltage of the ADC in volts/millivolts.
 * Returns -100000 (minus one hundred thousand) in case of an error.
 * The command parameter determines the control byte (command) to select the ADC input and XPT2046 conversion parameters.
 * The repeat parameter defines the number of measurements for subsequent averaging.
 * The first measurement is discarded (ignored). Thus, the actual number of measurements for averaging is repeat - 1.
 */
static int get_adc_in(XPT2046_Handler *t, uint8_t command, uint8_t repeat)
{
	SPI_TypeDef *spi = t->cnt_data.spi;
	if (spi->CR1 & SPI_CR1_SPE ) { return -100000; }   // SPI is busy because it is enabled.
	uint32_t param_spi = connect_on(&t->cnt_data);	   // Connect XPT2046 to the MCU via SPI.
	uint32_t irq_exti_enable = NVIC_GetEnableIRQ(t->cnt_data.exti_irq); // If EXTI interrupt is enabled on the T_IRQ input
	if (irq_exti_enable) {										   // Disable it
		NVIC_DisableIRQ(t->cnt_data.exti_irq);
	}
	uint8_t f_first = 1;								// Declare and set the "first measurement" flag
	uint8_t f_full_res = 0;								// Declare and reset the "measured parameter" flag
	uint8_t response_h, response_l;						// Variables to store the high and low response bits from the XPT2046
	uint8_t cmd[2] = {command, XPT2046_NOP};			// Form the command string
	uint8_t n = 2;										// Number of commands in the command string
	uint8_t *com_ptr = cmd;								// Pointer to the current command in the command string
	int adc[repeat - 1];								// Array for repeat - 1 measurements
	int avr = 0;										// Variable to accumulate the sum of the measured parameter
	// Loop through the number of XPT2046 command transmissions (repeat * number of commands in the string)
	for (int i = 0; i < repeat * n; i++) {
		spi->DR = *com_ptr;								// Send the command to XPT2046 via SPI
		while (!(spi->SR & SPI_SR_RXNE)) { __NOP(); }	// Wait for a response from XPT2046
		com_ptr++;										// Move the pointer to the next command
		if (com_ptr == cmd + n) {						// If we reached the end of the command string, move the pointer back to the beginning
			com_ptr = cmd;
		}
		if (!i) {										// The very first response from XPT2046
			response_h = spi->DR;						// is ignored because it doesn't contain useful information
		}
		else {
			if (i & 1) {								// Responses to odd requests from XPT2046
				response_h = spi->DR;					// are the high bits of the measured parameter
			}
			else {										// Responses to even requests from XPT2046
				response_l = spi->DR;					// are the low bits of the measured parameter.
				f_full_res = 1;							// The low bit indicates that the measurement is complete.
			}											// So we set the "measured parameter" flag.
		}
		if (i == repeat * n - 1) {						// If we transmitted the last command in the loop
			spi->DR = XPT2046_NOP;						// we need to send a "dummy" command to get the low bit of the measured parameter.
			while (!(spi->SR & SPI_SR_RXNE)) {__NOP();}	// Wait for the response, then store it.
			response_l = spi->DR;
			f_full_res = 1;								// Set the "measured parameter" flag.
			uint8_t cmd_ini[3] = {XPT2046_INI, XPT2046_NOP, XPT2046_NOP}; //"Initialization" of XPT2046 (enables PENIRQ).
			for (int j = 0; j < 3; j++) {
				spi->DR = cmd_ini[j];
				while (!(spi->SR & SPI_SR_RXNE)) {__NOP();}
			}
			connect_off(&t->cnt_data, param_spi);		// Disconnect XPT2046 from MCU
		}
		// We discard the first measurement because it is noisy
		if (f_full_res) {								 						  // If the "measured parameter" flag is set,
			if (!f_first && i >= 2) {											  // and the "first measurement" flag is reset
				adc[i / 2 - 1] = (((response_h << 8) | response_l) >> 3) & 0xfff; // Save the measured parameter in the array
				avr += adc[i / 2 - 1];											  // Accumulate the measured parameter
			}
			else {
				f_first = 0; 							// Reset the "first measurement" flag
			}
			f_full_res = 0;								// Reset the "measured parameter" flag
		}
	}
	if (repeat > 1) {									// If the number of repetitions is greater than 1,
		avr /= repeat - 1;								// calculate the average of the measured parameter
	}
	if (irq_exti_enable) {							// If EXTI interrupt on the T_IRQ input was enabled:
		NVIC_EnableIRQ(t->cnt_data.exti_irq);		// Re-enable EXTI interrupt on the T_IRQ input.
	}
	return avr; // Return the result of the procedure
}

/* Connecting to the XPT2046 controller while saving the SPI parameters */
static uint32_t connect_on(XPT2046_ConnectionData *cnt_data)
{
	SPI_TypeDef *spi = cnt_data->spi;
	uint32_t param = spi->CR1; 			// Save the current SPI parameters
	//--------------------------------- SPI parameters for XPT2046 ------------------------------------
	spi->CR1 &= ~ (SPI_CR1_BIDIMODE |  	// Single-line mode disabled
				   SPI_CR1_RXONLY |   	// Full duplex mode (transmit and receive)
				   SPI_CR1_CRCEN | 		// Hardware CRC calculation disabled
				   SPI_CR1_DFF |		// Data frame format 8 bits
				   SPI_CR1_BR_Msk |		// Mask for SPI speed
				   SPI_CR1_LSBFIRST |	// MSB first
				   SPI_CR1_CPOL | 		// Clock polarity (low)
				   SPI_CR1_CPHA);		// Clock phase (1 edge)
	spi->CR1 |= SPI_CR1_MSTR;			// MCU is master, XPT2046 is slave
	spi->CR1 |= (uint32_t)((cnt_data->speed & 7)<<(3U)); // Set SPI speed for XPT2046
	//-------------------------------------------------------------------------------------------------
	spi->CR1 |= SPI_CR1_SPE; // Enable SPI
	cnt_data->cs_port->BSRR = (uint32_t)cnt_data->cs_pin << 16U; // Connect XPT2046 to SPI (low level on T_CS)
	return param;
}

/*
 * Disconnect from the XPT2046 controller and restore the previous SPI parameters
 * to the state "before connection"
 */
static void connect_off(XPT2046_ConnectionData *cnt_data, uint32_t param)
{
	SPI_TypeDef *spi = cnt_data->spi;
	while (spi->SR & SPI_SR_BSY) { __NOP(); }   // Wait for SPI to be free
	cnt_data->cs_port->BSRR = cnt_data->cs_pin; // Disconnect XPT2046 from SPI (high level on T_CS)
	spi->CR1 &= ~SPI_CR1_SPE;		// Disable SPI and
	spi->CR1 = param; 				// restore previous parameters

}

/*
 * Reading voltages corresponding to the touchscreen touch point
 */
static uint8_t get_touch(XPT2046_Handler *t)
{
	// Check for touch presence before making measurements
	// (measurements are invalid if there is no touch)
	if (t->cnt_data.irq_port->IDR & t->cnt_data.irq_pin) { // If high level on T_IRQ line,
		return 1; 										   // there is no touch
	}
	// Get the voltages (in digital form) corresponding to
	// the touchscreen touch point.
	int x = get_adc_in(t, XPT2046_X, XPT2046_TOUCH_REPEATED_MEASUREMENTS);
	int y = get_adc_in(t, XPT2046_Y, XPT2046_TOUCH_REPEATED_MEASUREMENTS);
	if (x == -100000 || y == -100000) {					   // SPI is busy
		return 2;
	}
	// Check for touch presence again after measurements
	// (measurements are invalid if touch is removed during measurements)
	if (t->cnt_data.irq_port->IDR & t->cnt_data.irq_pin) { // If high level on T_IRQ line,
			return 1; 									   // there is no touch.
	}
	t->click = 1;	// Set the touchscreen touch flag.
	// Determine the touchscreen status
	if (t->status == XPT2046_STATUS_NOCLICK) { 					// "click" status
		t->status = XPT2046_STATUS_CLICK;
	}
	else if (t->status == XPT2046_STATUS_CLICK &&				// "hold" status
			// Hold is defined as touching the touchscreen for at least
			// XPT2046_TOUCH_HOLD_TIME milliseconds
			t->click_time_counter * t->timer_period >= XPT2046_TOUCH_HOLD_TIME) {
		t->status = XPT2046_STATUS_HOLD;
	}
	t->point.x = x; // Update touchscreen coordinates
	t->point.y = y;
	return 0;
}

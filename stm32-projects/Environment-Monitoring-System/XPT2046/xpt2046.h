#ifndef INC_XPT2046_H_
#define INC_XPT2046_H_

#include "main.h"

/*************************************** User settings ***************************************/
/*
 * Number of measurement repeats for the voltages corresponding to the x and y coordinates of the touchscreen touch point.
 * This parameter includes one "idle" measurement, which is not used in the average calculation (it is discarded).
 * It is recommended to have at least 9 repeats (8 "useful" + 1 "idle").
 */
#define XPT2046_TOUCH_REPEATED_MEASUREMENTS		17

/*
 * The duration of the current touchscreen touch (in milliseconds), during which
 * such a touch will be recognized as a hold.
 */
#define XPT2046_TOUCH_HOLD_TIME					1500

/*
 * Number of measurement repeats for voltages to determine other parameters (temperature, voltage on
 * VBAT and AUX inputs).
 * This parameter includes one "idle" measurement, which is not used in the average calculation (it is discarded).
 * It is recommended to have at least 9 repeats (8 "useful" + 1 "idle").
 */
#define XPT2046_OTHER_REPEATED_MEASUREMENTS		17

/*
 * Reference voltage, mV.
 * The XPT2046 controller has an internal reference voltage source of 2500 mV (+/- 50 mV).
 * This voltage can be used by the ADC during conversion.
 * Connecting the internal reference voltage source is controlled by the PD1 bit in the control command.
 * It is also possible to use an external reference voltage by disabling the internal reference voltage
 * with the PD1 bit in the control command (see your board's schematic,
 * pin 9 of the XPT2046 in TSSOP-16 package).
 * The XPT2046 specification states that for compatibility with the ADS7843 touchscreen controller
 * (which doesn't have an internal reference voltage), the internal reference voltage of the XPT2046 should
 * be disabled when measuring voltages on the sensor (PD1 = 0).
 * In this driver, both internal and external reference voltage sources can be used.
 */
#define XPT2046_INTERNAL_VREF //Use internal reference voltage source.
							  //If using an external reference voltage,
							  //comment out this line.

#ifdef XPT2046_INTERNAL_VREF
#define XPT2046_VREF  2550 //Internal reference voltage (2500 mV +/- 50 mV).
						   //It is defined in the XPT2046 controller specification.
#else
#define XPT2046_VREF  2900 //External reference voltage.
						   //Measured on pin 9 of the XPT2046 in TSSOP-16 package.
						   //This is the voltage for my board. Yours might be slightly different.
#endif
/*********************************** End of user settings *************************************/


/*************************** Control command structure for XPT2046 controller *****************************
 * BIT7    BIT6    BIT5    BIT4    BIT3    BIT2    BIT1    BIT0
 *   S      A2      A1      A0     MODE   SER/DFR   PD1     PD0
 * S - Start bit. The control command is identified by the S bit set to 1.
 * A2 - A0 - Multiplexer channel selection bits (which input to connect to the ADC).
 * MODE - Bit to select conversion resolution (0 - 12-bit, 1 - 8-bit).
 * SER/DFR - ADC input type selection bit (0 - differential, 1 - single-ended).
 * To read data from the touchscreen, use the differential input.
 * For measuring absolute voltages on the internal temperature sensor and
 * the VBAT and AUX inputs, use the single-ended ADC input.
 * PD1 - Bit for enabling or disabling the internal reference voltage:
 *    0 - disabled, external reference voltage is used (connected to pin 9 of XPT2046 in TSSOP-16 package),
 *    1 - enabled, internal reference voltage is used (built-in VREF source in XPT2046 at 2500 mV +/- 50 mV).
 * PD0 - Bit to control the ADC shutdown after conversion (0 - shutdown, 1 - don't shutdown).
 */

/************************** XPT2046 control commands for 8-bit SPI ********************************/
#define XPT2046_NOP 	0x00 //00000000 - "No-op" command (start bit S cleared)
#define XPT2046_INI		0x80 //10000000 - Disable ADC and internal reference voltage after conversion
							 //to enable PENIRQ - so-called "initialization".
#ifdef XPT2046_INTERNAL_VREF
/* 12-bit conversion, internal reference voltage, differential ADC input,
 * ADC does not shutdown after conversion */
#define XPT2046_Y 		0x93 //10010011 - Measure voltage on sensor for Y coordinate
#define XPT2046_X 		0xD3 //11010011 - Measure voltage on sensor for X coordinate
/* 12-bit conversion, internal reference voltage, single-ended ADC input,
 * ADC does not shutdown after conversion */
#define XPT2046_TEMP0 	0x87 //10000111 - First voltage measurement for temperature determination
#define XPT2046_TEMP1 	0xF7 //11110111 - Second voltage measurement (with increased current)
#define XPT2046_VBAT	0xA7 //10100111 - Measure voltage on VBAT input
#define XPT2046_AUX		0xE7 //11100111 - Measure voltage on AUX input
#else
/* 12-bit conversion, external reference voltage, differential ADC input,
 * ADC does not shutdown after conversion */
#define XPT2046_Y 		0x91 //10010001 - Measure voltage on sensor for Y coordinate
#define XPT2046_X 		0xD1 //11010001 - Measure voltage on sensor for X coordinate
/* 12-bit conversion, external reference voltage, single-ended ADC input,
 * ADC does not shutdown after conversion */
#define XPT2046_TEMP0 	0x85 //10000101 - First voltage measurement for temperature determination
#define XPT2046_TEMP1 	0xF5 //11110101 - Second voltage measurement (with increased current)
#define XPT2046_VBAT	0xA5 //10100101 - Measure voltage on VBAT input
#define XPT2046_AUX		0xE5 //11100101 - Measure voltage on AUX input
#endif
/*********************************************************************************************************/

/* Touchscreen statuses */
typedef enum {
	XPT2046_STATUS_NOCLICK = 0,  //no click
	XPT2046_STATUS_CLICK,		 //click
	XPT2046_STATUS_HOLD			 //hold
} XPT2046_status;

/* XPT2046 connection data */
typedef struct {
	SPI_TypeDef *spi;		//SPI
	uint8_t speed;			//SPI speed (from 0 - clk/2 to 7 - clk/256)
	GPIO_TypeDef *cs_port;	//Port with T_CS pin
	uint16_t cs_pin;		//Pin number of the port with T_CS (configured as output)
	GPIO_TypeDef *irq_port;	//Port with T_IRQ pin
	uint16_t irq_pin;		//Pin number of the port with T_IRQ (configured as input with EXTI interrupt enabled)
	IRQn_Type exti_irq;		//External interrupt EXTI for the T_IRQ pin
} XPT2046_ConnectionData;

/* Touch coordinates data */
typedef struct {
	int x, y;
} tPoint;

/* Coefficients for converting touchscreen coordinates to display coordinates */
typedef struct {
	int64_t	Dx1, Dx2, Dx3, Dy1, Dy2, Dy3, D;
} tCoef;

/* Touchscreen handler */
typedef struct {
	XPT2046_ConnectionData cnt_data;		//XPT2046 connection data
	volatile tPoint point;					//Coordinates of the last touch (in touchscreen coordinates)
	volatile uint32_t last_click_time; 		//Duration of the last touch, expressed in the number of system timer interrupts
											//that occurred from the last touch down to the release of the touchscreen
	volatile uint32_t click_time_counter;	//Current touch duration counter (also expressed in the number of system timer interrupts)
	uint8_t fl_interrupt;					//Flag enabling touchscreen coordinate update in interrupt
	volatile uint8_t click;					//Flag indicating whether there is a touch or not
	tCoef coef;								//Conversion coefficients for touchscreen to display coordinates
	volatile uint8_t fl_timer;				//Flag enabling or disabling the internal timer of the handler
	volatile uint32_t timer_counter;		//Internal timer counter of the handler
	uint32_t timer_period;					//Internal timer period
	volatile uint8_t fl_wait_exti;			//Flag waiting for EXTI interrupt permission
	volatile XPT2046_status status;			//Touchscreen polling status: no click, click, hold
} XPT2046_Handler;

extern XPT2046_Handler touch1; // for control in main.c and TouchController.c

/* Global touchscreen handler variable */
extern XPT2046_Handler *touch;

/* EXTI interrupt handler
   (add to the corresponding EXTIx_IRQHandler - see the file stm32f4xx_it.c) */
void XPT2046_EXTICallback(XPT2046_Handler *t);

/* SysTick timer interrupt handler
   (add to SysTick_Handler - see the file stm32f4xx_it.c) */
void XPT2046_TIMCallback(XPT2046_Handler *t);

/* Touchscreen handler initialization */
void XPT2046_InitTouch(XPT2046_Handler *t, uint32_t timer_update_period, XPT2046_ConnectionData *cnt_data);

/* Touchscreen polling */
uint8_t XPT2046_GetTouch(XPT2046_Handler *t);

/* Measure temperature using the internal XPT2046 sensor */
int XPT2046_GetTemp(XPT2046_Handler *t);

/* Measure voltage on the AUX input (pin 8 of the XPT2046 in TSSOP-16 package) */
int XPT2046_GetAux(XPT2046_Handler *t);

/* Measure battery voltage on the VBAT input (pin 7 of the XPT2046 in TSSOP-16 package) */
int XPT2046_GetVbat(XPT2046_Handler *t);

#endif /* INC_XPT2046_H_ */

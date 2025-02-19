/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include "cmsis_gcc.h"// for "__asm__("nop");"
#include "ili9341.h"
#include "display.h"
#include "xpt2046.h"
#include "calibrate_touch.h"
#include "bme280.h"
#include "lvgl.h"
#include "lv_conf.h"
#include "LCDController.h"
#include "TouchController.h"
#include "../Drivers/lvgl/examples/lv_examples.h"
#include "../Drivers/UI/ui.h"
#include "rtcrealiz.h"
#include "w25qxx.h"
#include <time.h>

/* Variables ---------------------------------------------------------*/
LCD_Handler* lcd;
XPT2046_Handler touch1;
uint32_t millis = 0;

extern char str1[1024];

float tf = 0.0f, pf = 0.0f, af = 0.0f, hf = 0.0f;

void uart_send_string(const char* str);

uint32_t write_address = FLASH_START_ADDRESS;   
volatile uint8_t is_flash_write_needed = 0; // flag of writening to flash
#define SENSOR_DATA_SIZE	 10 // 2 temp + 2 humid + 2 press + 4 time (byte)

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_SPI1_Init(void);
static void MX_USART1_UART_Init(void);
static void MX_I2C1_Init(void);
static void MX_RTC_Init(void);
static void MX_TIM1_Init(void);
static void MX_SPI3_Init(void);
static void MX_TIM2_Init(void);

// for extracting page number
uint32_t get_page_number(uint32_t address) {
     return address >> 8;
}

// for extracting page address
uint32_t get_page_start_address(uint32_t address) {
    return address & ~(PAGE_SIZE - 1);
}

//  to find the beginning of the time range writening
uint32_t find_start_time(uint32_t low, uint32_t high, uint32_t start_time) {
	uint8_t rx_buf[16];

	uint32_t MidTimestamp;
	uint32_t MidTimestampNext;

	uint32_t Mid_PageNumb = 0;
	// Search the page address with start timestamp
    while (low <= high) {
		MidTimestamp = 0;
		MidTimestampNext = 0;

		Mid_PageNumb = get_page_number(low + (high - low) / 2);
		
		W25_Read_Page(rx_buf, Mid_PageNumb, 6, 4);
		
		MidTimestamp |= (rx_buf[0] << 24);
		MidTimestamp |= (rx_buf[1] << 16);
		MidTimestamp |= (rx_buf[2] << 8);
		MidTimestamp |= (rx_buf[3]);

		W25_Read_Page(rx_buf, Mid_PageNumb + 1, 6, 4);

		MidTimestampNext |= (rx_buf[0] << 24);
		MidTimestampNext |= (rx_buf[1] << 16);
		MidTimestampNext |= (rx_buf[2] << 8);
		MidTimestampNext |= (rx_buf[3]);
        
		if (MidTimestamp < start_time && start_time < MidTimestampNext){
            low = (Mid_PageNumb) * PAGE_SIZE;
			break;
    	}
		else if(MidTimestamp < start_time)
			low = (Mid_PageNumb + 1) * PAGE_SIZE;
        else
			high = (Mid_PageNumb - 1) * PAGE_SIZE;
    }

	uint32_t ST_PageOffset = 6;
	uint32_t ST_PageAddr = get_page_start_address(low);

	// Search the address with start_time in known page
    while (ST_PageOffset < PAGE_SIZE) {
		// Read 4 bytes of time from the current record
        W25_Read_Page(rx_buf, Mid_PageNumb, ST_PageOffset, 4);
        MidTimestamp |= (rx_buf[0] << 24);
        MidTimestamp |= (rx_buf[1] << 16);
        MidTimestamp |= (rx_buf[2] << 8);
        MidTimestamp |= (rx_buf[3]);

        if (MidTimestamp >= start_time) {
			return (ST_PageAddr + ST_PageOffset);
        }

        ST_PageOffset += 16; // Move to the next entry
    }

    return -1;
}

// to get time in the Unix timestamp format
uint32_t get_unix_timestamp(int year, int month, int day, int hour, int minute, int second) {
    struct tm time_info = {0};
    time_info.tm_year = year - 1900;
    time_info.tm_mon  = month - 1;
    time_info.tm_mday = day;
    time_info.tm_hour = hour;
    time_info.tm_min  = minute;
    time_info.tm_sec  = second;
    return (uint32_t)mktime(&time_info);
}

// to display the time in human-readable format
void sprint_human_readable_time(uint32_t timestamp, char *str) {
    int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int year = 1970, month = 1, day = 1;
    int hour, minute, second;

    // Calculate the number of years
    while (timestamp >= (365 * 24 * 60 * 60)) {
        int days_in_year = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 366 : 365;
        if (timestamp >= (days_in_year * 24 * 60 * 60)) {
            timestamp -= days_in_year * 24 * 60 * 60;
            year++;
        } else {
            break;
        }
    }

    // Leap year
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        days_in_month[1] = 29;
    }

    // Determining the month and day
    while (timestamp >= (days_in_month[month - 1] * 24 * 60 * 60)) {
        timestamp -= days_in_month[month - 1] * 24 * 60 * 60;
        month++;
        if (month > 12) {
            month = 1;
        }
    }
	
	// Month
    day += timestamp / (24 * 60 * 60);
    timestamp %= (24 * 60 * 60);
	
	// Time
    hour = timestamp / 3600;
    timestamp %= 3600;
    minute = timestamp / 60;
    second = timestamp % 60;
    
	// AM/PM
    char period[3] = "AM";  // by default - AM
	if (hour >= 12) {
        period[0] = 'P';  // PM
        if (hour > 12) {
            hour -= 12;  //  to 12-h format
        }
    } else if (hour == 0) {
        hour = 12; 
	}

    sprintf(str, "\n\rDate : %04d-%02d-%02d Date %02d:%02d:%02d %s\r\n",
        year,
        month,
        day,
        hour,
        minute,
        second,
        period);
}

// for temperature and humidity: 25.5 * 100 -> 2550 (without float)
uint16_t encode_TempHum(float data) {
    int data_scaled = (int)(data * 100);

    // uint16_t (0-2^16)
    if (data_scaled < 0) {
        return 0; 
    } else if (data_scaled > 65535) {
        return 65535; 
    }

    return (uint16_t)data_scaled;
}

// for temperature and humidity
float decode_TempHum(uint16_t encoded_data) {
    return encoded_data / 100.0f;
}

// for pressure
uint16_t encode_Press(float data) {
    int data_scaled = (int)(data * 10);

    if (data_scaled < 0) {
        return 0; 
    } else if (data_scaled > 65535) {
        return 65535; 
    }

    return (uint16_t)data_scaled;
}

// for pressure
float decode_Press(uint16_t encoded_data) {
    return encoded_data / 10.0f;
}

// Reading and writing data from the sensor while timer period is
void write_to_flash_and_read_back(void) {
	// Reading data from sensor
	uint16_t encoded_temp  = encode_TempHum(BME280_ReadTemperature());
	uint16_t encoded_humid = encode_TempHum(BME280_ReadHumidity());
	uint16_t encoded_press = encode_Press(BME280_ReadPressure()/1000.0f);
	
	// Reading RTC data
    uint8_t second = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetSecond(RTC));
    uint8_t minute = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetMinute(RTC));
	uint8_t hour = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetHour(RTC));
	
	if (LL_RTC_TIME_GetFormat(RTC) == LL_RTC_TIME_FORMAT_PM) {
	    if (hour < 12) {
	        hour += 12;
	    }
	}
	
	// + Data time info
	uint8_t day = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetDay(RTC));
	uint8_t month = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetMonth(RTC));
	int year = 2000 + __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetYear(RTC));
	

	// In Unix timestamp
    uint32_t timestamp = get_unix_timestamp(year, month, day, hour, minute, second);
	
	uint8_t sensor_data_buffer[SENSOR_DATA_SIZE] = {
	    encoded_temp >> 8,  encoded_temp & 0xFF,
	    encoded_humid >> 8, encoded_humid & 0xFF,
	    encoded_press >> 8, encoded_press & 0xFF,
    	(timestamp >> 24) & 0xFF, (timestamp >> 16) & 0xFF,
    	(timestamp >> 8) & 0xFF, timestamp & 0xFF
	};

	// Determining memory boundaries
	uint32_t page_number = get_page_number(write_address);
	uint32_t page_start_addr = get_page_start_address(write_address);

	if (write_address + SENSOR_DATA_SIZE >= page_start_addr + PAGE_SIZE) {
	    write_address = page_start_addr + PAGE_SIZE;
	}

	if ((write_address & (SECTOR_SIZE - 1)) == 0) {
    	W25_Erase_Sector(write_address);  // sector(4 КB)
	}
	
	// Writing data into the flash
	page_number = get_page_number(write_address);
	page_start_addr = get_page_start_address(write_address);

	W25_Write_Data(write_address, sensor_data_buffer, SENSOR_DATA_SIZE);
	
	// Read page's data and sending over UART
    uart_send_string("\n\rFlash Page Data:\n\r");

    extern uint8_t rx_buf[1025];

	W25_Read_Page(rx_buf, page_number, 0, PAGE_SIZE);

    unsigned int print_addr;

	for(uint8_t i = 0; i < 16; i++)
	{
		print_addr =  page_start_addr + i * 16; //page_number * i + i * 16;
	    sprintf(str1, "%08X: ", print_addr);
	    uart_send_string(str1);
	
	    for(uint8_t j = 0; j < 16; j++)
	    {
			// in hex
	        sprintf(str1, "%02X ", rx_buf[(uint16_t)i * 16 + (uint16_t)j]);
	        uart_send_string(str1);
	
	        if(j == 7) uart_send_string("|");
	        else uart_send_string(" ");
	    }
	
	    uart_send_string("| ");
	
	    for(uint8_t j = 0; j < 7; j += 2)
	    {
	    	uint16_t dataI = ((uint16_t)(rx_buf[(uint16_t)i * 16 + (uint16_t)j] << 8))
	    			 	 	 | (uint16_t)(rx_buf[(uint16_t)i * 16 + (uint16_t)j + 1]);
			// Temperature
			if(dataI != 0xFFFF){
				float dataF;

				// for time of writing
				if(j == 6){

				    uint32_t timestamp = 0;
				    timestamp |= (rx_buf[(uint16_t)i * 16 + (uint16_t)j] << 24);
				    timestamp |= (rx_buf[(uint16_t)i * 16 + (uint16_t)j + 1] << 16);
				    timestamp |= (rx_buf[(uint16_t)i * 16 + (uint16_t)j + 2] << 8);
				    timestamp |= (rx_buf[(uint16_t)i * 16 + (uint16_t)j + 3]);

					sprint_human_readable_time(timestamp, str1);
				}
				// for pressure > 1000 value decoding
				else if(j == 4){
					dataF = decode_Press(dataI);
	        		sprintf(str1, "%03.2f ", dataF);
				}
				// for temperature and humidity < 100 value decoding
				else{// if(j == 2 || j == 0)
					dataF = decode_TempHum(dataI);
	        		sprintf(str1, "%03.2f ", dataF);
				}
			}else
	        	sprintf(str1, "%02X ", dataI);

	        uart_send_string(str1);
	    }
	
	    uart_send_string("\r\n");
	}
	uart_send_string("\r\n");


    //  Updating the record pointer (ring buffer)
    write_address += SENSOR_DATA_SIZE + 6;
    if (write_address >= FLASH_END_ADDRESS) {
        write_address = FLASH_START_ADDRESS;  
    }
}

// LVGL block updating
void update_time_and_date(lv_timer_t * timer) {
	char str[512];

    const uint8_t second = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetSecond(RTC));
    const uint8_t minute = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetMinute(RTC));
    const uint8_t hour = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetHour(RTC));
	
	const uint8_t day = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetDay(RTC));
	const uint8_t month = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetMonth(RTC));
	const uint16_t year = 2000 + __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetYear(RTC));
    
    sprintf(str, "%02d:%02d:%02d", hour, minute, second);
    lv_label_set_text(ui_lableTime, str);
    sprintf(str, "%02d-%02d-%04d", day, month, year);
    lv_label_set_text(ui_lableDate, str);

    if(LL_RTC_TIME_GetFormat(RTC) == LL_RTC_TIME_FORMAT_AM_OR_24)
    	lv_label_set_text(ui_labeltimeformat, "AM");
    else if (LL_RTC_TIME_GetFormat(RTC) == LL_RTC_TIME_FORMAT_PM)
    	lv_label_set_text(ui_labeltimeformat, "PM");
    else
    	lv_label_set_text(ui_labeltimeformat, "...");
}

void update_TempChart(int new_value) {
	lv_chart_series_t * ser = lv_chart_get_series_next(ui_tempCH, NULL);
	
	lv_chart_set_next_value(ui_tempCH, ser, new_value);  
	lv_chart_refresh(ui_tempCH);
}
void update_HumidChart(int new_value) {
	lv_chart_series_t * ser = lv_chart_get_series_next(ui_humidCH, NULL);
	
	lv_chart_set_next_value(ui_humidCH, ser, new_value);  
	lv_chart_refresh(ui_humidCH);
}
void update_PressChart(int new_value) {
	lv_chart_series_t * ser = lv_chart_get_series_next(ui_pressCH, NULL);
	
	lv_chart_set_next_value(ui_pressCH, ser, new_value); 
	lv_chart_refresh(ui_pressCH);
}

void timer_callback() {
	tf = BME280_ReadTemperature();
	pf = BME280_ReadPressure();
	hf = BME280_ReadHumidity();

	static char str[32];  

	sprintf(str,"TEMP: %.2f °C", tf);
	lv_label_set_text(ui_tempMain, str);
	sprintf(str,"%.2f °C", tf); 
	lv_label_set_text(ui_valTempSCR1, str);
	
	sprintf(str,"RH: %.3f %%", hf); 
	lv_label_set_text(ui_rhMain, str); 
	sprintf(str,"%.3f %%", hf);  
	lv_label_set_text(ui_valHumidSCR2, str);
	
	sprintf(str,"P: %.3f hPa", pf/1000.0f);
	lv_label_set_text(ui_pMain, str);  
	sprintf(str,"%.3f hPa", pf/1000.0f); 
	lv_label_set_text(ui_valPressSCR3, str);

    update_TempChart(tf);
    update_PressChart(pf/1000);
    update_HumidChart(hf);
}

// Transmit data over UART
void uart_send_string(const char* str) {
    while (*str != '\0') {  // While the null-terminator is not reached
        LL_USART_TransmitData8(USART1, *str);  // Send the current byte (write to register)
        while (!LL_USART_IsActiveFlag_TC(USART1)) {}  // Wait until transmission is complete
        str++;  // Move to the next character
    }
}

// Receive data over UART
void uart_receive_string(uint8_t *buffer, uint16_t size) {
    for (uint16_t i = 0; i < size; i++) {
        while (!LL_USART_IsActiveFlag_RXNE(USART1));  // Wait until a byte is received
        buffer[i] = LL_USART_ReceiveData8(USART1);    // Read the byte from the register

        // If Enter (\r or \n) is detected, terminate input
        if (buffer[i] == '\r' || buffer[i] == '\n') {
            buffer[i] = '\0';
            return;
        }
    }
    buffer[size] = '\0';  // Ensure null termination
}

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

	/* Enable instruction cache */
	#if (INSTRUCTION_CACHE_ENABLE != 0U)
		((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR |= (0x1UL << (9U));
	#endif

	/* Enable data cache */
	#if (DATA_CACHE_ENABLE != 0U)
		((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR |= (0x1UL << (10U));
	#endif

	/* Enable instruction prefetch */
	#if (PREFETCH_ENABLE != 0U)
		((FLASH_TypeDef *) ((0x40000000UL + 0x00020000UL) + 0x3C00UL))->ACR |= (0x1UL << (8U));
	#endif

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_SYSCFG);
  LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_PWR);

  /* System interrupt init*/
  NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_4);

  /* SysTick_IRQn interrupt configuration */
  NVIC_SetPriority(SysTick_IRQn, NVIC_EncodePriority(NVIC_GetPriorityGrouping(),15, 0));

  /* Configure the system clock */
  SystemClock_Config();

  SysTick_Config(SystemCoreClock/1000);

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_SPI1_Init();
  MX_USART1_UART_Init();
  MX_I2C1_Init();
  MX_RTC_Init();
  MX_TIM1_Init();
  MX_SPI3_Init();
  MX_TIM2_Init();

// BME280 INITING
  uart_send_string("\n\rBME280INITing\n\r");
  BME280_Init();
  uart_send_string("\n\rBME280INITed\n\r");
//

// LCD INITING
  // DMA configuration
  LCD_DMA_TypeDef dma_tx = { .dma    = DMA1,              // DMA controller
                             .stream = LL_DMA_STREAM_5 }; // DMA stream

  // Backlight configuration
  LCD_BackLight_data bkl_data = { .htim_bk        = TIM2,               // Timer for backlight PWM (brightness control)
                                  .channel_htim_bk = LL_TIM_CHANNEL_CH3, // Timer channel for backlight PWM (brightness control)
                                  .blk_port       = 0,                  // GPIO port for simple on/off backlight
                                  .blk_pin        = 0,                  // GPIO pin for simple on/off backlight
                                  .bk_percent     = 100 };               // Backlight brightness in %

  // SPI connection configuration
  LCD_SPI_Connected_data spi_con = { .spi        = SPI3,               // SPI instance
                                     .dma_tx     = dma_tx,             // DMA configuration
                                     .reset_port = LCD_RESET_GPIO_Port, // GPIO port for RES
                                     .reset_pin  = LCD_RESET_Pin,       // GPIO pin for RES
                                     .dc_port    = LCD_DC_GPIO_Port,    // GPIO port for DC
                                     .dc_pin     = LCD_DC_Pin,          // GPIO pin for DC
                                     .cs_port    = LCD_CS_GPIO_Port,    // GPIO port for CS
                                     .cs_pin     = LCD_CS_Pin };        // GPIO pin for CS

  #ifndef LCD_DYNAMIC_MEM
    LCD_Handler lcd1;
  #endif

  // Create a display handler for ILI9341
  LCD = LCD_DisplayAdd( LCD,
  #ifndef LCD_DYNAMIC_MEM
                        &lcd1,
  #endif
                        240,  // Display width
                        320,  // Display height
                        ILI9341_CONTROLLER_WIDTH,
                        ILI9341_CONTROLLER_HEIGHT,
                        // Set width and height offsets for non-standard or defective displays:
                        0,   // Width offset of the display matrix
                        0,   // Height offset of the display matrix
                        PAGE_ORIENTATION_LANDSCAPE,
                        ILI9341_Init,
                        ILI9341_SetWindow,
                        ILI9341_SleepIn,
                        ILI9341_SleepOut,
                        &spi_con,
                        LCD_DATA_16BIT_BUS,
                        bkl_data );
  
  lcd = LCD;//pointer to the first display at list
//

// LVGL DISPLAY INITING
  lv_init();
  lv_port_disp_init();
  LCD_Fill(LCD,COLOR_GREEN);
  LL_mDelay(2000);
//

// LVGL TOUCH INITING
    lv_port_indev_init();
	XPT2046_CalibrateTouch(&touch1, lcd); // Starting the calibration procedure
//

// UI INITING
	ui_init();
	lv_scr_load(ui_main);
	lv_chart_set_update_mode(ui_tempCH, LV_CHART_UPDATE_MODE_SHIFT);
	lv_chart_set_update_mode(ui_humidCH, LV_CHART_UPDATE_MODE_SHIFT);
	lv_chart_set_update_mode(ui_pressCH, LV_CHART_UPDATE_MODE_SHIFT);

//// Charts
		lv_timer_create(timer_callback, 1000, NULL);
////

    lv_font_t * font = &lv_font_montserrat_14;  // Select font 

    lv_obj_set_style_text_font(ui_tempMain, font, 0);  
    lv_obj_set_style_text_font(ui_rhMain, font, 0);  
    lv_obj_set_style_text_font(ui_pMain, font, 0);  
    lv_obj_set_style_text_font(ui_valTempSCR1, font, 0);  
    lv_obj_set_style_text_font(ui_valHumidSCR2, font, 0);  
    lv_obj_set_style_text_font(ui_valPressSCR3, font, 0);  
//

// TIMER FOR RTC UPDATE IN LVGL
    lv_timer_create(update_time_and_date, 1000, NULL);  // 1000 ms = 1 s
//
   
//	FLASH
	LL_SPI_Enable(SPI1);

    if(!Flash_Init())
    	uart_send_string("Flash_Init error...");
    else
    	uart_send_string("Flash_Init OK!");
//

// FLASH UPDATING(TIMER)
  // Enable interrupt for timer to update the flash write flag
  LL_TIM_EnableIT_UPDATE(TIM1);

  // Enable interrupt in NVIC
  NVIC_EnableIRQ(TIM1_UP_TIM10_IRQn);
  NVIC_SetPriority(TIM1_UP_TIM10_IRQn, 1);

  LL_TIM_ClearFlag_UPDATE(TIM1);  // Clear the flag

  // Start the timer
  LL_TIM_EnableCounter(TIM1);
//

  /* Infinite loop */
  while (1)
  { 
	  lv_timer_handler();
	  LL_mDelay(5);

	  // writing to flash
	  if(is_flash_write_needed == 1){
		is_flash_write_needed = 0;
		write_to_flash_and_read_back(); 
	  }
  }
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  LL_FLASH_SetLatency(LL_FLASH_LATENCY_3);
  while(LL_FLASH_GetLatency()!= LL_FLASH_LATENCY_3)
  {
  }
  LL_PWR_SetRegulVoltageScaling(LL_PWR_REGU_VOLTAGE_SCALE1);
  LL_RCC_HSE_Enable();

   /* Wait till HSE is ready */
  while(LL_RCC_HSE_IsReady() != 1)
  {

  }
  LL_PWR_EnableBkUpAccess();
  LL_RCC_LSE_Enable();

   /* Wait till LSE is ready */
  while(LL_RCC_LSE_IsReady() != 1)
  {

  }
  LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSE, LL_RCC_PLLM_DIV_12, 96, LL_RCC_PLLP_DIV_2);
  LL_RCC_PLL_Enable();

   /* Wait till PLL is ready */
  while(LL_RCC_PLL_IsReady() != 1)
  {

  }
  while (LL_PWR_IsActiveFlag_VOS() == 0)
  {
  }
  LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
  LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_2);
  LL_RCC_SetAPB2Prescaler(LL_RCC_APB2_DIV_1);
  LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);

   /* Wait till System clock is ready */
  while(LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL)
  {

  }
  LL_Init1msTick(100000000);
  LL_SetSystemCoreClock(100000000);
  LL_RCC_SetTIMPrescaler(LL_RCC_TIM_PRESCALER_TWICE);
}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{
  LL_I2C_InitTypeDef I2C_InitStruct = {0};

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};

  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
  /**I2C1 GPIO Configuration
  PB8   ------> I2C1_SCL
  PB9   ------> I2C1_SDA
  */
  GPIO_InitStruct.Pin = LL_GPIO_PIN_8|LL_GPIO_PIN_9;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_ALTERNATE;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_OPENDRAIN;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;
  GPIO_InitStruct.Alternate = LL_GPIO_AF_4;
  LL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /* Peripheral clock enable */
  LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_I2C1);

  /* I2C1 interrupt Init */
  NVIC_SetPriority(I2C1_EV_IRQn, NVIC_EncodePriority(NVIC_GetPriorityGrouping(),0, 0));
  NVIC_EnableIRQ(I2C1_EV_IRQn);

  /** I2C Initialization
  */
  LL_I2C_DisableOwnAddress2(I2C1);
  LL_I2C_DisableGeneralCall(I2C1);
  LL_I2C_EnableClockStretching(I2C1);
  I2C_InitStruct.PeripheralMode = LL_I2C_MODE_I2C;
  I2C_InitStruct.ClockSpeed = 100000;
  I2C_InitStruct.DutyCycle = LL_I2C_DUTYCYCLE_2;
  I2C_InitStruct.OwnAddress1 = 0;
  I2C_InitStruct.TypeAcknowledge = LL_I2C_ACK;
  I2C_InitStruct.OwnAddrSize = LL_I2C_OWNADDRESS1_7BIT;
  LL_I2C_Init(I2C1, &I2C_InitStruct);
  LL_I2C_SetOwnAddress2(I2C1, 0);
}

/**
  * @brief RTC Initialization Function
  * @param None
  * @retval None
  */
static void MX_RTC_Init(void)
{
  LL_RTC_InitTypeDef RTC_InitStruct = {0};
  LL_RTC_TimeTypeDef RTC_TimeStruct = {0};
  LL_RTC_DateTypeDef RTC_DateStruct = {0};

  if(LL_RCC_GetRTCClockSource() != LL_RCC_RTC_CLKSOURCE_LSE)
  {
    FlagStatus pwrclkchanged = RESET;
    /* Update LSE configuration in Backup Domain control register */
    /* Requires to enable write access to Backup Domain if necessary */
    if (LL_APB1_GRP1_IsEnabledClock (LL_APB1_GRP1_PERIPH_PWR) != 1U)
    {
      /* Enables the PWR Clock and Enables access to the backup domain */
      LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_PWR);
      pwrclkchanged = SET;
    }
    if (LL_PWR_IsEnabledBkUpAccess () != 1U)
    {
      /* Enable write access to Backup domain */
      LL_PWR_EnableBkUpAccess();
      while (LL_PWR_IsEnabledBkUpAccess () == 0U)
      {
      }
    }
    LL_RCC_ForceBackupDomainReset();
    LL_RCC_ReleaseBackupDomainReset();
    LL_RCC_LSE_Enable();

   /* Wait till LSE is ready */
    while(LL_RCC_LSE_IsReady() != 1)
    {
    }
  LL_RCC_SetRTCClockSource(LL_RCC_RTC_CLKSOURCE_LSE);
    /* Restore clock configuration if changed */
    if (pwrclkchanged == SET)
    {
      LL_APB1_GRP1_DisableClock(LL_APB1_GRP1_PERIPH_PWR);
    }
  }

  /* Peripheral clock enable */
  LL_RCC_EnableRTC();
  
  /** Initialize RTC and set the Time and Date
  */
  RTC_InitStruct.HourFormat = LL_RTC_HOURFORMAT_AMPM;
  RTC_InitStruct.AsynchPrescaler = 127;
  RTC_InitStruct.SynchPrescaler = 255;
  LL_RTC_Init(RTC, &RTC_InitStruct);
  LL_RTC_SetAsynchPrescaler(RTC, 127);
  LL_RTC_SetSynchPrescaler(RTC, 255);

  /** Initialize RTC and set the Time and Date
  */
  if(LL_RTC_BAK_GetRegister(RTC, LL_RTC_BKP_DR0) != 0x32F2){

  RTC_TimeStruct.TimeFormat = LL_RTC_TIME_FORMAT_AM_OR_24;
  RTC_TimeStruct.Hours = 2;
  RTC_TimeStruct.Minutes = 1;
  RTC_TimeStruct.Seconds = 40;
  LL_RTC_TIME_Init(RTC, LL_RTC_FORMAT_BCD, &RTC_TimeStruct);
  RTC_DateStruct.WeekDay = LL_RTC_WEEKDAY_MONDAY;
  RTC_DateStruct.Month = LL_RTC_MONTH_JANUARY;
  RTC_DateStruct.Day = 0x1;
  RTC_DateStruct.Year = 0;
  LL_RTC_DATE_Init(RTC, LL_RTC_FORMAT_BCD, &RTC_DateStruct);
    LL_RTC_BAK_SetRegister(RTC,LL_RTC_BKP_DR0,0x32F2);
  }

}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  LL_SPI_InitTypeDef SPI_InitStruct = {0};

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* Peripheral clock enable */
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_SPI1);

  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
  /**SPI1 GPIO Configuration
  PA5   ------> SPI1_SCK
  PA6   ------> SPI1_MISO
  PA7   ------> SPI1_MOSI
  */
  GPIO_InitStruct.Pin = LL_GPIO_PIN_5|LL_GPIO_PIN_6|LL_GPIO_PIN_7;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_ALTERNATE;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;
  GPIO_InitStruct.Alternate = LL_GPIO_AF_5;
  LL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /* SPI1 parameter configuration*/
  SPI_InitStruct.TransferDirection = LL_SPI_FULL_DUPLEX;
  SPI_InitStruct.Mode = LL_SPI_MODE_MASTER;
  SPI_InitStruct.DataWidth = LL_SPI_DATAWIDTH_8BIT;
  SPI_InitStruct.ClockPolarity = LL_SPI_POLARITY_LOW;
  SPI_InitStruct.ClockPhase = LL_SPI_PHASE_1EDGE;
  SPI_InitStruct.NSS = LL_SPI_NSS_SOFT;
  SPI_InitStruct.BaudRate = LL_SPI_BAUDRATEPRESCALER_DIV32;
  SPI_InitStruct.BitOrder = LL_SPI_MSB_FIRST;
  SPI_InitStruct.CRCCalculation = LL_SPI_CRCCALCULATION_DISABLE;
  SPI_InitStruct.CRCPoly = 10;
  LL_SPI_Init(SPI1, &SPI_InitStruct);
  LL_SPI_SetStandard(SPI1, LL_SPI_PROTOCOL_MOTOROLA);

}

/**
  * @brief SPI3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI3_Init(void)
{

  LL_SPI_InitTypeDef SPI_InitStruct = {0};

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* Peripheral clock enable */
  LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_SPI3);

  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
  /**SPI3 GPIO Configuration
  PB3   ------> SPI3_SCK
  PB4   ------> SPI3_MISO
  PB5   ------> SPI3_MOSI
  */
  GPIO_InitStruct.Pin = LL_GPIO_PIN_3|LL_GPIO_PIN_4|LL_GPIO_PIN_5;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_ALTERNATE;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;
  GPIO_InitStruct.Alternate = LL_GPIO_AF_6;
  LL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /* SPI3 DMA Init */

  /* SPI3_TX Init */
  LL_DMA_SetChannelSelection(DMA1, LL_DMA_STREAM_5, LL_DMA_CHANNEL_0);

  LL_DMA_SetDataTransferDirection(DMA1, LL_DMA_STREAM_5, LL_DMA_DIRECTION_MEMORY_TO_PERIPH);

  LL_DMA_SetStreamPriorityLevel(DMA1, LL_DMA_STREAM_5, LL_DMA_PRIORITY_LOW);

  LL_DMA_SetMode(DMA1, LL_DMA_STREAM_5, LL_DMA_MODE_NORMAL);

  LL_DMA_SetPeriphIncMode(DMA1, LL_DMA_STREAM_5, LL_DMA_PERIPH_NOINCREMENT);

  LL_DMA_SetMemoryIncMode(DMA1, LL_DMA_STREAM_5, LL_DMA_MEMORY_INCREMENT);

  LL_DMA_SetPeriphSize(DMA1, LL_DMA_STREAM_5, LL_DMA_PDATAALIGN_HALFWORD);

  LL_DMA_SetMemorySize(DMA1, LL_DMA_STREAM_5, LL_DMA_MDATAALIGN_HALFWORD);

  LL_DMA_DisableFifoMode(DMA1, LL_DMA_STREAM_5);

  /* SPI3 parameter configuration*/
  SPI_InitStruct.TransferDirection = LL_SPI_FULL_DUPLEX;
  SPI_InitStruct.Mode = LL_SPI_MODE_MASTER;
  SPI_InitStruct.DataWidth = LL_SPI_DATAWIDTH_16BIT;
  SPI_InitStruct.ClockPolarity = LL_SPI_POLARITY_LOW;
  SPI_InitStruct.ClockPhase = LL_SPI_PHASE_1EDGE;
  SPI_InitStruct.NSS = LL_SPI_NSS_SOFT;
  SPI_InitStruct.BaudRate = LL_SPI_BAUDRATEPRESCALER_DIV2;
  SPI_InitStruct.BitOrder = LL_SPI_MSB_FIRST;
  SPI_InitStruct.CRCCalculation = LL_SPI_CRCCALCULATION_DISABLE;
  SPI_InitStruct.CRCPoly = 10;
  LL_SPI_Init(SPI3, &SPI_InitStruct);
  LL_SPI_SetStandard(SPI3, LL_SPI_PROTOCOL_MOTOROLA);
  /* USER CODE BEGIN SPI3_Init 2 */

  /* USER CODE END SPI3_Init 2 */

}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{


  LL_TIM_InitTypeDef TIM_InitStruct = {0};

  /* Peripheral clock enable */
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_TIM1);

  /* TIM1 interrupt Init */
  NVIC_SetPriority(TIM1_UP_TIM10_IRQn, NVIC_EncodePriority(NVIC_GetPriorityGrouping(),0, 0));
  NVIC_EnableIRQ(TIM1_UP_TIM10_IRQn);

  /* USER CODE END TIM1_Init 1 */
  TIM_InitStruct.Prescaler = 1525;
  TIM_InitStruct.CounterMode = LL_TIM_COUNTERMODE_UP;
  TIM_InitStruct.Autoreload = 65535;
  TIM_InitStruct.ClockDivision = LL_TIM_CLOCKDIVISION_DIV4;
  TIM_InitStruct.RepetitionCounter = 0;
  LL_TIM_Init(TIM1, &TIM_InitStruct);
  LL_TIM_DisableARRPreload(TIM1);
  LL_TIM_SetClockSource(TIM1, LL_TIM_CLOCKSOURCE_INTERNAL);
  LL_TIM_SetTriggerOutput(TIM1, LL_TIM_TRGO_RESET);
  LL_TIM_DisableMasterSlaveMode(TIM1);

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  LL_TIM_InitTypeDef TIM_InitStruct = {0};
  LL_TIM_OC_InitTypeDef TIM_OC_InitStruct = {0};

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* Peripheral clock enable */
  LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM2);

  TIM_InitStruct.Prescaler = 999;
  TIM_InitStruct.CounterMode = LL_TIM_COUNTERMODE_UP;
  TIM_InitStruct.Autoreload = 209;
  TIM_InitStruct.ClockDivision = LL_TIM_CLOCKDIVISION_DIV1;
  LL_TIM_Init(TIM2, &TIM_InitStruct);
  LL_TIM_DisableARRPreload(TIM2);
  LL_TIM_SetClockSource(TIM2, LL_TIM_CLOCKSOURCE_INTERNAL);
  LL_TIM_OC_EnablePreload(TIM2, LL_TIM_CHANNEL_CH3);
  TIM_OC_InitStruct.OCMode = LL_TIM_OCMODE_PWM1;
  TIM_OC_InitStruct.OCState = LL_TIM_OCSTATE_DISABLE;
  TIM_OC_InitStruct.OCNState = LL_TIM_OCSTATE_DISABLE;
  TIM_OC_InitStruct.CompareValue = 104;
  TIM_OC_InitStruct.OCPolarity = LL_TIM_OCPOLARITY_HIGH;
  LL_TIM_OC_Init(TIM2, LL_TIM_CHANNEL_CH3, &TIM_OC_InitStruct);
  LL_TIM_OC_DisableFast(TIM2, LL_TIM_CHANNEL_CH3);
  LL_TIM_SetTriggerOutput(TIM2, LL_TIM_TRGO_RESET);
  LL_TIM_DisableMasterSlaveMode(TIM2);
  
  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
  /**TIM2 GPIO Configuration
  PB10   ------> TIM2_CH3
  */
  GPIO_InitStruct.Pin = LL_GPIO_PIN_10;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_ALTERNATE;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_LOW;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;
  GPIO_InitStruct.Alternate = LL_GPIO_AF_1;
  LL_GPIO_Init(GPIOB, &GPIO_InitStruct);

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  LL_USART_InitTypeDef USART_InitStruct = {0};

  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* Peripheral clock enable */
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_USART1);

  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);
  /**USART1 GPIO Configuration
  PB6   ------> USART1_TX
  PB7   ------> USART1_RX
  */
  GPIO_InitStruct.Pin = LL_GPIO_PIN_6|LL_GPIO_PIN_7;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_ALTERNATE;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;
  GPIO_InitStruct.Alternate = LL_GPIO_AF_7;
  LL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  USART_InitStruct.BaudRate = 115200;
  USART_InitStruct.DataWidth = LL_USART_DATAWIDTH_8B;
  USART_InitStruct.StopBits = LL_USART_STOPBITS_1;
  USART_InitStruct.Parity = LL_USART_PARITY_NONE;
  USART_InitStruct.TransferDirection = LL_USART_DIRECTION_TX_RX;
  USART_InitStruct.HardwareFlowControl = LL_USART_HWCONTROL_NONE;
  USART_InitStruct.OverSampling = LL_USART_OVERSAMPLING_16;
  LL_USART_Init(USART1, &USART_InitStruct);
  LL_USART_ConfigAsyncMode(USART1);
  LL_USART_Enable(USART1);

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* Init with LL driver */
  /* DMA controller clock enable */
  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_DMA1);

  /* DMA interrupt init */
  /* DMA1_Stream5_IRQn interrupt configuration */
  NVIC_SetPriority(DMA1_Stream5_IRQn, NVIC_EncodePriority(NVIC_GetPriorityGrouping(),0, 0));
  NVIC_EnableIRQ(DMA1_Stream5_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  LL_EXTI_InitTypeDef EXTI_InitStruct = {0};
  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOH);
  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
  LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOB);

  /**/
  LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_2|LL_GPIO_PIN_3|LL_GPIO_PIN_4|LL_GPIO_PIN_9);

  /**/
  LL_GPIO_SetOutputPin(GPIOB, LL_GPIO_PIN_1);

  /**/
  GPIO_InitStruct.Pin = LL_GPIO_PIN_2|LL_GPIO_PIN_3|LL_GPIO_PIN_4;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_OUTPUT;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_NO;
  LL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /**/
  GPIO_InitStruct.Pin = LL_GPIO_PIN_1;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_OUTPUT;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_UP;
  LL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /**/
  GPIO_InitStruct.Pin = LL_GPIO_PIN_9;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_OUTPUT;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_UP;
  LL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /**/
  LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTB, LL_SYSCFG_EXTI_LINE0);

  /**/
  EXTI_InitStruct.Line_0_31 = LL_EXTI_LINE_0;
  EXTI_InitStruct.LineCommand = ENABLE;
  EXTI_InitStruct.Mode = LL_EXTI_MODE_IT;
  EXTI_InitStruct.Trigger = LL_EXTI_TRIGGER_FALLING;
  LL_EXTI_Init(&EXTI_InitStruct);

  /**/
  LL_GPIO_SetPinPull(GPIOB, LL_GPIO_PIN_0, LL_GPIO_PULL_UP);

  /**/
  LL_GPIO_SetPinMode(GPIOB, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);

  /* EXTI interrupt init*/
  NVIC_SetPriority(EXTI0_IRQn, NVIC_EncodePriority(NVIC_GetPriorityGrouping(),1, 0));
  NVIC_EnableIRQ(EXTI0_IRQn);

}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  __disable_irq();
  while (1)
  {
  }
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

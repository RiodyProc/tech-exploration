#include "ui.h"
#include "stm32f4xx_ll_rtc.h"
#include "../../Core/Src/rtcrealiz.h"
#include "main.h"
#include "w25qxx.h"

void amTochange(lv_event_t * e)
{
    LL_RTC_DisableWriteProtection(RTC);  
    LL_RTC_EnterInitMode(RTC);          

  LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_AM_OR_24);
    
  LL_RTC_ExitInitMode(RTC);            
    LL_RTC_EnableWriteProtection(RTC);   
}

void pmTochange(lv_event_t * e)
{
    LL_RTC_DisableWriteProtection(RTC);  
    LL_RTC_EnterInitMode(RTC);           

  LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_PM);

    LL_RTC_ExitInitMode(RTC);            
    LL_RTC_EnableWriteProtection(RTC);   
}

void tempArch_need_flag(lv_event_t * e)
{
	if(tempArch_flag == 0)
		tempArch_flag = 1;
	else
		tempArch_flag = 0;

}

void humidArch_need_flag(lv_event_t * e)
{
	if(humidArch_flag == 0)
		humidArch_flag = 1;
	else
		humidArch_flag = 0;
}

void pressArch_need_flag(lv_event_t * e)
{
	if(pressArch_flag == 0)
		pressArch_flag = 1;
	else
		pressArch_flag = 0;
}

void save_time_event(lv_event_t * e)
{
    int hours = lv_spinbox_get_value(ui_spinboxHours);
    int minutes = lv_spinbox_get_value(ui_spinboxMinutes);
    int seconds = lv_spinbox_get_value(ui_spinboxSeconds);

    LL_RTC_DisableWriteProtection(RTC);  
    LL_RTC_EnterInitMode(RTC);           

      LL_RTC_TIME_Config(RTC, LL_RTC_FORMAT_BCD,
                       __LL_RTC_CONVERT_BIN2BCD(hours),
                       __LL_RTC_CONVERT_BIN2BCD(minutes),
                       __LL_RTC_CONVERT_BIN2BCD(seconds));

    LL_RTC_ExitInitMode(RTC);           
    LL_RTC_EnableWriteProtection(RTC);  
   char str[512];
   sprintf(str, "New time: %02d:%02d:%02d\n", hours, minutes, seconds);
   uart_send_string(str);
}

int calculate_weekday(int day, int month, int year) {
    if (month < 3) {
        month += 12;
        year -= 1;
    }
    int K = year % 100;
    int J = year / 100;

    int weekday = (day + (13 * (month + 1)) / 5 + K + (K / 4) + (J / 4) + (5 * J)) % 7;

    return (weekday + 6) % 7;
}

void save_date_event(lv_event_t * e)
{
  int day = lv_spinbox_get_value(ui_spinboxDay);
  int month = lv_spinbox_get_value(ui_spinboxMonth);
  int year = lv_spinbox_get_value(ui_spinboxYear);

  int weekday = calculate_weekday(day, month, year); 

  LL_RTC_DisableWriteProtection(RTC);
  LL_RTC_EnterInitMode(RTC);

  LL_RTC_DATE_Config(RTC, weekday,
                     __LL_RTC_CONVERT_BIN2BCD(day),
                     __LL_RTC_CONVERT_BIN2BCD(month),
                     __LL_RTC_CONVERT_BIN2BCD(year) 
                     ); 

  LL_RTC_ExitInitMode(RTC);
  LL_RTC_EnableWriteProtection(RTC);

  char str[512];
  sprintf(str, "New date: %02d-%02d-%04d (день недели: %d)\n", day, month, year, weekday);
  uart_send_string(str);
}

void init_static_time_save(lv_event_t * e)
{
	
}

void init_static_date_save(lv_event_t * e)
{
//static lv_coord_t temp_data[30] = { 
//    22, 23, 21, 20, 19, 18, 20, 21, 22, 23, 
//    24, 25, 23, 22, 21, 20, 19, 18, 17, 16, 
//    18, 19, 20, 21, 22, 23, 24, 25, 24, 23 
//};
//
//lv_chart_set_all_value(ui_tempStaticCH, ui_tempStaticCH_series_1, LV_CHART_POINT_NONE);
//for (uint32_t i = 0; i < 30; i++) {  
//	lv_chart_set_next_value(ui_tempStaticCH, ui_tempStaticCH_series_1, temp_data[i]); // Очищаем старые данные  
//}  
//lv_chart_refresh(ui_tempStaticCH);
  
	static lv_coord_t temp_data[30];
	char str1[512];
    extern uint8_t rx_buf[1025];

	uint8_t hour = lv_spinbox_get_value(ui_startHour);
    uint8_t minute = lv_spinbox_get_value(ui_startMinute);
    uint8_t second = lv_spinbox_get_value(ui_startSecond);
    
  	uint8_t day = lv_spinbox_get_value(ui_startDay);
  	uint8_t month = lv_spinbox_get_value(ui_startMonth);
  	uint16_t year = 2000 + lv_spinbox_get_value(ui_startYear);

	uint32_t timestamp1 = 0;

	uint8_t SensorDataCount = 30;

	// in Unix timestamp
	uart_send_string("\n\rtimestamp1: \n\r");

    timestamp1 = get_unix_timestamp(year, month, day, hour, minute, second);
	sprint_human_readable_time(timestamp1, str1);
	uart_send_string(str1);
	
	uint32_t start_time_addr = find_start_time(FLASH_START_ADDRESS, FLASH_END_ADDRESS, timestamp1) - 6;

	W25_Read_Data(start_time_addr, rx_buf, SensorDataCount * 16);

	lv_chart_set_all_value(ui_tempStaticCH, ui_tempStaticCH_series_1, LV_CHART_POINT_NONE);

	for(int i = 0; i < SensorDataCount; i++){
	    for(uint8_t j = 0; j < 7; j += 2)
	    {
	    	uint16_t dataI = ((uint16_t)(rx_buf[(uint16_t)i * 16 + (uint16_t)j] << 8))
	    			 	 	 | (uint16_t)(rx_buf[(uint16_t)i * 16 + (uint16_t)j + 1]);
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
				else if(j == 4 && pressArch_flag == 1){
					dataF = decode_Press(dataI);
	        		sprintf(str1, "%03.2f ", dataF);
				}
				// humidity < 100 value decoding
				else if(j == 2 && humidArch_flag == 1){// if(j == 2)
					dataF = decode_TempHum(dataI);
	        		sprintf(str1, "%03.2f ", dataF);
				}// temperature 
				else{
					dataF = decode_TempHum(dataI);
	        		sprintf(str1, "%03.2f ", dataF);
					lv_chart_set_next_value(ui_tempStaticCH, ui_tempStaticCH_series_1, dataF); // Очищаем старые данные  
				}
			}else
	        	sprintf(str1, "%02X ", dataI);
        
			uart_send_string(str1);	
		}
	}

	lv_chart_refresh(ui_tempStaticCH);
	if(tempArch_flag == 1){
    	lv_chart_refresh(ui_tempStaticCH);
	}
	else if(humidArch_flag == 1){
    	lv_chart_refresh(ui_humidStaticCH);
	}
	else if(pressArch_flag == 1){
    	lv_chart_refresh(ui_pressStaticCH);
	}
}


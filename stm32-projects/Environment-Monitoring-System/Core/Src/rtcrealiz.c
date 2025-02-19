#include "rtcrealiz.h"
#include "main.h"

void Clear_Screen(void)
{
	uart_send_string(CLEAR_SCREEN);
	uart_send_string(CURSOR_HOME);
}

void Set_RTC_Time(void)
{
    LL_RTC_DisableWriteProtection(RTC);  // Enable write protection
    LL_RTC_EnterInitMode(RTC);           // Enter initialization mode

	LL_RTC_TimeTypeDef sTime = {0};
    uint8_t buffer[3] = {0};

    uart_send_string("\n\rEnter Hour Format (12/24): ");
    uart_receive_string(buffer, 2);

    // Hour format(12/24)
    if (strncmp((char*)buffer, "12", 2) == 0) {
        LL_RTC_SetHourFormat(RTC, LL_RTC_HOURFORMAT_AMPM);
        uart_send_string("\n\r12-hour format selected");

        uart_send_string("\n\rEnter Hours (00-12): ");
        uart_receive_string(buffer, 2);
        sTime.Hours = (buffer[0] - '0') * 10 + (buffer[1] - '0');

        uart_send_string("\n\rEnter Time Format (AM/PM): \n\r");
        uart_receive_string(buffer, 2);  

        // Time format(AM/PM)
        if (strncmp((char*)buffer, "AM", 2) == 0) {
            LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_AM_OR_24);
            uart_send_string("\n\rAM format selected\n\r");
        } else if (strncmp((char*)buffer, "PM", 2) == 0) {
            LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_PM);
            uart_send_string("\n\rPM format selected\n\r");
        } else {
        	uart_send_string("\n\rInvalid input! Default: AM\n\r");
            LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_AM_OR_24); // by default AM
        }
    } else if (strncmp((char*)buffer, "24", 2) == 0) {
        LL_RTC_SetHourFormat(RTC, LL_RTC_HOURFORMAT_24HOUR);
        uart_send_string("\n\r24-hour format selected");

        uart_send_string("\n\rEnter Hours (12-24): \n\r");
        uart_receive_string(buffer, 2);
        sTime.Hours = (buffer[0] - '0') * 10 + (buffer[1] - '0');
    } else {
    	uart_send_string("\n\rInvalid input! Default: 12-hour\n\r");
        LL_RTC_SetHourFormat(RTC, LL_RTC_HOURFORMAT_AMPM);

        uart_send_string("\n\rEnter Hours (00-12): \n\r");
        uart_receive_string(buffer, 2);
        sTime.Hours = (buffer[0] - '0') * 10 + (buffer[1] - '0');

        uart_send_string("\n\rEnter Time Format (AM/PM): \n\r");
        uart_receive_string(buffer, 2); 
		
		// Time format(AM/PM)
        if (strncmp((char*)buffer, "AM", 2) == 0) {
            LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_AM_OR_24);
            uart_send_string("\n\rAM format selected\n\r");
        } else if (strncmp((char*)buffer, "PM", 2) == 0) {
            LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_PM);
            uart_send_string("\n\rPM format selected\n\r");
        } else {
            LL_RTC_TIME_SetFormat(RTC, LL_RTC_TIME_FORMAT_AM_OR_24); // by default AM
            uart_send_string("\n\rInvalid input! Default: AM\n\r");
        }
    }



    uart_send_string("\n\rEnter Minutes (00-59): ");
    uart_receive_string(buffer, 2);
    sTime.Minutes = (buffer[0] - '0') * 10 + (buffer[1] - '0');

    uart_send_string("\n\rEnter Seconds (00-59): \n\r");
    uart_receive_string(buffer, 2);
    sTime.Seconds = (buffer[0] - '0') * 10 + (buffer[1] - '0');


    LL_RTC_TIME_Config(RTC, LL_RTC_FORMAT_BCD,
                       __LL_RTC_CONVERT_BIN2BCD(sTime.Hours),
                       __LL_RTC_CONVERT_BIN2BCD(sTime.Minutes),
                       __LL_RTC_CONVERT_BIN2BCD(sTime.Seconds));

    uart_send_string("\n\rTime is set!\n\r ");

    LL_RTC_ExitInitMode(RTC);            // Exit initialization mode
    LL_RTC_EnableWriteProtection(RTC);   // Enable write protection
}

void Set_RTC_Date(void)
{
    LL_RTC_DisableWriteProtection(RTC);  // Enable write protection
    LL_RTC_EnterInitMode(RTC);           // Enter initialization mode

    LL_RTC_DateTypeDef sDate = {0};
    uint8_t buffer[3];

    uart_send_string("Enter Year (00-99): ");
    uart_receive_string(buffer, 2);
    sDate.Year = (buffer[0] - '0') * 10 + (buffer[1] - '0');

    uart_send_string("\n\rEnter Month (01-12): ");
    uart_receive_string(buffer, 2);
    sDate.Month = (buffer[0] - '0') * 10 + (buffer[1] - '0');

    uart_send_string("\n\rEnter Date (01-31): ");
    uart_receive_string(buffer, 2);
    sDate.Day = (buffer[0] - '0') * 10 + (buffer[1] - '0');

    uart_send_string("\n\rEnter Weekday (1=Mon, 7=Sun): ");
    uart_receive_string(buffer, 1);
    sDate.WeekDay = buffer[0] - '0';

    //LL_RTC_DATE_Config(RTC, sDate.WeekDay, sDate.Day, sDate.Month, sDate.Year);
    LL_RTC_DATE_Config(RTC, sDate.WeekDay,
                            __LL_RTC_CONVERT_BIN2BCD(sDate.Day),
                            __LL_RTC_CONVERT_BIN2BCD(sDate.Month),
                            __LL_RTC_CONVERT_BIN2BCD(sDate.Year));
    uart_send_string("\n\rDate is set!\n\r");

    LL_RTC_ExitInitMode(RTC);            // Exit initialization mode
    LL_RTC_EnableWriteProtection(RTC);   // Enable write protection
}

void Print_Time(void)
{
    LL_RTC_TimeTypeDef sTime;
    char buffer[50];
    
    //AM/PM
	uint32_t timeFormat = LL_RTC_TIME_GetFormat(RTC);
	//12/24
	uint32_t hourFormat = LL_RTC_GetHourFormat(RTC);

    sTime.Hours = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetHour(RTC));

    sTime.Minutes =__LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetMinute(RTC));

    sTime.Seconds = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_TIME_GetSecond(RTC));
	if(hourFormat == LL_RTC_HOURFORMAT_24HOUR)
   	    sprintf(buffer, "\n\r%02d:%02d:%02d h  ", sTime.Hours, sTime.Minutes, sTime.Seconds);
	 else if(hourFormat == LL_RTC_HOURFORMAT_AMPM){

			if(timeFormat == LL_RTC_TIME_FORMAT_AM_OR_24)
		   	    sprintf(buffer, "\n\r%02d:%02d:%02d AM  ", sTime.Hours, sTime.Minutes, sTime.Seconds);
			 else if(timeFormat == LL_RTC_TIME_FORMAT_PM)
		   	    sprintf(buffer, "\n\r%02d:%02d:%02d PM  ", sTime.Hours, sTime.Minutes, sTime.Seconds);
	 }

	uart_send_string(buffer);
}

void Print_Date(void)
{
    LL_RTC_DateTypeDef sDate;
    char buffer[50];

    sDate.Year = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetYear(RTC));

    sDate.Month = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetMonth(RTC));

    sDate.Day = __LL_RTC_CONVERT_BCD2BIN(LL_RTC_DATE_GetDay(RTC));

    sDate.WeekDay = LL_RTC_DATE_GetWeekDay(RTC);

    sprintf(buffer, "\n\rCurrent Date: %02d-%02d-20%02d\n\r", sDate.Day, sDate.Month, sDate.Year);// YEAR!!!
    uart_send_string(buffer);
}

void Show_Menu(void)
{
    //Clear_Screen();
    const char *menu = "\r\nMenu:\r\n"
    				   "0. Show Menu\r\n"
                       "1. Show Time\r\n"
                       "2. Show Date\r\n"
                       "3. Show Alarm\r\n"
                       "4. Set Time\r\n"
                       "5. Set Date\r\n"
                       "6. Set Alarm\r\n"
    				   "7. Reset Alarm Led\r\n\n";

    uart_send_string(menu);
}

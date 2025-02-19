#ifndef __RTC_REALIZ_H__
#define __RTC_REALIZ_H__

#include <string.h>
#include <stdio.h>
#include "main.h"

#define ESC "\033"
#define CLEAR_SCREEN ESC "[2J"
#define CURSOR_HOME ESC "[H"

void Show_Menu(void);
void uart_receive_string(uint8_t *buffer, uint16_t size);

#endif // __RTC_REALIZ_H__

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_ll_dma.h"
#include "stm32f4xx_ll_i2c.h"
#include "stm32f4xx_ll_rcc.h"
#include "stm32f4xx_ll_bus.h"
#include "stm32f4xx_ll_system.h"
#include "stm32f4xx_ll_exti.h"
#include "stm32f4xx_ll_cortex.h"
#include "stm32f4xx_ll_utils.h"
#include "stm32f4xx_ll_pwr.h"
#include "stm32f4xx_ll_rtc.h"
#include "stm32f4xx_ll_spi.h"
#include "stm32f4xx_ll_tim.h"
#include "stm32f4xx_ll_usart.h"
#include "stm32f4xx_ll_gpio.h"

#if defined(USE_FULL_ASSERT)
#include "stm32_assert.h"
#endif /* USE_FULL_ASSERT */

/* Private includes ----------------------------------------------------------*/
extern uint32_t millis;
uint32_t find_start_time(uint32_t low, uint32_t high, uint32_t start_time);
void sprint_human_readable_time(uint32_t timestamp, char *str);
uint32_t get_unix_timestamp(int year, int month, int day, int hour, int minute, int second);
uint16_t encode_TempHum(float data);
float decode_TempHum(uint16_t encoded_data);
uint16_t encode_Press(float data);
float decode_Press(uint16_t encoded_data);
void uart_send_string(const char* str);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* Private defines -----------------------------------------------------------*/
#ifndef NVIC_PRIORITYGROUP_0
#define NVIC_PRIORITYGROUP_0         ((uint32_t)0x00000007) /*!< 0 bit  for pre-emption priority,
                                                                 4 bits for subpriority */
#define NVIC_PRIORITYGROUP_1         ((uint32_t)0x00000006) /*!< 1 bit  for pre-emption priority,
                                                                 3 bits for subpriority */
#define NVIC_PRIORITYGROUP_2         ((uint32_t)0x00000005) /*!< 2 bits for pre-emption priority,
                                                                 2 bits for subpriority */
#define NVIC_PRIORITYGROUP_3         ((uint32_t)0x00000004) /*!< 3 bits for pre-emption priority,
                                                                 1 bit  for subpriority */
#define NVIC_PRIORITYGROUP_4         ((uint32_t)0x00000003) /*!< 4 bits for pre-emption priority,
                                                                 0 bit  for subpriority */
#endif

#define LCD_DC_Pin LL_GPIO_PIN_2
#define LCD_DC_GPIO_Port GPIOA
#define LCD_RESET_Pin LL_GPIO_PIN_3
#define LCD_RESET_GPIO_Port GPIOA
#define LCD_CS_Pin LL_GPIO_PIN_9
#define LCD_CS_GPIO_Port GPIOA
#define LCD_SCK_Pin LL_GPIO_PIN_3
#define LCD_SCK_GPIO_Port GPIOB
#define LCD_LED_Pin LL_GPIO_PIN_5
#define LCD_LED_GPIO_Port GPIOB
#define LCD_SDI_Pin LL_GPIO_PIN_5
#define LCD_SDI_GPIO_Port GPIOB
#define T_IRQ_Pin LL_GPIO_PIN_0
#define T_IRQ_GPIO_Port GPIOB
#define T_IRQ_EXTI_IRQn EXTI0_IRQn
#define T_CS_Pin LL_GPIO_PIN_1
#define T_CS_GPIO_Port GPIOB
#define T_OUT_Pin LL_GPIO_PIN_4
#define T_OUT_GPIO_Port GPIOB

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

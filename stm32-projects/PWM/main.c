/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
#include "stdio.h"
#include <string.h>
#include <ctype.h>
#include <wctype.h>
#include <stdlib.h>
#include "melody_2.h"
#include "melody_4.h"
#include "melody_8.h"
#include "melody_9.h"

/**
* GNUC specific stdout/stderr hooks.
*
* @note: other compilers have other stdout/stderr hooks.
*/
#ifndef __GNUC__
#error Unknown compilator
#else
#include <unistd.h>
/**
* GNUC specific stdout/stderr hooks.
*
* @note: other compilers have other stdout/stderr hooks.
*/
int _write(int fd, const void *buf, size_t count);
#endif

/* Private variables ---------------------------------------------------------*/
TIM_HandleTypeDef htim2;
TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim4;

UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
extern void initialise_monitor_handles(void);
volatile uint8_t button_pressed = 0; 
int KEY_ = -1;
uint8_t stop_playing = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_TIM3_Init(void);
static void MX_TIM4_Init(void);
static void MX_TIM2_Init(void);

void tim_3_4_config(){
	  // Configuration parameters for timers
	  TIM_HandleTypeDef *tim_3 = &htim3;
	  uint32_t tim_3_cnt_tick_freq = 0;

	  TIM_HandleTypeDef *tim_4 = &htim4;
	  uint32_t tim_4_cnt_tick_freq = 0;

	  // Helper variables for timer parameters calculations
	  uint32_t tim_channel[] = {TIM_CHANNEL_1, TIM_CHANNEL_2, TIM_CHANNEL_3, TIM_CHANNEL_4};
	  uint32_t arr_common_value = 0;

	  // Reset CCR-reg
	  for(int i = 0; i < 4; i++){
		  __HAL_TIM_SET_COMPARE(tim_3, tim_channel[i], 0);
	  	  __HAL_TIM_SET_COMPARE(tim_4, tim_channel[i], 0);
	  }

	  // run timer
	  for(int i = 0; i < 4; i++){
	  	  HAL_TIM_PWM_Start(tim_3, tim_channel[i]);
	  	  HAL_TIM_PWM_Start(tim_4, tim_channel[i]);
	  }

	  // calculate timer tick frequency: f_tick = f_sysclcock / (CDK * (PSK + 1))
	  tim_3_cnt_tick_freq = SystemCoreClock;
	  tim_4_cnt_tick_freq = SystemCoreClock;
	  switch (__HAL_TIM_GET_CLOCKDIVISION(tim_3)) {
	 	case TIM_CLOCKDIVISION_DIV1:
	 		tim_3_cnt_tick_freq /= 1;
	 		tim_4_cnt_tick_freq /= 1;
		 	break;
	 	case TIM_CLOCKDIVISION_DIV2:
		 	tim_3_cnt_tick_freq /= 2;
		 	tim_4_cnt_tick_freq /= 2;
	 		break;
	 	case TIM_CLOCKDIVISION_DIV4:
		 	tim_3_cnt_tick_freq /= 4;
		 	tim_4_cnt_tick_freq /= 4;
		 	break;
	  }

	  tim_3_cnt_tick_freq /= (tim_3->Instance->PSC + 1);
	  tim_4_cnt_tick_freq /= (tim_4->Instance->PSC + 1);
		HAL_Delay(30);

	  arr_common_value = tim_3_cnt_tick_freq / 1000 - 1;
	  __HAL_TIM_SET_AUTORELOAD(tim_3, arr_common_value);
	  __HAL_TIM_SET_AUTORELOAD(tim_4, arr_common_value);
}


void tim_channel_cc_set(TIM_HandleTypeDef *htim, uint32_t tim_channel, float cc_percentage){
	uint32_t arr_value = __HAL_TIM_GET_AUTORELOAD(htim);
	uint32_t cc_value = (arr_value + 1) * cc_percentage;

	__HAL_TIM_SET_COMPARE(htim, tim_channel, cc_value);
}

void tim_channel_freq_set(TIM_HandleTypeDef *htim, uint32_t tim_channel,  float pwm_freq){
	uint32_t tim_sys_freq = SystemCoreClock;
	//for a more accurate value, take a value close to SYSCLS(HCLK exactly)
	uint32_t tim_CNT_freq = 4000000;
	uint32_t tim_ARR_value = tim_CNT_freq / pwm_freq - 1;
	uint32_t tim_CLKDIV_value = 1;//__HAL_TIM_GET_CLOCKDIVISION(htim);
	uint32_t tim_PSK_value = tim_sys_freq / tim_CNT_freq * tim_CLKDIV_value - 1;
	// meander reproduction
	uint32_t tim_CPR_value = (tim_ARR_value + 1) * 0.5;

	__HAL_TIM_DISABLE(htim);

	__HAL_TIM_SET_AUTORELOAD(htim, tim_ARR_value);
	__HAL_TIM_SET_PRESCALER(htim, tim_PSK_value);
	__HAL_TIM_SET_COMPARE(htim, tim_channel, tim_CPR_value);

	HAL_TIM_GenerateEvent(htim, TIM_EVENTSOURCE_UPDATE);

	__HAL_TIM_ENABLE(htim);
}

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();
  /* Configure the system clock */
  SystemClock_Config();
  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  MX_TIM3_Init();
  MX_TIM4_Init();
  MX_TIM2_Init();

  tim_3_4_config();
  uint32_t tim_channel[] = {TIM_CHANNEL_1, TIM_CHANNEL_2, TIM_CHANNEL_3, TIM_CHANNEL_4};

  uint8_t button_was_pressed = 0;
  float bright_inc = 1.0;
  HAL_TIM_PWM_Start(&htim2, tim_channel[0]);

  while (1)
  {
		if (button_pressed == 1){
	  		printf("Key is pressed!-%d\r\n", KEY_);
	
	  		if(KEY_ == 1 && bright_inc < 10){
	  			// PWM signal of even channel
	  			// frequency: 1000 Hz
	  			// duty cycle++
	
	  			tim_channel_cc_set(&htim3, tim_channel[0], (float)(0.1 * bright_inc));
	  			tim_channel_cc_set(&htim3, tim_channel[2], (float)(0.1 * bright_inc));
	  			tim_channel_cc_set(&htim4, tim_channel[0], (float)(0.1 * bright_inc));
	  			tim_channel_cc_set(&htim4, tim_channel[2], (float)(0.1 * bright_inc));
					tim_channel_freq_set(&htim2, tim_channel[0], 0);
	
	  			bright_inc++;
	  		}
	  		else if(KEY_ == 2 && bright_inc > 0){
	  			// PWM signal of odd channel
	  			// frequency: 1000 Hz
	  			// duty cycle--
	
	  			tim_channel_cc_set(&htim3, tim_channel[0], (float)(0.1 * (bright_inc - 1)));
	  			tim_channel_cc_set(&htim3, tim_channel[2], (float)(0.1 * (bright_inc - 1)));
	  			tim_channel_cc_set(&htim4, tim_channel[0], (float)(0.1 * (bright_inc - 1)));
	  			tim_channel_cc_set(&htim4, tim_channel[2], (float)(0.1 * (bright_inc - 1)));
					tim_channel_freq_set(&htim2, tim_channel[0], 0);
	
	  			bright_inc--;
	  		}


	  		else if(KEY_ == 3 && bright_inc < 10){
	  				// PWM signal of even channel
	  				// frequency: 1000 Hz
	  				// duty cycle++
	
	  				tim_channel_cc_set(&htim3, tim_channel[1], (float)(0.1 * bright_inc));
	  				tim_channel_cc_set(&htim3, tim_channel[3], (float)(0.1 * bright_inc));
	  				tim_channel_cc_set(&htim4, tim_channel[1], (float)(0.1 * bright_inc));
	  				tim_channel_cc_set(&htim4, tim_channel[3], (float)(0.1 * bright_inc));

	  				tim_channel_freq_set(&htim2, tim_channel[0], 0);
	
	
	  				bright_inc++;
	  			}
	  			else if(KEY_ == 4 && bright_inc > 0){
	  				// PWM signal of odd channel
	  				// frequency: 1000 Hz
	  				// duty cycle--
	  				tim_channel_cc_set(&htim3, tim_channel[1], (float)(0.1 * (bright_inc - 1)));
	  				tim_channel_cc_set(&htim3, tim_channel[3], (float)(0.1 * (bright_inc - 1)));
	  				tim_channel_cc_set(&htim4, tim_channel[1], (float)(0.1 * (bright_inc - 1)));
	  				tim_channel_cc_set(&htim4, tim_channel[3], (float)(0.1 * (bright_inc - 1)));

	  				tim_channel_freq_set(&htim2, tim_channel[0], 0);
	  				bright_inc--;
	  			}
	  			else if(!button_was_pressed){

	  			if(KEY_ == 5){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 262);
	  			}
	  			else if(KEY_ == 6){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 294);
	  			}
	  			else if(KEY_ == 7){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 330);
	  			}
	  			else if(KEY_ == 8){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 350);
	  			}
	  			else if(KEY_ == 9){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 392);
	  			}
	  			else if(KEY_ == 10){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 440);
	  			}
	  			else if(KEY_ == 11){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 494);
	  			}
	  			else if(KEY_ == 12){
	  				tim_channel_freq_set(&htim2, tim_channel[0], 524);
	  			}

				button_was_pressed = 1;
	  		}
	  		else if(KEY_ == 13){
	  			for(int i = 0; i < MELODY_2_LEN; i++){
	  				tim_channel_freq_set(&htim2, tim_channel[0], MELODY_2_FREQUENCIES[i]);
	  				HAL_Delay(MELODY_2_DURATIONS[i]);
	  				tim_channel_freq_set(&htim2, tim_channel[0], 0);
	  				if(stop_playing == 1)
	  					break;
	  			}
	  		}
			else if(KEY_ == 14){
	  			for(int i = 0; i < MELODY_2_LEN; i++){
	  				tim_channel_freq_set(&htim2, tim_channel[0], MELODY_4_FREQUENCIES[i]);
	  				HAL_Delay(MELODY_4_DURATIONS[i]);
	  				tim_channel_freq_set(&htim2, tim_channel[0], 0);
	  				if(stop_playing == 1)
	  					break;
	  			}
	  		}
			else if(KEY_ == 15){
	  			for(int i = 0; i < MELODY_2_LEN; i++){
	  				tim_channel_freq_set(&htim2, tim_channel[0], MELODY_8_FREQUENCIES[i]);
	  				HAL_Delay(MELODY_8_DURATIONS[i]);
	  				tim_channel_freq_set(&htim2, tim_channel[0], 0);
	  				if(stop_playing == 1)
	  					break;
	  			}
	  		}
			else if(KEY_ == 16){
	  			for(int i = 0; i < MELODY_2_LEN; i++){
	  				tim_channel_freq_set(&htim2, tim_channel[0], MELODY_9_FREQUENCIES[i]);
	  				HAL_Delay(MELODY_9_DURATIONS[i]);
	  				tim_channel_freq_set(&htim2, tim_channel[0], 0);
	  				if(stop_playing == 1)
	  					break;
	  			}
	  		}
	  	}else if(button_was_pressed && 4 < KEY_ && KEY_ < 13){
			tim_channel_freq_set(&htim2, tim_channel[0], 0);
			button_was_pressed = 0;
		}


	  HAL_Delay(100);
  }
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 64;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV4;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 60;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 0;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_PWM_Init(&htim2) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim2, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  HAL_TIM_MspPostInit(&htim2);

}

/**
  * @brief TIM3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM3_Init(void)
{

  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  htim3.Instance = TIM3;
  htim3.Init.Prescaler = 1599;
  htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim3.Init.Period = 1000;
  htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_PWM_Init(&htim3) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim3, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
  {
    Error_Handler();
  }
  HAL_TIM_MspPostInit(&htim3);

}

/**
  * @brief TIM4 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM4_Init(void)
{
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  htim4.Instance = TIM4;
  htim4.Init.Prescaler = 15;
  htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim4.Init.Period = 999;
  htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim4.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_PWM_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
  {
    Error_Handler();
  }
  HAL_TIM_MspPostInit(&htim4);

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14|GPIO_PIN_15, GPIO_PIN_SET);

  /*Configure GPIO pin : PA1 */
  GPIO_InitStruct.Pin = GPIO_PIN_1;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : PB2 PB3 PB4 */
  GPIO_InitStruct.Pin = GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : PB12 PB13 PB14 PB15 */
  GPIO_InitStruct.Pin = GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14|GPIO_PIN_15;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI1_IRQn);

  HAL_NVIC_SetPriority(EXTI2_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI2_IRQn);

  HAL_NVIC_SetPriority(EXTI3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI3_IRQn);

  HAL_NVIC_SetPriority(EXTI4_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI4_IRQn);

  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);  
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin){
	int COL = 0;
	int ROW = 0;
	uint16_t prev_pin = GPIO_Pin;
	int temp = KEY_;

	if(HAL_GPIO_ReadPin(GPIOB, GPIO_Pin) || HAL_GPIO_ReadPin(GPIOA, GPIO_Pin)){

			if(GPIO_Pin == GPIO_PIN_1)
				COL = 0;
			else if(GPIO_Pin == GPIO_PIN_2)
				COL = 1;
			else if(GPIO_Pin == GPIO_PIN_3)
				COL = 2;
			else if(GPIO_Pin == GPIO_PIN_4)
				COL = 3;


    	for(ROW = 0; ROW < 4; ROW++){
    		HAL_GPIO_WritePin(GPIOB, (GPIO_PIN_12 << ROW)  , GPIO_PIN_RESET);
    		if(COL == 0 && HAL_GPIO_ReadPin(GPIOA, prev_pin) == GPIO_PIN_RESET){
    			KEY_ = (4*ROW+COL+1);//+1 for start index of matrix from 1(not 0)
    		    button_pressed = 1;

    			break;
    		}
    		else if (COL != 0 && HAL_GPIO_ReadPin(GPIOB, prev_pin) == GPIO_PIN_RESET){
    	     	KEY_ = (4*ROW+COL+1);//+1 for start index of matrix from 1(not 0)
    		    button_pressed = 1;
    	    	break;
    	    }

    	    HAL_GPIO_WritePin(GPIOB, (GPIO_PIN_12 << ROW)  , GPIO_PIN_SET);
		}

    	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_1, GPIO_PIN_RESET); // PA1
    	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, GPIO_PIN_RESET); // PB2-4
    	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12 | GPIO_PIN_13 | GPIO_PIN_14 | GPIO_PIN_15, GPIO_PIN_SET); // PB12-14
	} else{
		printf("!!!!!!!!!!!!Key %d is unpressed RIGHT NOW!!!!!!!!!\r\n", KEY_);
        button_pressed = 0;
        HAL_GPIO_WritePin(GPIOA, GPIO_PIN_1, GPIO_PIN_RESET); // PA1
        HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4, GPIO_PIN_RESET); // PB2-4
        HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12 | GPIO_PIN_13 | GPIO_PIN_14 | GPIO_PIN_15, GPIO_PIN_SET); // PB12-14
	}


	if(4 < KEY_ && KEY_ < 17 && KEY_ != temp)
		stop_playing = 1;
	else
		stop_playing = 0;

 	__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4);
}


int _write(int fd, const void *buf, size_t count) {
	int res = 0;
	if (fd == STDOUT_FILENO || fd == STDERR_FILENO) {
		// write data to UART
		HAL_StatusTypeDef hal_res = HAL_UART_Transmit(&huart2, (uint8_t*) buf, count, HAL_MAX_DELAY);
		res = hal_res == HAL_OK ? count : -1;
	} else {
		res = -1;
	}
		return res;
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
  };
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
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

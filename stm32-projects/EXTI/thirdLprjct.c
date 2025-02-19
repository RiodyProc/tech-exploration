/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
#include "stdio.h"

/**
* GNUC specific stdout/stderr hooks.
*
* @note: other compilers have other stdout/stderr hooks.
*/
#ifndef __GNUC__
#error Unknown compilator
#else
#include <unistd.h>

int _write(int fd, const void *buf, size_t count);
#endif

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart2;

extern void initialise_monitor_handles(void);
volatile uint8_t button_pressed = 0;
int KEY_ = -1;

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  int counter = 0;
 
  HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();

  uint16_t led_mask = 0x30;//0000 0000 0011 0000
  int cur_anim_speed = 40;//will be changed in multiple by X
  int prev_anim_speed = cur_anim_speed;
  int update_state_downcount = cur_anim_speed;//start cycle for 40 iteration instead of 0
  
  while (1)
  {
	printf("counter = %d\r\n", counter++);

	if (button_pressed == 1){
		printf("Key is pressed!-%d\r\n", KEY_);

		for(int mode = 1; mode <= 16; mode++){
			if(KEY_ == mode){
				cur_anim_speed = (400 / (mode*mode));//400 - rand const
				break;
			}
		}
	}
	
	update_state_downcount--; 
	if(update_state_downcount < 0 || prev_anim_speed != cur_anim_speed){
		update_state_downcount = cur_anim_speed;
		
		led_mask = (led_mask << 1);
		
		if(led_mask == 0x1800) //for 0001 1000 0000 0000 exception
			led_mask = 0x810;
		else if(led_mask == 0x1020)
			led_mask = 0x30;
	}	
	prev_anim_speed = cur_anim_speed;//instantly change LED mode

	HAL_GPIO_WritePin(GPIOA, 0xFF0, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOA, led_mask, GPIO_PIN_SET); // turn on only needed LED

	HAL_Delay(10);
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
  HAL_GPIO_WritePin(GPIOA, GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7
                          |GPIO_PIN_8|GPIO_PIN_9|GPIO_PIN_10|GPIO_PIN_11, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7, GPIO_PIN_SET);

  /*Configure GPIO pins : PA4 PA5 PA6 PA7
                           PA8 PA9 PA10 PA11 */
  GPIO_InitStruct.Pin = GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7
                          |GPIO_PIN_8|GPIO_PIN_9|GPIO_PIN_10|GPIO_PIN_11;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : PB0 PB1 PB2 PB3 */
  GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING_FALLING;
  GPIO_InitStruct.Pull = GPIO_PULLDOWN;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pins : PB4 PB5 PB6 PB7 */
  GPIO_InitStruct.Pin = GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_IRQn, 1, 0);
  HAL_NVIC_EnableIRQ(EXTI0_IRQn);

  HAL_NVIC_SetPriority(EXTI1_IRQn, 1, 0);
  HAL_NVIC_EnableIRQ(EXTI1_IRQn);

  HAL_NVIC_SetPriority(EXTI2_IRQn, 1, 0);
  HAL_NVIC_EnableIRQ(EXTI2_IRQn);

  HAL_NVIC_SetPriority(EXTI3_IRQn, 1, 0);
  HAL_NVIC_EnableIRQ(EXTI3_IRQn);

  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);  
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin){

	int cur_state = HAL_GPIO_ReadPin(GPIOB, GPIO_Pin);
	uint16_t prev_pin = GPIO_Pin;
	int COL = 0;
	int ROW = 0;

	if(cur_state){
		    button_pressed = 1;

			if(GPIO_Pin == GPIO_PIN_0)
				COL = 0;
			else if(GPIO_Pin == GPIO_PIN_1)
				COL = 1;
			else if(GPIO_Pin == GPIO_PIN_2)
				COL = 2;
			else if(GPIO_Pin == GPIO_PIN_3)
				COL = 3;

		for(ROW = 0; ROW < 4; ROW++){
    	    HAL_GPIO_WritePin(GPIOB, (GPIO_PIN_4 << ROW)  , GPIO_PIN_RESET);

 			if(HAL_GPIO_ReadPin(GPIOB, prev_pin) == GPIO_PIN_RESET){
 				KEY_ = (4*ROW+COL+1);//+1 for start index of matrix from 1(not 0)
				break;
			}
		}

		printf("Key %d is pressed RIGHT NOW!!!!!!!!!\r\n", KEY_);
		for (int pin = 0; pin < 8; pin++) {
		    HAL_GPIO_WritePin(GPIOB, (1 << pin), GPIO_PIN_SET);
		}
	} else{
		printf("!!!!!!!!!!!!Key %d is unpressed RIGHT NOW!!!!!!!!!\r\n", KEY_);
        button_pressed = 0;
		for (int pin = 0; pin < 8; pin++) {
		    HAL_GPIO_WritePin(GPIOB, (1 << pin), GPIO_PIN_SET);
		}
	}

 	__HAL_GPIO_EXTI_CLEAR_IT(GPIO_Pin);
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

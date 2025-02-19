/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
#include "stdio.h"
#include <string.h>
#include <ctype.h>
#include <wctype.h>
#include <stdlib.h>
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
UART_HandleTypeDef huart2;

//extern void initialise_monitor_handles(void);
volatile uint8_t button_pressed = 0;
int KEY_ = -1;

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);

// define global variable
input_buf_t project_input_buf;
int symbol_is_written = 0;//for record writing symbol from input_buf to temp_buf

/**
* Initialize input_buf_t object.
*/
int	input_buf_init(input_buf_t *input_buf, UART_HandleTypeDef *huart){
	input_buf->buf = (char*)malloc(2 * sizeof(char));// 1 element + 1->'\0'
	input_buf->buf[0] = ' ';
	input_buf->buf[1] = '\0';
	input_buf->empty = 1;
	input_buf->huart = huart;
	
	return 0;
}

/**
 * Formating input_buf_t object
 */
void input_buf_free(input_buf_t *input_buf) {
    if (input_buf->buf != NULL) {
		input_buf->buf[0] = ' ';
		input_buf->buf[1] = '\0';
        input_buf->empty = 1;
        symbol_is_written = 0;
    }
}

/**
* Increasing array size.
*/
int string_realloc(char **mainArray, size_t newSize){
	char *tempArray = (char*) malloc((newSize + 1) * sizeof(char));//already with '\0' +

	if (tempArray == NULL) return -1;

	int mainArray_len = strlen(*mainArray);
	strncpy(tempArray, *mainArray, mainArray_len);//COPY STRUCTURE BUFFER, NOT THE STRUCTURE

	memset(&tempArray[mainArray_len], '\0', (newSize + 1 - mainArray_len) * sizeof(char));

	free(*mainArray);
	*mainArray = tempArray;

	return 0;
}

/**
*	Execution commands 
*/
int l_execute(const char *cmd, uint16_t *led_mask){
	int scanned_len;
	int cmd_len = strlen(cmd);

	//AT+LED=n command
	sscanf(cmd, "AT+LED=%*d%n", &scanned_len);
	if(scanned_len == cmd_len){
		int num = -1;
		sscanf(cmd, "AT+LED=%d", &num);

	    if (5 <= num && num <= 12) {
	    	//get the mask with index of '1' bite
	        uint16_t mask = (1 << (num - 1));

	        //check for a state of pin
	        int state = HAL_GPIO_ReadPin(GPIOA, mask);

	        //echo result
			char str[18];
			sprintf(str, "\n\r+LED:%d \n\rOK", state);
			HAL_UART_Transmit(&huart2, (uint8_t*)str, 15, HAL_MAX_DELAY);

			return 1;
	    }else{
	    	HAL_UART_Transmit(&huart2, (uint8_t*)"\r\nERROR", 7, HAL_MAX_DELAY);

			return 0;
	    }
	}
	
	//AT+LED=num,state
	sscanf(cmd, "AT+LED=%*d,%*d%n", &scanned_len);
	if(scanned_len == cmd_len){
		int num = -1;
		int state = -1;

		sscanf(cmd, "AT+LED=%d,%d", &num, &state);
		if(state == 0 || state == 1){
	   		 if (5 <= num && num <= 12) {

	   			//get the mask with index of '1' bite
	   		    uint16_t mask = (1 << (num - 1));

	   		    //changing the main led_mask
	   		    if(state == 1)
	   		    	*led_mask = (*led_mask | mask);//0101 + 1000 => 1101
	   		    else
	   		    	*led_mask = (*led_mask & ~mask);//0101 + 1110 => 0100

	   		    //set a pin for a needded state
	   		    HAL_GPIO_WritePin(GPIOA, mask, state);

	   		    //echo result
	   		 	char str[18];
	   		 	sprintf(str, "\n\r+LED:%d \n\rOK", state);
	   		 	HAL_UART_Transmit(&huart2, (uint8_t*)str, 15, HAL_MAX_DELAY);

	   		 	return 1;
	   		 }else{
	   		 	HAL_UART_Transmit(&huart2, (uint8_t*)"\r\nERROR", 7, HAL_MAX_DELAY);

	   		 	return 0;
	   		 }
		}
		else{
		 	HAL_UART_Transmit(&huart2, (uint8_t*)"\r\nERROR", 7, HAL_MAX_DELAY);

		 	return 0;
		}

		return 0;
	}

	//If neither of previous conditions doesn't execute
	int offset = strlen(": command not found...1");
	char str[cmd_len + offset + 3];//2 for '\r\n' and 1 for '\0'

	sprintf(str, "\r\n%s: command not found...", cmd);
	HAL_UART_Transmit(&huart2, (uint8_t*)str, strlen(str), HAL_MAX_DELAY);
	return 0;
}

int m_execute(const char *cmd, int *mode){
	int scanned_len;
	int cmd_len = strlen(cmd);


	//AT+MODE? command
	sscanf(cmd, "AT+MODE?%n", &scanned_len);
	if(scanned_len == cmd_len){
		char str[18];
		sprintf(str, "\n\r+MODE:%d \n\rOK", *mode);
		HAL_UART_Transmit(&huart2, (uint8_t*)str, 15, HAL_MAX_DELAY);

		return 1;
	}

	//AT+MODE=n command
	sscanf(cmd, "AT+MODE=%*d%n", &scanned_len);
	if(scanned_len == cmd_len){
		int new_mode;

		sscanf(cmd, "AT+MODE=%d", &new_mode);
		if(0 <= new_mode && new_mode <= 2){
			*mode = new_mode;
			HAL_UART_Transmit(&huart2, (uint8_t*)"\r\nOK", 4, HAL_MAX_DELAY);
		}
		else{
			HAL_UART_Transmit(&huart2, (uint8_t*)"\r\nERROR", 7, HAL_MAX_DELAY);
		}

		return 1;
	}

	//If neither of previous conditions doesn't execute
	int offset = strlen(": command not found...");
	char str[cmd_len + offset + 3];//2 for '\r\n' and 1 for '\0'

	sprintf(str, "\r\n%s: command not found...", cmd);
	HAL_UART_Transmit(&huart2, (uint8_t*)str, strlen(str), HAL_MAX_DELAY);
	return 0;
}

int _execute(const char *cmd){
	int scanned_len;
	int cmd_len = strlen(cmd);

	//Enter command
	sscanf(cmd, "\r%n", &scanned_len);
	if(scanned_len == cmd_len){
		return 1;
	}
	
	//AT+TIME command
	sscanf(cmd, "AT+TIME%n", &scanned_len);
	if(scanned_len == cmd_len){
   		//echo result
	 	char str[18];
	 	sprintf(str, "\n\r+TIME:%d \n\rOK", (int)HAL_GetTick());
	 	HAL_UART_Transmit(&huart2, (uint8_t*)str, 17, HAL_MAX_DELAY);
		
		return 1;
	}

	//If neither of previous conditions doesn't execute
	int offset = strlen(": command not found...");
	char str[cmd_len + offset + 3];//2 for '\r\n' and 1 for '\0'

	sprintf(str, "\r\n%s: command not found...", cmd);
	HAL_UART_Transmit(&huart2, (uint8_t*)str, strlen(str), HAL_MAX_DELAY);
	return 0;
}

/**
* Process UART interruption.
*/
int input_buf_process_rxne_it(input_buf_t *input_buf) {
							// ignore interrupt if it isn't related with received data
	if (!__HAL_UART_GET_FLAG(input_buf->huart, UART_FLAG_RXNE))
		return 0;

							// process received data
	char symbol = input_buf->huart->Instance->DR;

							// save symbol into buffer
	input_buf->buf[0] = symbol;
	input_buf->empty = 0;
	
	if(symbol == '\r')		// disable interrupt
	__HAL_UART_DISABLE_IT(&huart2, UART_IT_RXNE);

	return 0;
}

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{ 
  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  
  int offset = 0;
  
  uint16_t led_mask = 0x1000;//0001 0000 0000 0000
  
  int mode_anim = 200;//led rotate speed
  int led_mode = -1;
  int prev_led_mode = -1;//for changing check
  int update_state_downcount = 0;
  
  input_buf_init(&project_input_buf, &huart2);//dynamic memory for input buffer
  
  char *output_buf = (char*) malloc(sizeof(char) * 6);//temp size
  strcpy(output_buf, "-=> ");
  
  HAL_UART_Transmit(&huart2, (uint8_t*) output_buf, strlen(output_buf), HAL_MAX_DELAY);//echo "-=> "
  
  memset(output_buf, '\0', 6);
  
  // enable interrupt
  __HAL_UART_ENABLE_IT(&huart2, UART_IT_RXNE);

  while (1)
  {
	if(!project_input_buf.empty && !symbol_is_written){
		if(project_input_buf.buf[0] == '\r'){

			if(strncmp(output_buf, "AT+MODE", 7) == 0)
				m_execute(output_buf, &led_mode);//continue and check for changing the led mode after if(...)
			else if(strncmp(output_buf, "AT+LED", 6) == 0 && led_mode == 2)
				l_execute(output_buf, &led_mask);
			else
				//standard command execution...
				_execute(output_buf);

			//echo new line for input
			strcpy(output_buf, "\n\r-=> ");

			HAL_UART_Transmit(&huart2, (uint8_t*) output_buf, strlen(output_buf), HAL_MAX_DELAY);//echo "-=> "

			//recover previous state of main variables
			memset(output_buf, '\0', 6);

			__HAL_UART_ENABLE_IT(&huart2, UART_IT_RXNE);

			symbol_is_written = 1;

			input_buf_free(&project_input_buf);

			continue;
		}

		HAL_UART_Transmit(&huart2, (uint8_t*) project_input_buf.buf, 1, HAL_MAX_DELAY);

		offset = strlen(output_buf);
		string_realloc(&output_buf, offset + 1 + 1);//write after "\r-=> ..."

		output_buf[offset] = project_input_buf.buf[0];
		symbol_is_written = 1;

		input_buf_free(&project_input_buf);
	}

	update_state_downcount--;
	if(update_state_downcount < 0 || led_mode != prev_led_mode){
		update_state_downcount = mode_anim;

			if(led_mode == 0){
    	    	led_mask = (led_mask >> 1);

    	    	if(led_mask == 0x8)//0000 0000 1000
    	    		led_mask = 0x800;//1000 0000 0000
				else if(led_mask == 0x0)
					led_mask = 0x800;
    	    }
    	    else if(led_mode == 1){
    	    	led_mask = (led_mask << 1);

    	    	if(led_mask == 0x1000)//0001 0000 0000 0000
    	    		led_mask = 0x10;//0000 0001 0000
				else if(led_mask == 0x0)//0000 0000 0000
					led_mask = 0x800;//0000 0001 0000
    	    }

    	    prev_led_mode = led_mode;

    	HAL_GPIO_WritePin(GPIOA, 0xFFF, GPIO_PIN_RESET);
    	HAL_GPIO_WritePin(GPIOA, led_mask, GPIO_PIN_SET); 
	}
	HAL_Delay(1);
  }
  free(output_buf);
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

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7
                          |GPIO_PIN_8|GPIO_PIN_9|GPIO_PIN_10|GPIO_PIN_11, GPIO_PIN_RESET);

  /*Configure GPIO pins : PA4 PA5 PA6 PA7
                           PA8 PA9 PA10 PA11 */
  GPIO_InitStruct.Pin = GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7
                          |GPIO_PIN_8|GPIO_PIN_9|GPIO_PIN_10|GPIO_PIN_11;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);  
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
  /* USER CODE END Error_Handler_Debug */
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

# Matrix Keyboard Interrupt Handling

This project demonstrates handling a matrix keyboard (HC-35) using external interrupts on an STM32 microcontroller. The program detects button presses/releases (K1-K16) and outputs the pressed button number via UART. Additionally, an LED animation runs in a circular pattern with two active LEDs, where the speed of animation is controlled by the last pressed button.

## Features

- **Matrix Keyboard Input**: Uses external interrupts to detect key presses/releases.
- **UART Output**: Displays the number of the pressed button.
- **LED Animation**: Two active LEDs move in a circular pattern.
- **Speed Control**: Animation speed is determined by the last pressed key (K1 - slowest, K16 - fastest).

## Technologies Used

- **Microcontroller**: STM32
- **Programming Language**: C (HAL library)
- **Peripheral Interfaces**: GPIO, EXTI (External Interrupts), UART
- **Development Tools**: STM32CubeIDE

## Setup and Usage

1. Connect the HC-35 keyboard to the STM32 microcontroller.
2. Configure GPIO pins for external interrupts on keyboard rows.
3. Implement an interrupt service routine (ISR) to detect key presses.
4. Use UART to print the pressed key number.
5. Implement a timer-based LED animation with adjustable speed.
6. Flash the firmware onto the STM32 board and monitor the UART output.

##

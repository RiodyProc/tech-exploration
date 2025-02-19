################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/widgets/switch/lv_switch.c 

OBJS += \
./Drivers/lvgl/src/widgets/switch/lv_switch.o 

C_DEPS += \
./Drivers/lvgl/src/widgets/switch/lv_switch.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/widgets/switch/%.o Drivers/lvgl/src/widgets/switch/%.su Drivers/lvgl/src/widgets/switch/%.cyclo: ../Drivers/lvgl/src/widgets/switch/%.c Drivers/lvgl/src/widgets/switch/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-switch

clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-switch:
	-$(RM) ./Drivers/lvgl/src/widgets/switch/lv_switch.cyclo ./Drivers/lvgl/src/widgets/switch/lv_switch.d ./Drivers/lvgl/src/widgets/switch/lv_switch.o ./Drivers/lvgl/src/widgets/switch/lv_switch.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-switch


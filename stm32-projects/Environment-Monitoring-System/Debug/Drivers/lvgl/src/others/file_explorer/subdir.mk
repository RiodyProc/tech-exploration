################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/others/file_explorer/lv_file_explorer.c 

OBJS += \
./Drivers/lvgl/src/others/file_explorer/lv_file_explorer.o 

C_DEPS += \
./Drivers/lvgl/src/others/file_explorer/lv_file_explorer.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/others/file_explorer/%.o Drivers/lvgl/src/others/file_explorer/%.su Drivers/lvgl/src/others/file_explorer/%.cyclo: ../Drivers/lvgl/src/others/file_explorer/%.c Drivers/lvgl/src/others/file_explorer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-others-2f-file_explorer

clean-Drivers-2f-lvgl-2f-src-2f-others-2f-file_explorer:
	-$(RM) ./Drivers/lvgl/src/others/file_explorer/lv_file_explorer.cyclo ./Drivers/lvgl/src/others/file_explorer/lv_file_explorer.d ./Drivers/lvgl/src/others/file_explorer/lv_file_explorer.o ./Drivers/lvgl/src/others/file_explorer/lv_file_explorer.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-others-2f-file_explorer


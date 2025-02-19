################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/examples/others/gestures/lv_example_gestures.c 

OBJS += \
./Drivers/LVGL/examples/others/gestures/lv_example_gestures.o 

C_DEPS += \
./Drivers/LVGL/examples/others/gestures/lv_example_gestures.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/examples/others/gestures/%.o Drivers/LVGL/examples/others/gestures/%.su Drivers/LVGL/examples/others/gestures/%.cyclo: ../Drivers/LVGL/examples/others/gestures/%.c Drivers/LVGL/examples/others/gestures/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-examples-2f-others-2f-gestures

clean-Drivers-2f-LVGL-2f-examples-2f-others-2f-gestures:
	-$(RM) ./Drivers/LVGL/examples/others/gestures/lv_example_gestures.cyclo ./Drivers/LVGL/examples/others/gestures/lv_example_gestures.d ./Drivers/LVGL/examples/others/gestures/lv_example_gestures.o ./Drivers/LVGL/examples/others/gestures/lv_example_gestures.su

.PHONY: clean-Drivers-2f-LVGL-2f-examples-2f-others-2f-gestures


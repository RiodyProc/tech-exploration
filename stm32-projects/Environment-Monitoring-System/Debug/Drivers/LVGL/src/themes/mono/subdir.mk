################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/themes/mono/lv_theme_mono.c 

OBJS += \
./Drivers/LVGL/src/themes/mono/lv_theme_mono.o 

C_DEPS += \
./Drivers/LVGL/src/themes/mono/lv_theme_mono.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/themes/mono/%.o Drivers/LVGL/src/themes/mono/%.su Drivers/LVGL/src/themes/mono/%.cyclo: ../Drivers/LVGL/src/themes/mono/%.c Drivers/LVGL/src/themes/mono/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-themes-2f-mono

clean-Drivers-2f-LVGL-2f-src-2f-themes-2f-mono:
	-$(RM) ./Drivers/LVGL/src/themes/mono/lv_theme_mono.cyclo ./Drivers/LVGL/src/themes/mono/lv_theme_mono.d ./Drivers/LVGL/src/themes/mono/lv_theme_mono.o ./Drivers/LVGL/src/themes/mono/lv_theme_mono.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-themes-2f-mono


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_large.c \
../Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_small.c 

OBJS += \
./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_large.o \
./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_small.o 

C_DEPS += \
./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_large.d \
./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_small.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/demos/multilang/assets/fonts/%.o Drivers/LVGL/demos/multilang/assets/fonts/%.su Drivers/LVGL/demos/multilang/assets/fonts/%.cyclo: ../Drivers/LVGL/demos/multilang/assets/fonts/%.c Drivers/LVGL/demos/multilang/assets/fonts/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-demos-2f-multilang-2f-assets-2f-fonts

clean-Drivers-2f-LVGL-2f-demos-2f-multilang-2f-assets-2f-fonts:
	-$(RM) ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_large.cyclo ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_large.d ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_large.o ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_large.su ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_small.cyclo ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_small.d ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_small.o ./Drivers/LVGL/demos/multilang/assets/fonts/font_multilang_small.su

.PHONY: clean-Drivers-2f-LVGL-2f-demos-2f-multilang-2f-assets-2f-fonts


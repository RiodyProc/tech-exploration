################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_control.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_easter_egg.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_home.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_list.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_notifications.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_qr.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_settings.c \
../Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_weather.c 

OBJS += \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_control.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_easter_egg.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_home.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_list.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_notifications.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_qr.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_settings.o \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_weather.o 

C_DEPS += \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_control.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_easter_egg.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_home.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_list.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_notifications.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_qr.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_settings.d \
./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_weather.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/demos/smartwatch/%.o Drivers/LVGL/demos/smartwatch/%.su Drivers/LVGL/demos/smartwatch/%.cyclo: ../Drivers/LVGL/demos/smartwatch/%.c Drivers/LVGL/demos/smartwatch/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-demos-2f-smartwatch

clean-Drivers-2f-LVGL-2f-demos-2f-smartwatch:
	-$(RM) ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_control.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_control.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_control.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_control.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_easter_egg.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_easter_egg.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_easter_egg.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_easter_egg.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_home.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_home.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_home.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_home.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_list.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_list.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_list.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_list.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_notifications.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_notifications.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_notifications.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_notifications.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_qr.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_qr.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_qr.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_qr.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_settings.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_settings.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_settings.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_settings.su ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_weather.cyclo ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_weather.d ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_weather.o ./Drivers/LVGL/demos/smartwatch/lv_demo_smartwatch_weather.su

.PHONY: clean-Drivers-2f-LVGL-2f-demos-2f-smartwatch


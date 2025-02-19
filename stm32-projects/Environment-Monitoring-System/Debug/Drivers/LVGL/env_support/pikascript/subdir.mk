################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/env_support/pikascript/pika_lv_point_t.c \
../Drivers/LVGL/env_support/pikascript/pika_lv_timer_t.c \
../Drivers/LVGL/env_support/pikascript/pika_lv_wegit.c \
../Drivers/LVGL/env_support/pikascript/pika_lvgl.c \
../Drivers/LVGL/env_support/pikascript/pika_lvgl_indev_t.c \
../Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_event.c \
../Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_obj.c \
../Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_style_t.c 

OBJS += \
./Drivers/LVGL/env_support/pikascript/pika_lv_point_t.o \
./Drivers/LVGL/env_support/pikascript/pika_lv_timer_t.o \
./Drivers/LVGL/env_support/pikascript/pika_lv_wegit.o \
./Drivers/LVGL/env_support/pikascript/pika_lvgl.o \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_indev_t.o \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_event.o \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_obj.o \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_style_t.o 

C_DEPS += \
./Drivers/LVGL/env_support/pikascript/pika_lv_point_t.d \
./Drivers/LVGL/env_support/pikascript/pika_lv_timer_t.d \
./Drivers/LVGL/env_support/pikascript/pika_lv_wegit.d \
./Drivers/LVGL/env_support/pikascript/pika_lvgl.d \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_indev_t.d \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_event.d \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_obj.d \
./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_style_t.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/env_support/pikascript/%.o Drivers/LVGL/env_support/pikascript/%.su Drivers/LVGL/env_support/pikascript/%.cyclo: ../Drivers/LVGL/env_support/pikascript/%.c Drivers/LVGL/env_support/pikascript/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-env_support-2f-pikascript

clean-Drivers-2f-LVGL-2f-env_support-2f-pikascript:
	-$(RM) ./Drivers/LVGL/env_support/pikascript/pika_lv_point_t.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lv_point_t.d ./Drivers/LVGL/env_support/pikascript/pika_lv_point_t.o ./Drivers/LVGL/env_support/pikascript/pika_lv_point_t.su ./Drivers/LVGL/env_support/pikascript/pika_lv_timer_t.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lv_timer_t.d ./Drivers/LVGL/env_support/pikascript/pika_lv_timer_t.o ./Drivers/LVGL/env_support/pikascript/pika_lv_timer_t.su ./Drivers/LVGL/env_support/pikascript/pika_lv_wegit.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lv_wegit.d ./Drivers/LVGL/env_support/pikascript/pika_lv_wegit.o ./Drivers/LVGL/env_support/pikascript/pika_lv_wegit.su ./Drivers/LVGL/env_support/pikascript/pika_lvgl.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lvgl.d ./Drivers/LVGL/env_support/pikascript/pika_lvgl.o ./Drivers/LVGL/env_support/pikascript/pika_lvgl.su ./Drivers/LVGL/env_support/pikascript/pika_lvgl_indev_t.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lvgl_indev_t.d ./Drivers/LVGL/env_support/pikascript/pika_lvgl_indev_t.o ./Drivers/LVGL/env_support/pikascript/pika_lvgl_indev_t.su ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_event.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_event.d ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_event.o ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_event.su ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_obj.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_obj.d ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_obj.o ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_obj.su ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_style_t.cyclo ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_style_t.d ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_style_t.o ./Drivers/LVGL/env_support/pikascript/pika_lvgl_lv_style_t.su

.PHONY: clean-Drivers-2f-LVGL-2f-env_support-2f-pikascript


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_cache.c \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_entry.c \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.c \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.c \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_lcd.c \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_libuv.c \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_profiler.c \
../Drivers/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.c 

OBJS += \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_cache.o \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_entry.o \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_cache.d \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_entry.d \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d \
./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/nuttx/%.o Drivers/lvgl/src/drivers/nuttx/%.su Drivers/lvgl/src/drivers/nuttx/%.cyclo: ../Drivers/lvgl/src/drivers/nuttx/%.c Drivers/lvgl/src/drivers/nuttx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-nuttx

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-nuttx:
	-$(RM) ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_cache.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_cache.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_cache.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_cache.su ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_entry.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_entry.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_entry.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_entry.su ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_fbdev.su ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_image_cache.su ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_lcd.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_lcd.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_lcd.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_lcd.su ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_libuv.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_libuv.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_libuv.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_libuv.su ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_profiler.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_profiler.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_profiler.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_profiler.su ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.cyclo ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.d ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.o ./Drivers/lvgl/src/drivers/nuttx/lv_nuttx_touchscreen.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-nuttx


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_cache.c \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_entry.c \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_fbdev.c \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_image_cache.c \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_lcd.c \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_libuv.c \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_profiler.c \
../Drivers/LVGL/src/drivers/nuttx/lv_nuttx_touchscreen.c 

OBJS += \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_cache.o \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_entry.o \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_fbdev.o \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_image_cache.o \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_lcd.o \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_libuv.o \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_profiler.o \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_touchscreen.o 

C_DEPS += \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_cache.d \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_entry.d \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_fbdev.d \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_image_cache.d \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_lcd.d \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_libuv.d \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_profiler.d \
./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_touchscreen.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/drivers/nuttx/%.o Drivers/LVGL/src/drivers/nuttx/%.su Drivers/LVGL/src/drivers/nuttx/%.cyclo: ../Drivers/LVGL/src/drivers/nuttx/%.c Drivers/LVGL/src/drivers/nuttx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-nuttx

clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-nuttx:
	-$(RM) ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_cache.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_cache.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_cache.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_cache.su ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_entry.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_entry.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_entry.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_entry.su ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_fbdev.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_fbdev.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_fbdev.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_fbdev.su ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_image_cache.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_image_cache.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_image_cache.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_image_cache.su ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_lcd.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_lcd.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_lcd.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_lcd.su ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_libuv.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_libuv.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_libuv.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_libuv.su ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_profiler.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_profiler.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_profiler.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_profiler.su ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_touchscreen.cyclo ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_touchscreen.d ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_touchscreen.o ./Drivers/LVGL/src/drivers/nuttx/lv_nuttx_touchscreen.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-nuttx


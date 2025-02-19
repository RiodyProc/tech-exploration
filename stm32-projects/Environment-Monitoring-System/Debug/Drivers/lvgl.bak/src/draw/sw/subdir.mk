################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_arc.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_blend.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_dither.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_gradient.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_img.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_layer.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_letter.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_line.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_polygon.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_rect.c \
../Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_transform.c 

OBJS += \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_arc.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_blend.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_dither.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_gradient.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_img.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_layer.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_letter.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_line.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_polygon.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_rect.o \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_transform.o 

C_DEPS += \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_arc.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_blend.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_dither.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_gradient.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_img.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_layer.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_letter.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_line.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_polygon.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_rect.d \
./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_transform.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl.bak/src/draw/sw/%.o Drivers/lvgl.bak/src/draw/sw/%.su Drivers/lvgl.bak/src/draw/sw/%.cyclo: ../Drivers/lvgl.bak/src/draw/sw/%.c Drivers/lvgl.bak/src/draw/sw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-sw

clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-sw:
	-$(RM) ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_arc.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_arc.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_arc.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_arc.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_blend.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_blend.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_blend.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_blend.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_dither.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_dither.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_dither.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_dither.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_gradient.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_gradient.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_gradient.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_gradient.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_img.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_img.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_img.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_img.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_layer.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_layer.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_layer.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_layer.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_letter.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_letter.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_letter.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_letter.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_line.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_line.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_line.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_line.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_polygon.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_polygon.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_polygon.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_polygon.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_rect.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_rect.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_rect.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_rect.su ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_transform.cyclo ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_transform.d ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_transform.o ./Drivers/lvgl.bak/src/draw/sw/lv_draw_sw_transform.su

.PHONY: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-sw


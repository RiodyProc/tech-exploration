################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_arc.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_border.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_fill.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_img.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_label.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_layer.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_line.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_utils.c \
../Drivers/LVGL/src/draw/nema_gfx/lv_nema_gfx_path.c 

OBJS += \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_arc.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_border.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_fill.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_img.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_label.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_layer.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_line.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_utils.o \
./Drivers/LVGL/src/draw/nema_gfx/lv_nema_gfx_path.o 

C_DEPS += \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_arc.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_border.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_fill.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_img.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_label.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_layer.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_line.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_utils.d \
./Drivers/LVGL/src/draw/nema_gfx/lv_nema_gfx_path.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/draw/nema_gfx/%.o Drivers/LVGL/src/draw/nema_gfx/%.su Drivers/LVGL/src/draw/nema_gfx/%.cyclo: ../Drivers/LVGL/src/draw/nema_gfx/%.c Drivers/LVGL/src/draw/nema_gfx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nema_gfx

clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nema_gfx:
	-$(RM) ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_arc.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_arc.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_arc.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_arc.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_border.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_border.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_border.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_border.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_fill.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_fill.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_fill.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_fill.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_img.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_img.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_img.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_img.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_label.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_label.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_label.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_label.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_layer.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_layer.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_layer.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_layer.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_line.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_line.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_line.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_line.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.su ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_utils.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_utils.d ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_utils.o ./Drivers/LVGL/src/draw/nema_gfx/lv_draw_nema_gfx_utils.su ./Drivers/LVGL/src/draw/nema_gfx/lv_nema_gfx_path.cyclo ./Drivers/LVGL/src/draw/nema_gfx/lv_nema_gfx_path.d ./Drivers/LVGL/src/draw/nema_gfx/lv_nema_gfx_path.o ./Drivers/LVGL/src/draw/nema_gfx/lv_nema_gfx_path.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nema_gfx


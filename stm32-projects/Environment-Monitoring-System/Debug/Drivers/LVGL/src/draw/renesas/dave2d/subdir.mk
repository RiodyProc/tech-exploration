################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_arc.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_border.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_fill.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_image.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_label.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_line.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.c \
../Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_utils.c 

OBJS += \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_border.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_image.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_label.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_line.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o 

C_DEPS += \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_border.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_image.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_label.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_line.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d \
./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/draw/renesas/dave2d/%.o Drivers/LVGL/src/draw/renesas/dave2d/%.su Drivers/LVGL/src/draw/renesas/dave2d/%.cyclo: ../Drivers/LVGL/src/draw/renesas/dave2d/%.c Drivers/LVGL/src/draw/renesas/dave2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-renesas-2f-dave2d

clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-renesas-2f-dave2d:
	-$(RM) ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_arc.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_arc.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_border.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_border.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_border.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_border.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_fill.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_fill.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_image.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_image.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_image.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_image.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_label.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_label.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_label.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_label.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_line.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_line.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_line.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_line.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.su ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_utils.cyclo ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o ./Drivers/LVGL/src/draw/renesas/dave2d/lv_draw_dave2d_utils.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-renesas-2f-dave2d


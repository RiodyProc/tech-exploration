################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.c \
../Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.c 

OBJS += \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o 

C_DEPS += \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d \
./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/renesas/dave2d/%.o Drivers/lvgl/src/draw/renesas/dave2d/%.su Drivers/lvgl/src/draw/renesas/dave2d/%.cyclo: ../Drivers/lvgl/src/draw/renesas/dave2d/%.c Drivers/lvgl/src/draw/renesas/dave2d/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d:
	-$(RM) ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_arc.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_border.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_fill.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_image.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_label.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_line.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_mask_rectangle.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_triangle.su ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.cyclo ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.d ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.o ./Drivers/lvgl/src/draw/renesas/dave2d/lv_draw_dave2d_utils.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-renesas-2f-dave2d


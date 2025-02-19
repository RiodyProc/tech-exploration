################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_buf_vglite.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_arc.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_border.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_fill.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_img.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_label.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_layer.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_line.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_triangle.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_buf.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_matrix.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_path.c \
../Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_utils.c 

OBJS += \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_buf_vglite.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_arc.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_border.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_fill.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_img.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_label.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_layer.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_line.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_triangle.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_buf.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_matrix.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_path.o \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_utils.o 

C_DEPS += \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_buf_vglite.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_arc.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_border.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_fill.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_img.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_label.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_layer.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_line.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_triangle.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_buf.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_matrix.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_path.d \
./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/draw/nxp/vglite/%.o Drivers/LVGL/src/draw/nxp/vglite/%.su Drivers/LVGL/src/draw/nxp/vglite/%.cyclo: ../Drivers/LVGL/src/draw/nxp/vglite/%.c Drivers/LVGL/src/draw/nxp/vglite/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-vglite

clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-vglite:
	-$(RM) ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_buf_vglite.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_buf_vglite.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_buf_vglite.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_buf_vglite.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_arc.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_arc.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_arc.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_arc.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_border.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_border.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_border.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_border.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_fill.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_fill.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_fill.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_fill.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_img.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_img.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_img.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_img.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_label.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_label.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_label.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_label.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_layer.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_layer.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_layer.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_layer.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_line.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_line.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_line.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_line.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_triangle.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_triangle.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_triangle.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_draw_vglite_triangle.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_buf.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_buf.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_buf.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_buf.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_matrix.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_matrix.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_matrix.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_matrix.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_path.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_path.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_path.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_path.su ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_utils.cyclo ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_utils.d ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_utils.o ./Drivers/LVGL/src/draw/nxp/vglite/lv_vglite_utils.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-vglite


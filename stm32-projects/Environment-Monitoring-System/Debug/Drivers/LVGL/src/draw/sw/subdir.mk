################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/draw/sw/lv_draw_sw.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_arc.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_border.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_box_shadow.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_fill.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_gradient.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_img.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_letter.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_line.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_mask.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_mask_rect.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_transform.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_triangle.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_utils.c \
../Drivers/LVGL/src/draw/sw/lv_draw_sw_vector.c 

OBJS += \
./Drivers/LVGL/src/draw/sw/lv_draw_sw.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_arc.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_border.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_box_shadow.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_fill.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_gradient.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_img.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_letter.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_line.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask_rect.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_transform.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_triangle.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_utils.o \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_vector.o 

C_DEPS += \
./Drivers/LVGL/src/draw/sw/lv_draw_sw.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_arc.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_border.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_box_shadow.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_fill.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_gradient.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_img.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_letter.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_line.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask_rect.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_transform.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_triangle.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_utils.d \
./Drivers/LVGL/src/draw/sw/lv_draw_sw_vector.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/draw/sw/%.o Drivers/LVGL/src/draw/sw/%.su Drivers/LVGL/src/draw/sw/%.cyclo: ../Drivers/LVGL/src/draw/sw/%.c Drivers/LVGL/src/draw/sw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-sw

clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-sw:
	-$(RM) ./Drivers/LVGL/src/draw/sw/lv_draw_sw.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_arc.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_arc.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_arc.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_arc.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_border.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_border.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_border.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_border.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_box_shadow.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_box_shadow.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_box_shadow.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_box_shadow.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_fill.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_fill.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_fill.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_fill.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_gradient.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_gradient.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_gradient.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_gradient.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_img.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_img.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_img.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_img.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_letter.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_letter.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_letter.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_letter.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_line.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_line.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_line.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_line.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask_rect.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask_rect.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask_rect.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_mask_rect.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_transform.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_transform.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_transform.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_transform.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_triangle.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_triangle.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_triangle.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_triangle.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_utils.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_utils.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_utils.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_utils.su ./Drivers/LVGL/src/draw/sw/lv_draw_sw_vector.cyclo ./Drivers/LVGL/src/draw/sw/lv_draw_sw_vector.d ./Drivers/LVGL/src/draw/sw/lv_draw_sw_vector.o ./Drivers/LVGL/src/draw/sw/lv_draw_sw_vector.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-sw


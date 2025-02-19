################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/draw/lv_draw.c \
../Drivers/LVGL/src/draw/lv_draw_arc.c \
../Drivers/LVGL/src/draw/lv_draw_buf.c \
../Drivers/LVGL/src/draw/lv_draw_image.c \
../Drivers/LVGL/src/draw/lv_draw_label.c \
../Drivers/LVGL/src/draw/lv_draw_line.c \
../Drivers/LVGL/src/draw/lv_draw_mask.c \
../Drivers/LVGL/src/draw/lv_draw_rect.c \
../Drivers/LVGL/src/draw/lv_draw_triangle.c \
../Drivers/LVGL/src/draw/lv_draw_vector.c \
../Drivers/LVGL/src/draw/lv_image_decoder.c 

OBJS += \
./Drivers/LVGL/src/draw/lv_draw.o \
./Drivers/LVGL/src/draw/lv_draw_arc.o \
./Drivers/LVGL/src/draw/lv_draw_buf.o \
./Drivers/LVGL/src/draw/lv_draw_image.o \
./Drivers/LVGL/src/draw/lv_draw_label.o \
./Drivers/LVGL/src/draw/lv_draw_line.o \
./Drivers/LVGL/src/draw/lv_draw_mask.o \
./Drivers/LVGL/src/draw/lv_draw_rect.o \
./Drivers/LVGL/src/draw/lv_draw_triangle.o \
./Drivers/LVGL/src/draw/lv_draw_vector.o \
./Drivers/LVGL/src/draw/lv_image_decoder.o 

C_DEPS += \
./Drivers/LVGL/src/draw/lv_draw.d \
./Drivers/LVGL/src/draw/lv_draw_arc.d \
./Drivers/LVGL/src/draw/lv_draw_buf.d \
./Drivers/LVGL/src/draw/lv_draw_image.d \
./Drivers/LVGL/src/draw/lv_draw_label.d \
./Drivers/LVGL/src/draw/lv_draw_line.d \
./Drivers/LVGL/src/draw/lv_draw_mask.d \
./Drivers/LVGL/src/draw/lv_draw_rect.d \
./Drivers/LVGL/src/draw/lv_draw_triangle.d \
./Drivers/LVGL/src/draw/lv_draw_vector.d \
./Drivers/LVGL/src/draw/lv_image_decoder.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/draw/%.o Drivers/LVGL/src/draw/%.su Drivers/LVGL/src/draw/%.cyclo: ../Drivers/LVGL/src/draw/%.c Drivers/LVGL/src/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-draw

clean-Drivers-2f-LVGL-2f-src-2f-draw:
	-$(RM) ./Drivers/LVGL/src/draw/lv_draw.cyclo ./Drivers/LVGL/src/draw/lv_draw.d ./Drivers/LVGL/src/draw/lv_draw.o ./Drivers/LVGL/src/draw/lv_draw.su ./Drivers/LVGL/src/draw/lv_draw_arc.cyclo ./Drivers/LVGL/src/draw/lv_draw_arc.d ./Drivers/LVGL/src/draw/lv_draw_arc.o ./Drivers/LVGL/src/draw/lv_draw_arc.su ./Drivers/LVGL/src/draw/lv_draw_buf.cyclo ./Drivers/LVGL/src/draw/lv_draw_buf.d ./Drivers/LVGL/src/draw/lv_draw_buf.o ./Drivers/LVGL/src/draw/lv_draw_buf.su ./Drivers/LVGL/src/draw/lv_draw_image.cyclo ./Drivers/LVGL/src/draw/lv_draw_image.d ./Drivers/LVGL/src/draw/lv_draw_image.o ./Drivers/LVGL/src/draw/lv_draw_image.su ./Drivers/LVGL/src/draw/lv_draw_label.cyclo ./Drivers/LVGL/src/draw/lv_draw_label.d ./Drivers/LVGL/src/draw/lv_draw_label.o ./Drivers/LVGL/src/draw/lv_draw_label.su ./Drivers/LVGL/src/draw/lv_draw_line.cyclo ./Drivers/LVGL/src/draw/lv_draw_line.d ./Drivers/LVGL/src/draw/lv_draw_line.o ./Drivers/LVGL/src/draw/lv_draw_line.su ./Drivers/LVGL/src/draw/lv_draw_mask.cyclo ./Drivers/LVGL/src/draw/lv_draw_mask.d ./Drivers/LVGL/src/draw/lv_draw_mask.o ./Drivers/LVGL/src/draw/lv_draw_mask.su ./Drivers/LVGL/src/draw/lv_draw_rect.cyclo ./Drivers/LVGL/src/draw/lv_draw_rect.d ./Drivers/LVGL/src/draw/lv_draw_rect.o ./Drivers/LVGL/src/draw/lv_draw_rect.su ./Drivers/LVGL/src/draw/lv_draw_triangle.cyclo ./Drivers/LVGL/src/draw/lv_draw_triangle.d ./Drivers/LVGL/src/draw/lv_draw_triangle.o ./Drivers/LVGL/src/draw/lv_draw_triangle.su ./Drivers/LVGL/src/draw/lv_draw_vector.cyclo ./Drivers/LVGL/src/draw/lv_draw_vector.d ./Drivers/LVGL/src/draw/lv_draw_vector.o ./Drivers/LVGL/src/draw/lv_draw_vector.su ./Drivers/LVGL/src/draw/lv_image_decoder.cyclo ./Drivers/LVGL/src/draw/lv_image_decoder.d ./Drivers/LVGL/src/draw/lv_image_decoder.o ./Drivers/LVGL/src/draw/lv_image_decoder.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-draw


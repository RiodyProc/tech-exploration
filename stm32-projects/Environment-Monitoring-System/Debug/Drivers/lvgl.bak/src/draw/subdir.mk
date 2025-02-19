################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl.bak/src/draw/lv_draw.c \
../Drivers/lvgl.bak/src/draw/lv_draw_arc.c \
../Drivers/lvgl.bak/src/draw/lv_draw_img.c \
../Drivers/lvgl.bak/src/draw/lv_draw_label.c \
../Drivers/lvgl.bak/src/draw/lv_draw_layer.c \
../Drivers/lvgl.bak/src/draw/lv_draw_line.c \
../Drivers/lvgl.bak/src/draw/lv_draw_mask.c \
../Drivers/lvgl.bak/src/draw/lv_draw_rect.c \
../Drivers/lvgl.bak/src/draw/lv_draw_transform.c \
../Drivers/lvgl.bak/src/draw/lv_draw_triangle.c \
../Drivers/lvgl.bak/src/draw/lv_img_buf.c \
../Drivers/lvgl.bak/src/draw/lv_img_cache.c \
../Drivers/lvgl.bak/src/draw/lv_img_decoder.c 

OBJS += \
./Drivers/lvgl.bak/src/draw/lv_draw.o \
./Drivers/lvgl.bak/src/draw/lv_draw_arc.o \
./Drivers/lvgl.bak/src/draw/lv_draw_img.o \
./Drivers/lvgl.bak/src/draw/lv_draw_label.o \
./Drivers/lvgl.bak/src/draw/lv_draw_layer.o \
./Drivers/lvgl.bak/src/draw/lv_draw_line.o \
./Drivers/lvgl.bak/src/draw/lv_draw_mask.o \
./Drivers/lvgl.bak/src/draw/lv_draw_rect.o \
./Drivers/lvgl.bak/src/draw/lv_draw_transform.o \
./Drivers/lvgl.bak/src/draw/lv_draw_triangle.o \
./Drivers/lvgl.bak/src/draw/lv_img_buf.o \
./Drivers/lvgl.bak/src/draw/lv_img_cache.o \
./Drivers/lvgl.bak/src/draw/lv_img_decoder.o 

C_DEPS += \
./Drivers/lvgl.bak/src/draw/lv_draw.d \
./Drivers/lvgl.bak/src/draw/lv_draw_arc.d \
./Drivers/lvgl.bak/src/draw/lv_draw_img.d \
./Drivers/lvgl.bak/src/draw/lv_draw_label.d \
./Drivers/lvgl.bak/src/draw/lv_draw_layer.d \
./Drivers/lvgl.bak/src/draw/lv_draw_line.d \
./Drivers/lvgl.bak/src/draw/lv_draw_mask.d \
./Drivers/lvgl.bak/src/draw/lv_draw_rect.d \
./Drivers/lvgl.bak/src/draw/lv_draw_transform.d \
./Drivers/lvgl.bak/src/draw/lv_draw_triangle.d \
./Drivers/lvgl.bak/src/draw/lv_img_buf.d \
./Drivers/lvgl.bak/src/draw/lv_img_cache.d \
./Drivers/lvgl.bak/src/draw/lv_img_decoder.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl.bak/src/draw/%.o Drivers/lvgl.bak/src/draw/%.su Drivers/lvgl.bak/src/draw/%.cyclo: ../Drivers/lvgl.bak/src/draw/%.c Drivers/lvgl.bak/src/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw

clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw:
	-$(RM) ./Drivers/lvgl.bak/src/draw/lv_draw.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw.d ./Drivers/lvgl.bak/src/draw/lv_draw.o ./Drivers/lvgl.bak/src/draw/lv_draw.su ./Drivers/lvgl.bak/src/draw/lv_draw_arc.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_arc.d ./Drivers/lvgl.bak/src/draw/lv_draw_arc.o ./Drivers/lvgl.bak/src/draw/lv_draw_arc.su ./Drivers/lvgl.bak/src/draw/lv_draw_img.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_img.d ./Drivers/lvgl.bak/src/draw/lv_draw_img.o ./Drivers/lvgl.bak/src/draw/lv_draw_img.su ./Drivers/lvgl.bak/src/draw/lv_draw_label.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_label.d ./Drivers/lvgl.bak/src/draw/lv_draw_label.o ./Drivers/lvgl.bak/src/draw/lv_draw_label.su ./Drivers/lvgl.bak/src/draw/lv_draw_layer.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_layer.d ./Drivers/lvgl.bak/src/draw/lv_draw_layer.o ./Drivers/lvgl.bak/src/draw/lv_draw_layer.su ./Drivers/lvgl.bak/src/draw/lv_draw_line.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_line.d ./Drivers/lvgl.bak/src/draw/lv_draw_line.o ./Drivers/lvgl.bak/src/draw/lv_draw_line.su ./Drivers/lvgl.bak/src/draw/lv_draw_mask.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_mask.d ./Drivers/lvgl.bak/src/draw/lv_draw_mask.o ./Drivers/lvgl.bak/src/draw/lv_draw_mask.su ./Drivers/lvgl.bak/src/draw/lv_draw_rect.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_rect.d ./Drivers/lvgl.bak/src/draw/lv_draw_rect.o ./Drivers/lvgl.bak/src/draw/lv_draw_rect.su ./Drivers/lvgl.bak/src/draw/lv_draw_transform.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_transform.d ./Drivers/lvgl.bak/src/draw/lv_draw_transform.o ./Drivers/lvgl.bak/src/draw/lv_draw_transform.su ./Drivers/lvgl.bak/src/draw/lv_draw_triangle.cyclo ./Drivers/lvgl.bak/src/draw/lv_draw_triangle.d ./Drivers/lvgl.bak/src/draw/lv_draw_triangle.o ./Drivers/lvgl.bak/src/draw/lv_draw_triangle.su ./Drivers/lvgl.bak/src/draw/lv_img_buf.cyclo ./Drivers/lvgl.bak/src/draw/lv_img_buf.d ./Drivers/lvgl.bak/src/draw/lv_img_buf.o ./Drivers/lvgl.bak/src/draw/lv_img_buf.su ./Drivers/lvgl.bak/src/draw/lv_img_cache.cyclo ./Drivers/lvgl.bak/src/draw/lv_img_cache.d ./Drivers/lvgl.bak/src/draw/lv_img_cache.o ./Drivers/lvgl.bak/src/draw/lv_img_cache.su ./Drivers/lvgl.bak/src/draw/lv_img_decoder.cyclo ./Drivers/lvgl.bak/src/draw/lv_img_decoder.d ./Drivers/lvgl.bak/src/draw/lv_img_decoder.o ./Drivers/lvgl.bak/src/draw/lv_img_decoder.su

.PHONY: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw


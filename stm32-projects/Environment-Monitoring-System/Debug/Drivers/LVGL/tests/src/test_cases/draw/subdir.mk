################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/tests/src/test_cases/draw/test_bg_image.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_clip_corner.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_draw_blend.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_draw_label.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_draw_layer.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_draw_letter.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_draw_svg.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_draw_sw_post_process.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_draw_vector.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_image_formats.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_layer_transform.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_al88.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb1555.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb2222.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb4444.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb8888.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_i1.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_l8.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb565.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb888.c \
../Drivers/LVGL/tests/src/test_cases/draw/test_render_to_xrgb8888.c 

OBJS += \
./Drivers/LVGL/tests/src/test_cases/draw/test_bg_image.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_clip_corner.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_blend.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_label.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_layer.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_letter.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_svg.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_sw_post_process.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_vector.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_image_formats.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_layer_transform.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_al88.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb1555.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb2222.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb4444.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb8888.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_i1.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_l8.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb565.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb888.o \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_xrgb8888.o 

C_DEPS += \
./Drivers/LVGL/tests/src/test_cases/draw/test_bg_image.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_clip_corner.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_blend.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_label.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_layer.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_letter.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_svg.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_sw_post_process.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_draw_vector.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_image_formats.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_layer_transform.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_al88.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb1555.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb2222.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb4444.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb8888.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_i1.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_l8.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb565.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb888.d \
./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_xrgb8888.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/tests/src/test_cases/draw/%.o Drivers/LVGL/tests/src/test_cases/draw/%.su Drivers/LVGL/tests/src/test_cases/draw/%.cyclo: ../Drivers/LVGL/tests/src/test_cases/draw/%.c Drivers/LVGL/tests/src/test_cases/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-tests-2f-src-2f-test_cases-2f-draw

clean-Drivers-2f-LVGL-2f-tests-2f-src-2f-test_cases-2f-draw:
	-$(RM) ./Drivers/LVGL/tests/src/test_cases/draw/test_bg_image.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_bg_image.d ./Drivers/LVGL/tests/src/test_cases/draw/test_bg_image.o ./Drivers/LVGL/tests/src/test_cases/draw/test_bg_image.su ./Drivers/LVGL/tests/src/test_cases/draw/test_clip_corner.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_clip_corner.d ./Drivers/LVGL/tests/src/test_cases/draw/test_clip_corner.o ./Drivers/LVGL/tests/src/test_cases/draw/test_clip_corner.su ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_blend.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_blend.d ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_blend.o ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_blend.su ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_label.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_label.d ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_label.o ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_label.su ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_layer.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_layer.d ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_layer.o ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_layer.su ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_letter.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_letter.d ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_letter.o ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_letter.su ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_svg.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_svg.d ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_svg.o ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_svg.su ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_sw_post_process.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_sw_post_process.d ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_sw_post_process.o ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_sw_post_process.su ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_vector.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_vector.d ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_vector.o ./Drivers/LVGL/tests/src/test_cases/draw/test_draw_vector.su ./Drivers/LVGL/tests/src/test_cases/draw/test_image_formats.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_image_formats.d ./Drivers/LVGL/tests/src/test_cases/draw/test_image_formats.o ./Drivers/LVGL/tests/src/test_cases/draw/test_image_formats.su ./Drivers/LVGL/tests/src/test_cases/draw/test_layer_transform.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_layer_transform.d ./Drivers/LVGL/tests/src/test_cases/draw/test_layer_transform.o ./Drivers/LVGL/tests/src/test_cases/draw/test_layer_transform.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_al88.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_al88.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_al88.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_al88.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb1555.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb1555.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb1555.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb1555.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb2222.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb2222.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb2222.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb2222.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb4444.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb4444.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb4444.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb4444.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb8888.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb8888.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb8888.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_argb8888.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_i1.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_i1.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_i1.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_i1.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_l8.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_l8.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_l8.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_l8.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb565.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb565.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb565.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb565.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb888.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb888.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb888.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_rgb888.su ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_xrgb8888.cyclo ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_xrgb8888.d ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_xrgb8888.o ./Drivers/LVGL/tests/src/test_cases/draw/test_render_to_xrgb8888.su

.PHONY: clean-Drivers-2f-LVGL-2f-tests-2f-src-2f-test_cases-2f-draw


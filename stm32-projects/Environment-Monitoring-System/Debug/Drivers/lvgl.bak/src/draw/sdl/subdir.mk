################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_arc.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_bg.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_composite.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_img.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_label.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_layer.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_line.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_mask.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_polygon.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_rect.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_stack_blur.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_texture_cache.c \
../Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_utils.c 

OBJS += \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_arc.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_bg.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_composite.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_img.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_label.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_layer.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_line.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_mask.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_polygon.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_rect.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_stack_blur.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_texture_cache.o \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_utils.o 

C_DEPS += \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_arc.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_bg.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_composite.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_img.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_label.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_layer.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_line.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_mask.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_polygon.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_rect.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_stack_blur.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_texture_cache.d \
./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl.bak/src/draw/sdl/%.o Drivers/lvgl.bak/src/draw/sdl/%.su Drivers/lvgl.bak/src/draw/sdl/%.cyclo: ../Drivers/lvgl.bak/src/draw/sdl/%.c Drivers/lvgl.bak/src/draw/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-sdl

clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-sdl:
	-$(RM) ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_arc.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_arc.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_arc.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_arc.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_bg.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_bg.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_bg.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_bg.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_composite.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_composite.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_composite.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_composite.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_img.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_img.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_img.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_img.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_label.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_label.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_label.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_label.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_layer.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_layer.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_layer.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_layer.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_line.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_line.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_line.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_line.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_mask.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_mask.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_mask.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_mask.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_polygon.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_polygon.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_polygon.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_polygon.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_rect.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_rect.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_rect.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_rect.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_stack_blur.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_stack_blur.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_stack_blur.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_stack_blur.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_texture_cache.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_texture_cache.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_texture_cache.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_texture_cache.su ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_utils.cyclo ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_utils.d ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_utils.o ./Drivers/lvgl.bak/src/draw/sdl/lv_draw_sdl_utils.su

.PHONY: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-sdl


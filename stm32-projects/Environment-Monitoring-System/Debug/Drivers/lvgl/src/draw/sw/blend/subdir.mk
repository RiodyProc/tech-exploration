################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend.c \
../Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.c \
../Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.c \
../Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.c \
../Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.c \
../Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.c \
../Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.c 

OBJS += \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o 

C_DEPS += \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d \
./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/draw/sw/blend/%.o Drivers/lvgl/src/draw/sw/blend/%.su Drivers/lvgl/src/draw/sw/blend/%.cyclo: ../Drivers/lvgl/src/draw/sw/blend/%.c Drivers/lvgl/src/draw/sw/blend/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend

clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend:
	-$(RM) ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend.cyclo ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend.d ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend.o ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend.su ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.cyclo ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.d ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.o ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_al88.su ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.cyclo ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.d ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.o ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_argb8888.su ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.cyclo ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.d ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.o ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_i1.su ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.cyclo ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.d ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.o ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_l8.su ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.cyclo ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.d ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.o ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb565.su ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.cyclo ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.d ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.o ./Drivers/lvgl/src/draw/sw/blend/lv_draw_sw_blend_to_rgb888.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-draw-2f-sw-2f-blend


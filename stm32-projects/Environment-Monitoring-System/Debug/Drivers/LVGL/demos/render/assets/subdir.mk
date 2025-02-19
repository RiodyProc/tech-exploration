################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/demos/render/assets/img_render_arc_bg.c \
../Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_argb8888.c \
../Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_i1.c \
../Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_l8.c \
../Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565.c \
../Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565a8.c \
../Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb888.c \
../Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_xrgb8888.c 

OBJS += \
./Drivers/LVGL/demos/render/assets/img_render_arc_bg.o \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_argb8888.o \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_i1.o \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_l8.o \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565.o \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565a8.o \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb888.o \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_xrgb8888.o 

C_DEPS += \
./Drivers/LVGL/demos/render/assets/img_render_arc_bg.d \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_argb8888.d \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_i1.d \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_l8.d \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565.d \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565a8.d \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb888.d \
./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_xrgb8888.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/demos/render/assets/%.o Drivers/LVGL/demos/render/assets/%.su Drivers/LVGL/demos/render/assets/%.cyclo: ../Drivers/LVGL/demos/render/assets/%.c Drivers/LVGL/demos/render/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-demos-2f-render-2f-assets

clean-Drivers-2f-LVGL-2f-demos-2f-render-2f-assets:
	-$(RM) ./Drivers/LVGL/demos/render/assets/img_render_arc_bg.cyclo ./Drivers/LVGL/demos/render/assets/img_render_arc_bg.d ./Drivers/LVGL/demos/render/assets/img_render_arc_bg.o ./Drivers/LVGL/demos/render/assets/img_render_arc_bg.su ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_argb8888.cyclo ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_argb8888.d ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_argb8888.o ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_argb8888.su ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_i1.cyclo ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_i1.d ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_i1.o ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_i1.su ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_l8.cyclo ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_l8.d ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_l8.o ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_l8.su ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565.cyclo ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565.d ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565.o ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565.su ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565a8.cyclo ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565a8.d ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565a8.o ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb565a8.su ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb888.cyclo ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb888.d ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb888.o ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_rgb888.su ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_xrgb8888.cyclo ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_xrgb8888.d ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_xrgb8888.o ./Drivers/LVGL/demos/render/assets/img_render_lvgl_logo_xrgb8888.su

.PHONY: clean-Drivers-2f-LVGL-2f-demos-2f-render-2f-assets


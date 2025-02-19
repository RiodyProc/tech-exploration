################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/demos/benchmark/assets/img_benchmark_avatar.c \
../Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.c \
../Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.c \
../Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_12_compr_az.c.c \
../Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_16_compr_az.c.c \
../Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_28_compr_az.c.c 

OBJS += \
./Drivers/LVGL/demos/benchmark/assets/img_benchmark_avatar.o \
./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o \
./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o \
./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_12_compr_az.c.o \
./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_16_compr_az.c.o \
./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_28_compr_az.c.o 

C_DEPS += \
./Drivers/LVGL/demos/benchmark/assets/img_benchmark_avatar.d \
./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d \
./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d \
./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_12_compr_az.c.d \
./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_16_compr_az.c.d \
./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_28_compr_az.c.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/demos/benchmark/assets/%.o Drivers/LVGL/demos/benchmark/assets/%.su Drivers/LVGL/demos/benchmark/assets/%.cyclo: ../Drivers/LVGL/demos/benchmark/assets/%.c Drivers/LVGL/demos/benchmark/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-demos-2f-benchmark-2f-assets

clean-Drivers-2f-LVGL-2f-demos-2f-benchmark-2f-assets:
	-$(RM) ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_avatar.cyclo ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_avatar.d ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_avatar.o ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_avatar.su ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.cyclo ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.d ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.o ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_argb.su ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.cyclo ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.d ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.o ./Drivers/LVGL/demos/benchmark/assets/img_benchmark_lvgl_logo_rgb.su ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_12_compr_az.c.cyclo ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_12_compr_az.c.d ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_12_compr_az.c.o ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_12_compr_az.c.su ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_16_compr_az.c.cyclo ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_16_compr_az.c.d ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_16_compr_az.c.o ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_16_compr_az.c.su ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_28_compr_az.c.cyclo ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_28_compr_az.c.d ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_28_compr_az.c.o ./Drivers/LVGL/demos/benchmark/assets/lv_font_benchmark_montserrat_28_compr_az.c.su

.PHONY: clean-Drivers-2f-LVGL-2f-demos-2f-benchmark-2f-assets


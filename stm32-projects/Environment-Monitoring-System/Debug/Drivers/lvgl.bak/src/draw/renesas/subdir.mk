################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_draw_label.c \
../Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_ra6m3.c 

OBJS += \
./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_draw_label.o \
./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_ra6m3.o 

C_DEPS += \
./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_draw_label.d \
./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_ra6m3.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl.bak/src/draw/renesas/%.o Drivers/lvgl.bak/src/draw/renesas/%.su Drivers/lvgl.bak/src/draw/renesas/%.cyclo: ../Drivers/lvgl.bak/src/draw/renesas/%.c Drivers/lvgl.bak/src/draw/renesas/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-renesas

clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-renesas:
	-$(RM) ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_draw_label.cyclo ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_draw_label.d ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_draw_label.o ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_draw_label.su ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_ra6m3.cyclo ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_ra6m3.d ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_ra6m3.o ./Drivers/lvgl.bak/src/draw/renesas/lv_gpu_d2_ra6m3.su

.PHONY: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-draw-2f-renesas


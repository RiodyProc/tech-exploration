################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/draw/nxp/pxp/lv_draw_buf_pxp.c \
../Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp.c \
../Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_fill.c \
../Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_img.c \
../Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_layer.c \
../Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_cfg.c \
../Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_osa.c \
../Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_utils.c 

OBJS += \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_buf_pxp.o \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp.o \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_fill.o \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_img.o \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_layer.o \
./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_cfg.o \
./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_osa.o \
./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_utils.o 

C_DEPS += \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_buf_pxp.d \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp.d \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_fill.d \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_img.d \
./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_layer.d \
./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_cfg.d \
./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_osa.d \
./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/draw/nxp/pxp/%.o Drivers/LVGL/src/draw/nxp/pxp/%.su Drivers/LVGL/src/draw/nxp/pxp/%.cyclo: ../Drivers/LVGL/src/draw/nxp/pxp/%.c Drivers/LVGL/src/draw/nxp/pxp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-pxp

clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-pxp:
	-$(RM) ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_buf_pxp.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_buf_pxp.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_buf_pxp.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_buf_pxp.su ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp.su ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_fill.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_fill.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_fill.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_fill.su ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_img.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_img.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_img.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_img.su ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_layer.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_layer.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_layer.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_draw_pxp_layer.su ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_cfg.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_cfg.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_cfg.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_cfg.su ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_osa.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_osa.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_osa.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_osa.su ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_utils.cyclo ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_utils.d ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_utils.o ./Drivers/LVGL/src/draw/nxp/pxp/lv_pxp_utils.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-pxp


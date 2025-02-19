################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/examples/assets/animimg001.c \
../Drivers/LVGL/examples/assets/animimg002.c \
../Drivers/LVGL/examples/assets/animimg003.c \
../Drivers/LVGL/examples/assets/img_caret_down.c \
../Drivers/LVGL/examples/assets/img_cogwheel_argb.c \
../Drivers/LVGL/examples/assets/img_cogwheel_indexed16.c \
../Drivers/LVGL/examples/assets/img_cogwheel_rgb.c \
../Drivers/LVGL/examples/assets/img_hand.c \
../Drivers/LVGL/examples/assets/img_skew_strip.c \
../Drivers/LVGL/examples/assets/img_star.c \
../Drivers/LVGL/examples/assets/imgbtn_left.c \
../Drivers/LVGL/examples/assets/imgbtn_mid.c \
../Drivers/LVGL/examples/assets/imgbtn_right.c 

OBJS += \
./Drivers/LVGL/examples/assets/animimg001.o \
./Drivers/LVGL/examples/assets/animimg002.o \
./Drivers/LVGL/examples/assets/animimg003.o \
./Drivers/LVGL/examples/assets/img_caret_down.o \
./Drivers/LVGL/examples/assets/img_cogwheel_argb.o \
./Drivers/LVGL/examples/assets/img_cogwheel_indexed16.o \
./Drivers/LVGL/examples/assets/img_cogwheel_rgb.o \
./Drivers/LVGL/examples/assets/img_hand.o \
./Drivers/LVGL/examples/assets/img_skew_strip.o \
./Drivers/LVGL/examples/assets/img_star.o \
./Drivers/LVGL/examples/assets/imgbtn_left.o \
./Drivers/LVGL/examples/assets/imgbtn_mid.o \
./Drivers/LVGL/examples/assets/imgbtn_right.o 

C_DEPS += \
./Drivers/LVGL/examples/assets/animimg001.d \
./Drivers/LVGL/examples/assets/animimg002.d \
./Drivers/LVGL/examples/assets/animimg003.d \
./Drivers/LVGL/examples/assets/img_caret_down.d \
./Drivers/LVGL/examples/assets/img_cogwheel_argb.d \
./Drivers/LVGL/examples/assets/img_cogwheel_indexed16.d \
./Drivers/LVGL/examples/assets/img_cogwheel_rgb.d \
./Drivers/LVGL/examples/assets/img_hand.d \
./Drivers/LVGL/examples/assets/img_skew_strip.d \
./Drivers/LVGL/examples/assets/img_star.d \
./Drivers/LVGL/examples/assets/imgbtn_left.d \
./Drivers/LVGL/examples/assets/imgbtn_mid.d \
./Drivers/LVGL/examples/assets/imgbtn_right.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/examples/assets/%.o Drivers/LVGL/examples/assets/%.su Drivers/LVGL/examples/assets/%.cyclo: ../Drivers/LVGL/examples/assets/%.c Drivers/LVGL/examples/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-examples-2f-assets

clean-Drivers-2f-LVGL-2f-examples-2f-assets:
	-$(RM) ./Drivers/LVGL/examples/assets/animimg001.cyclo ./Drivers/LVGL/examples/assets/animimg001.d ./Drivers/LVGL/examples/assets/animimg001.o ./Drivers/LVGL/examples/assets/animimg001.su ./Drivers/LVGL/examples/assets/animimg002.cyclo ./Drivers/LVGL/examples/assets/animimg002.d ./Drivers/LVGL/examples/assets/animimg002.o ./Drivers/LVGL/examples/assets/animimg002.su ./Drivers/LVGL/examples/assets/animimg003.cyclo ./Drivers/LVGL/examples/assets/animimg003.d ./Drivers/LVGL/examples/assets/animimg003.o ./Drivers/LVGL/examples/assets/animimg003.su ./Drivers/LVGL/examples/assets/img_caret_down.cyclo ./Drivers/LVGL/examples/assets/img_caret_down.d ./Drivers/LVGL/examples/assets/img_caret_down.o ./Drivers/LVGL/examples/assets/img_caret_down.su ./Drivers/LVGL/examples/assets/img_cogwheel_argb.cyclo ./Drivers/LVGL/examples/assets/img_cogwheel_argb.d ./Drivers/LVGL/examples/assets/img_cogwheel_argb.o ./Drivers/LVGL/examples/assets/img_cogwheel_argb.su ./Drivers/LVGL/examples/assets/img_cogwheel_indexed16.cyclo ./Drivers/LVGL/examples/assets/img_cogwheel_indexed16.d ./Drivers/LVGL/examples/assets/img_cogwheel_indexed16.o ./Drivers/LVGL/examples/assets/img_cogwheel_indexed16.su ./Drivers/LVGL/examples/assets/img_cogwheel_rgb.cyclo ./Drivers/LVGL/examples/assets/img_cogwheel_rgb.d ./Drivers/LVGL/examples/assets/img_cogwheel_rgb.o ./Drivers/LVGL/examples/assets/img_cogwheel_rgb.su ./Drivers/LVGL/examples/assets/img_hand.cyclo ./Drivers/LVGL/examples/assets/img_hand.d ./Drivers/LVGL/examples/assets/img_hand.o ./Drivers/LVGL/examples/assets/img_hand.su ./Drivers/LVGL/examples/assets/img_skew_strip.cyclo ./Drivers/LVGL/examples/assets/img_skew_strip.d ./Drivers/LVGL/examples/assets/img_skew_strip.o ./Drivers/LVGL/examples/assets/img_skew_strip.su ./Drivers/LVGL/examples/assets/img_star.cyclo ./Drivers/LVGL/examples/assets/img_star.d ./Drivers/LVGL/examples/assets/img_star.o ./Drivers/LVGL/examples/assets/img_star.su ./Drivers/LVGL/examples/assets/imgbtn_left.cyclo ./Drivers/LVGL/examples/assets/imgbtn_left.d ./Drivers/LVGL/examples/assets/imgbtn_left.o ./Drivers/LVGL/examples/assets/imgbtn_left.su ./Drivers/LVGL/examples/assets/imgbtn_mid.cyclo ./Drivers/LVGL/examples/assets/imgbtn_mid.d ./Drivers/LVGL/examples/assets/imgbtn_mid.o ./Drivers/LVGL/examples/assets/imgbtn_mid.su ./Drivers/LVGL/examples/assets/imgbtn_right.cyclo ./Drivers/LVGL/examples/assets/imgbtn_right.d ./Drivers/LVGL/examples/assets/imgbtn_right.o ./Drivers/LVGL/examples/assets/imgbtn_right.su

.PHONY: clean-Drivers-2f-LVGL-2f-examples-2f-assets


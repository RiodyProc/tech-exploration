################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/examples/styles/lv_example_style_1.c \
../Drivers/LVGL/examples/styles/lv_example_style_10.c \
../Drivers/LVGL/examples/styles/lv_example_style_11.c \
../Drivers/LVGL/examples/styles/lv_example_style_12.c \
../Drivers/LVGL/examples/styles/lv_example_style_13.c \
../Drivers/LVGL/examples/styles/lv_example_style_14.c \
../Drivers/LVGL/examples/styles/lv_example_style_15.c \
../Drivers/LVGL/examples/styles/lv_example_style_16.c \
../Drivers/LVGL/examples/styles/lv_example_style_17.c \
../Drivers/LVGL/examples/styles/lv_example_style_18.c \
../Drivers/LVGL/examples/styles/lv_example_style_2.c \
../Drivers/LVGL/examples/styles/lv_example_style_3.c \
../Drivers/LVGL/examples/styles/lv_example_style_4.c \
../Drivers/LVGL/examples/styles/lv_example_style_5.c \
../Drivers/LVGL/examples/styles/lv_example_style_6.c \
../Drivers/LVGL/examples/styles/lv_example_style_7.c \
../Drivers/LVGL/examples/styles/lv_example_style_8.c \
../Drivers/LVGL/examples/styles/lv_example_style_9.c 

OBJS += \
./Drivers/LVGL/examples/styles/lv_example_style_1.o \
./Drivers/LVGL/examples/styles/lv_example_style_10.o \
./Drivers/LVGL/examples/styles/lv_example_style_11.o \
./Drivers/LVGL/examples/styles/lv_example_style_12.o \
./Drivers/LVGL/examples/styles/lv_example_style_13.o \
./Drivers/LVGL/examples/styles/lv_example_style_14.o \
./Drivers/LVGL/examples/styles/lv_example_style_15.o \
./Drivers/LVGL/examples/styles/lv_example_style_16.o \
./Drivers/LVGL/examples/styles/lv_example_style_17.o \
./Drivers/LVGL/examples/styles/lv_example_style_18.o \
./Drivers/LVGL/examples/styles/lv_example_style_2.o \
./Drivers/LVGL/examples/styles/lv_example_style_3.o \
./Drivers/LVGL/examples/styles/lv_example_style_4.o \
./Drivers/LVGL/examples/styles/lv_example_style_5.o \
./Drivers/LVGL/examples/styles/lv_example_style_6.o \
./Drivers/LVGL/examples/styles/lv_example_style_7.o \
./Drivers/LVGL/examples/styles/lv_example_style_8.o \
./Drivers/LVGL/examples/styles/lv_example_style_9.o 

C_DEPS += \
./Drivers/LVGL/examples/styles/lv_example_style_1.d \
./Drivers/LVGL/examples/styles/lv_example_style_10.d \
./Drivers/LVGL/examples/styles/lv_example_style_11.d \
./Drivers/LVGL/examples/styles/lv_example_style_12.d \
./Drivers/LVGL/examples/styles/lv_example_style_13.d \
./Drivers/LVGL/examples/styles/lv_example_style_14.d \
./Drivers/LVGL/examples/styles/lv_example_style_15.d \
./Drivers/LVGL/examples/styles/lv_example_style_16.d \
./Drivers/LVGL/examples/styles/lv_example_style_17.d \
./Drivers/LVGL/examples/styles/lv_example_style_18.d \
./Drivers/LVGL/examples/styles/lv_example_style_2.d \
./Drivers/LVGL/examples/styles/lv_example_style_3.d \
./Drivers/LVGL/examples/styles/lv_example_style_4.d \
./Drivers/LVGL/examples/styles/lv_example_style_5.d \
./Drivers/LVGL/examples/styles/lv_example_style_6.d \
./Drivers/LVGL/examples/styles/lv_example_style_7.d \
./Drivers/LVGL/examples/styles/lv_example_style_8.d \
./Drivers/LVGL/examples/styles/lv_example_style_9.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/examples/styles/%.o Drivers/LVGL/examples/styles/%.su Drivers/LVGL/examples/styles/%.cyclo: ../Drivers/LVGL/examples/styles/%.c Drivers/LVGL/examples/styles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-examples-2f-styles

clean-Drivers-2f-LVGL-2f-examples-2f-styles:
	-$(RM) ./Drivers/LVGL/examples/styles/lv_example_style_1.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_1.d ./Drivers/LVGL/examples/styles/lv_example_style_1.o ./Drivers/LVGL/examples/styles/lv_example_style_1.su ./Drivers/LVGL/examples/styles/lv_example_style_10.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_10.d ./Drivers/LVGL/examples/styles/lv_example_style_10.o ./Drivers/LVGL/examples/styles/lv_example_style_10.su ./Drivers/LVGL/examples/styles/lv_example_style_11.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_11.d ./Drivers/LVGL/examples/styles/lv_example_style_11.o ./Drivers/LVGL/examples/styles/lv_example_style_11.su ./Drivers/LVGL/examples/styles/lv_example_style_12.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_12.d ./Drivers/LVGL/examples/styles/lv_example_style_12.o ./Drivers/LVGL/examples/styles/lv_example_style_12.su ./Drivers/LVGL/examples/styles/lv_example_style_13.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_13.d ./Drivers/LVGL/examples/styles/lv_example_style_13.o ./Drivers/LVGL/examples/styles/lv_example_style_13.su ./Drivers/LVGL/examples/styles/lv_example_style_14.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_14.d ./Drivers/LVGL/examples/styles/lv_example_style_14.o ./Drivers/LVGL/examples/styles/lv_example_style_14.su ./Drivers/LVGL/examples/styles/lv_example_style_15.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_15.d ./Drivers/LVGL/examples/styles/lv_example_style_15.o ./Drivers/LVGL/examples/styles/lv_example_style_15.su ./Drivers/LVGL/examples/styles/lv_example_style_16.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_16.d ./Drivers/LVGL/examples/styles/lv_example_style_16.o ./Drivers/LVGL/examples/styles/lv_example_style_16.su ./Drivers/LVGL/examples/styles/lv_example_style_17.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_17.d ./Drivers/LVGL/examples/styles/lv_example_style_17.o ./Drivers/LVGL/examples/styles/lv_example_style_17.su ./Drivers/LVGL/examples/styles/lv_example_style_18.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_18.d ./Drivers/LVGL/examples/styles/lv_example_style_18.o ./Drivers/LVGL/examples/styles/lv_example_style_18.su ./Drivers/LVGL/examples/styles/lv_example_style_2.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_2.d ./Drivers/LVGL/examples/styles/lv_example_style_2.o ./Drivers/LVGL/examples/styles/lv_example_style_2.su ./Drivers/LVGL/examples/styles/lv_example_style_3.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_3.d ./Drivers/LVGL/examples/styles/lv_example_style_3.o ./Drivers/LVGL/examples/styles/lv_example_style_3.su ./Drivers/LVGL/examples/styles/lv_example_style_4.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_4.d ./Drivers/LVGL/examples/styles/lv_example_style_4.o ./Drivers/LVGL/examples/styles/lv_example_style_4.su ./Drivers/LVGL/examples/styles/lv_example_style_5.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_5.d ./Drivers/LVGL/examples/styles/lv_example_style_5.o ./Drivers/LVGL/examples/styles/lv_example_style_5.su ./Drivers/LVGL/examples/styles/lv_example_style_6.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_6.d ./Drivers/LVGL/examples/styles/lv_example_style_6.o ./Drivers/LVGL/examples/styles/lv_example_style_6.su ./Drivers/LVGL/examples/styles/lv_example_style_7.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_7.d ./Drivers/LVGL/examples/styles/lv_example_style_7.o ./Drivers/LVGL/examples/styles/lv_example_style_7.su ./Drivers/LVGL/examples/styles/lv_example_style_8.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_8.d ./Drivers/LVGL/examples/styles/lv_example_style_8.o ./Drivers/LVGL/examples/styles/lv_example_style_8.su ./Drivers/LVGL/examples/styles/lv_example_style_9.cyclo ./Drivers/LVGL/examples/styles/lv_example_style_9.d ./Drivers/LVGL/examples/styles/lv_example_style_9.o ./Drivers/LVGL/examples/styles/lv_example_style_9.su

.PHONY: clean-Drivers-2f-LVGL-2f-examples-2f-styles


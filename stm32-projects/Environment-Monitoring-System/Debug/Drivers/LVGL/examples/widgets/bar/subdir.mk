################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/examples/widgets/bar/lv_example_bar_1.c \
../Drivers/LVGL/examples/widgets/bar/lv_example_bar_2.c \
../Drivers/LVGL/examples/widgets/bar/lv_example_bar_3.c \
../Drivers/LVGL/examples/widgets/bar/lv_example_bar_4.c \
../Drivers/LVGL/examples/widgets/bar/lv_example_bar_5.c \
../Drivers/LVGL/examples/widgets/bar/lv_example_bar_6.c \
../Drivers/LVGL/examples/widgets/bar/lv_example_bar_7.c 

OBJS += \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_1.o \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_2.o \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_3.o \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_4.o \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_5.o \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_6.o \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_7.o 

C_DEPS += \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_1.d \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_2.d \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_3.d \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_4.d \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_5.d \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_6.d \
./Drivers/LVGL/examples/widgets/bar/lv_example_bar_7.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/examples/widgets/bar/%.o Drivers/LVGL/examples/widgets/bar/%.su Drivers/LVGL/examples/widgets/bar/%.cyclo: ../Drivers/LVGL/examples/widgets/bar/%.c Drivers/LVGL/examples/widgets/bar/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-examples-2f-widgets-2f-bar

clean-Drivers-2f-LVGL-2f-examples-2f-widgets-2f-bar:
	-$(RM) ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_1.cyclo ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_1.d ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_1.o ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_1.su ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_2.cyclo ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_2.d ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_2.o ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_2.su ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_3.cyclo ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_3.d ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_3.o ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_3.su ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_4.cyclo ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_4.d ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_4.o ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_4.su ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_5.cyclo ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_5.d ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_5.o ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_5.su ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_6.cyclo ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_6.d ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_6.o ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_6.su ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_7.cyclo ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_7.d ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_7.o ./Drivers/LVGL/examples/widgets/bar/lv_example_bar_7.su

.PHONY: clean-Drivers-2f-LVGL-2f-examples-2f-widgets-2f-bar


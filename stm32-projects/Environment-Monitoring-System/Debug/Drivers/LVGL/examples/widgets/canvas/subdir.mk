################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_1.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_10.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_2.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_3.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_4.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_5.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_6.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_7.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_8.c \
../Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_9.c 

OBJS += \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_1.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_10.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_2.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_3.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_4.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_5.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_6.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_7.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_8.o \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_9.o 

C_DEPS += \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_1.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_10.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_2.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_3.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_4.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_5.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_6.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_7.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_8.d \
./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_9.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/examples/widgets/canvas/%.o Drivers/LVGL/examples/widgets/canvas/%.su Drivers/LVGL/examples/widgets/canvas/%.cyclo: ../Drivers/LVGL/examples/widgets/canvas/%.c Drivers/LVGL/examples/widgets/canvas/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-examples-2f-widgets-2f-canvas

clean-Drivers-2f-LVGL-2f-examples-2f-widgets-2f-canvas:
	-$(RM) ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_1.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_1.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_1.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_1.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_10.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_10.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_10.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_10.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_2.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_2.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_2.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_2.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_3.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_3.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_3.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_3.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_4.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_4.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_4.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_4.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_5.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_5.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_5.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_5.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_6.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_6.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_6.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_6.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_7.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_7.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_7.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_7.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_8.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_8.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_8.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_8.su ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_9.cyclo ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_9.d ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_9.o ./Drivers/LVGL/examples/widgets/canvas/lv_example_canvas_9.su

.PHONY: clean-Drivers-2f-LVGL-2f-examples-2f-widgets-2f-canvas


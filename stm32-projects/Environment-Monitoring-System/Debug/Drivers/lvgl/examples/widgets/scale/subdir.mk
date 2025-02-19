################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_1.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_2.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_3.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_4.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_5.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_6.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_7.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_8.c \
../Drivers/lvgl/examples/widgets/scale/lv_example_scale_9.c 

OBJS += \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_1.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_2.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_3.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_4.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_5.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_6.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_7.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_8.o \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_9.o 

C_DEPS += \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_1.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_2.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_3.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_4.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_5.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_6.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_7.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_8.d \
./Drivers/lvgl/examples/widgets/scale/lv_example_scale_9.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/widgets/scale/%.o Drivers/lvgl/examples/widgets/scale/%.su Drivers/lvgl/examples/widgets/scale/%.cyclo: ../Drivers/lvgl/examples/widgets/scale/%.c Drivers/lvgl/examples/widgets/scale/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-scale

clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-scale:
	-$(RM) ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_1.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_1.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_1.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_1.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_2.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_2.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_2.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_2.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_3.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_3.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_3.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_3.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_4.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_4.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_4.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_4.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_5.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_5.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_5.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_5.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_6.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_6.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_6.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_6.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_7.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_7.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_7.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_7.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_8.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_8.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_8.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_8.su ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_9.cyclo ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_9.d ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_9.o ./Drivers/lvgl/examples/widgets/scale/lv_example_scale_9.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-scale


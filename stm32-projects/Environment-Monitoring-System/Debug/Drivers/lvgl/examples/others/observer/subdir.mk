################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/others/observer/lv_example_observer_1.c \
../Drivers/lvgl/examples/others/observer/lv_example_observer_2.c \
../Drivers/lvgl/examples/others/observer/lv_example_observer_3.c \
../Drivers/lvgl/examples/others/observer/lv_example_observer_4.c \
../Drivers/lvgl/examples/others/observer/lv_example_observer_5.c \
../Drivers/lvgl/examples/others/observer/lv_example_observer_6.c 

OBJS += \
./Drivers/lvgl/examples/others/observer/lv_example_observer_1.o \
./Drivers/lvgl/examples/others/observer/lv_example_observer_2.o \
./Drivers/lvgl/examples/others/observer/lv_example_observer_3.o \
./Drivers/lvgl/examples/others/observer/lv_example_observer_4.o \
./Drivers/lvgl/examples/others/observer/lv_example_observer_5.o \
./Drivers/lvgl/examples/others/observer/lv_example_observer_6.o 

C_DEPS += \
./Drivers/lvgl/examples/others/observer/lv_example_observer_1.d \
./Drivers/lvgl/examples/others/observer/lv_example_observer_2.d \
./Drivers/lvgl/examples/others/observer/lv_example_observer_3.d \
./Drivers/lvgl/examples/others/observer/lv_example_observer_4.d \
./Drivers/lvgl/examples/others/observer/lv_example_observer_5.d \
./Drivers/lvgl/examples/others/observer/lv_example_observer_6.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/others/observer/%.o Drivers/lvgl/examples/others/observer/%.su Drivers/lvgl/examples/others/observer/%.cyclo: ../Drivers/lvgl/examples/others/observer/%.c Drivers/lvgl/examples/others/observer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-others-2f-observer

clean-Drivers-2f-lvgl-2f-examples-2f-others-2f-observer:
	-$(RM) ./Drivers/lvgl/examples/others/observer/lv_example_observer_1.cyclo ./Drivers/lvgl/examples/others/observer/lv_example_observer_1.d ./Drivers/lvgl/examples/others/observer/lv_example_observer_1.o ./Drivers/lvgl/examples/others/observer/lv_example_observer_1.su ./Drivers/lvgl/examples/others/observer/lv_example_observer_2.cyclo ./Drivers/lvgl/examples/others/observer/lv_example_observer_2.d ./Drivers/lvgl/examples/others/observer/lv_example_observer_2.o ./Drivers/lvgl/examples/others/observer/lv_example_observer_2.su ./Drivers/lvgl/examples/others/observer/lv_example_observer_3.cyclo ./Drivers/lvgl/examples/others/observer/lv_example_observer_3.d ./Drivers/lvgl/examples/others/observer/lv_example_observer_3.o ./Drivers/lvgl/examples/others/observer/lv_example_observer_3.su ./Drivers/lvgl/examples/others/observer/lv_example_observer_4.cyclo ./Drivers/lvgl/examples/others/observer/lv_example_observer_4.d ./Drivers/lvgl/examples/others/observer/lv_example_observer_4.o ./Drivers/lvgl/examples/others/observer/lv_example_observer_4.su ./Drivers/lvgl/examples/others/observer/lv_example_observer_5.cyclo ./Drivers/lvgl/examples/others/observer/lv_example_observer_5.d ./Drivers/lvgl/examples/others/observer/lv_example_observer_5.o ./Drivers/lvgl/examples/others/observer/lv_example_observer_5.su ./Drivers/lvgl/examples/others/observer/lv_example_observer_6.cyclo ./Drivers/lvgl/examples/others/observer/lv_example_observer_6.d ./Drivers/lvgl/examples/others/observer/lv_example_observer_6.o ./Drivers/lvgl/examples/others/observer/lv_example_observer_6.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-others-2f-observer


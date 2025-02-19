################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_1.c \
../Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_2.c \
../Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_3.c 

OBJS += \
./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_1.o \
./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_2.o \
./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_3.o 

C_DEPS += \
./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_1.d \
./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_2.d \
./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_3.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/examples/widgets/btnmatrix/%.o Drivers/lvgl/examples/widgets/btnmatrix/%.su Drivers/lvgl/examples/widgets/btnmatrix/%.cyclo: ../Drivers/lvgl/examples/widgets/btnmatrix/%.c Drivers/lvgl/examples/widgets/btnmatrix/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/UI" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-btnmatrix

clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-btnmatrix:
	-$(RM) ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_1.cyclo ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_1.d ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_1.o ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_1.su ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_2.cyclo ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_2.d ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_2.o ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_2.su ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_3.cyclo ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_3.d ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_3.o ./Drivers/lvgl/examples/widgets/btnmatrix/lv_example_btnmatrix_3.su

.PHONY: clean-Drivers-2f-lvgl-2f-examples-2f-widgets-2f-btnmatrix


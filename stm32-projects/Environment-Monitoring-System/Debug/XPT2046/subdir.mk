################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../XPT2046/calibrate_touch.c \
../XPT2046/xpt2046.c 

OBJS += \
./XPT2046/calibrate_touch.o \
./XPT2046/xpt2046.o 

C_DEPS += \
./XPT2046/calibrate_touch.d \
./XPT2046/xpt2046.d 


# Each subdirectory must supply rules for building sources it contributes
XPT2046/%.o XPT2046/%.su XPT2046/%.cyclo: ../XPT2046/%.c XPT2046/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/UI" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-XPT2046

clean-XPT2046:
	-$(RM) ./XPT2046/calibrate_touch.cyclo ./XPT2046/calibrate_touch.d ./XPT2046/calibrate_touch.o ./XPT2046/calibrate_touch.su ./XPT2046/xpt2046.cyclo ./XPT2046/xpt2046.d ./XPT2046/xpt2046.o ./XPT2046/xpt2046.su

.PHONY: clean-XPT2046


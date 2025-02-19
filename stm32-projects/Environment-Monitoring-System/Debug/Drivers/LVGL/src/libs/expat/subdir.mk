################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/libs/expat/xmlparse.c \
../Drivers/LVGL/src/libs/expat/xmlrole.c \
../Drivers/LVGL/src/libs/expat/xmltok.c \
../Drivers/LVGL/src/libs/expat/xmltok_impl.c \
../Drivers/LVGL/src/libs/expat/xmltok_ns.c 

OBJS += \
./Drivers/LVGL/src/libs/expat/xmlparse.o \
./Drivers/LVGL/src/libs/expat/xmlrole.o \
./Drivers/LVGL/src/libs/expat/xmltok.o \
./Drivers/LVGL/src/libs/expat/xmltok_impl.o \
./Drivers/LVGL/src/libs/expat/xmltok_ns.o 

C_DEPS += \
./Drivers/LVGL/src/libs/expat/xmlparse.d \
./Drivers/LVGL/src/libs/expat/xmlrole.d \
./Drivers/LVGL/src/libs/expat/xmltok.d \
./Drivers/LVGL/src/libs/expat/xmltok_impl.d \
./Drivers/LVGL/src/libs/expat/xmltok_ns.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/libs/expat/%.o Drivers/LVGL/src/libs/expat/%.su Drivers/LVGL/src/libs/expat/%.cyclo: ../Drivers/LVGL/src/libs/expat/%.c Drivers/LVGL/src/libs/expat/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-libs-2f-expat

clean-Drivers-2f-LVGL-2f-src-2f-libs-2f-expat:
	-$(RM) ./Drivers/LVGL/src/libs/expat/xmlparse.cyclo ./Drivers/LVGL/src/libs/expat/xmlparse.d ./Drivers/LVGL/src/libs/expat/xmlparse.o ./Drivers/LVGL/src/libs/expat/xmlparse.su ./Drivers/LVGL/src/libs/expat/xmlrole.cyclo ./Drivers/LVGL/src/libs/expat/xmlrole.d ./Drivers/LVGL/src/libs/expat/xmlrole.o ./Drivers/LVGL/src/libs/expat/xmlrole.su ./Drivers/LVGL/src/libs/expat/xmltok.cyclo ./Drivers/LVGL/src/libs/expat/xmltok.d ./Drivers/LVGL/src/libs/expat/xmltok.o ./Drivers/LVGL/src/libs/expat/xmltok.su ./Drivers/LVGL/src/libs/expat/xmltok_impl.cyclo ./Drivers/LVGL/src/libs/expat/xmltok_impl.d ./Drivers/LVGL/src/libs/expat/xmltok_impl.o ./Drivers/LVGL/src/libs/expat/xmltok_impl.su ./Drivers/LVGL/src/libs/expat/xmltok_ns.cyclo ./Drivers/LVGL/src/libs/expat/xmltok_ns.d ./Drivers/LVGL/src/libs/expat/xmltok_ns.o ./Drivers/LVGL/src/libs/expat/xmltok_ns.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-libs-2f-expat


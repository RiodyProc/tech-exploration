################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/drivers/uefi/lv_uefi_context.c \
../Drivers/LVGL/src/drivers/uefi/lv_uefi_display.c \
../Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_keyboard.c \
../Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_pointer.c \
../Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_touch.c \
../Drivers/LVGL/src/drivers/uefi/lv_uefi_private.c 

OBJS += \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_context.o \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_display.o \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_keyboard.o \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_pointer.o \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_touch.o \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_private.o 

C_DEPS += \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_context.d \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_display.d \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_keyboard.d \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_pointer.d \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_touch.d \
./Drivers/LVGL/src/drivers/uefi/lv_uefi_private.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/drivers/uefi/%.o Drivers/LVGL/src/drivers/uefi/%.su Drivers/LVGL/src/drivers/uefi/%.cyclo: ../Drivers/LVGL/src/drivers/uefi/%.c Drivers/LVGL/src/drivers/uefi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-uefi

clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-uefi:
	-$(RM) ./Drivers/LVGL/src/drivers/uefi/lv_uefi_context.cyclo ./Drivers/LVGL/src/drivers/uefi/lv_uefi_context.d ./Drivers/LVGL/src/drivers/uefi/lv_uefi_context.o ./Drivers/LVGL/src/drivers/uefi/lv_uefi_context.su ./Drivers/LVGL/src/drivers/uefi/lv_uefi_display.cyclo ./Drivers/LVGL/src/drivers/uefi/lv_uefi_display.d ./Drivers/LVGL/src/drivers/uefi/lv_uefi_display.o ./Drivers/LVGL/src/drivers/uefi/lv_uefi_display.su ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_keyboard.cyclo ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_keyboard.d ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_keyboard.o ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_keyboard.su ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_pointer.cyclo ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_pointer.d ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_pointer.o ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_pointer.su ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_touch.cyclo ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_touch.d ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_touch.o ./Drivers/LVGL/src/drivers/uefi/lv_uefi_indev_touch.su ./Drivers/LVGL/src/drivers/uefi/lv_uefi_private.cyclo ./Drivers/LVGL/src/drivers/uefi/lv_uefi_private.d ./Drivers/LVGL/src/drivers/uefi/lv_uefi_private.o ./Drivers/LVGL/src/drivers/uefi/lv_uefi_private.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-uefi


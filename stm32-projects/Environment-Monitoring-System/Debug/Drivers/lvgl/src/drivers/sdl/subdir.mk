################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/drivers/sdl/lv_sdl_keyboard.c \
../Drivers/lvgl/src/drivers/sdl/lv_sdl_mouse.c \
../Drivers/lvgl/src/drivers/sdl/lv_sdl_mousewheel.c \
../Drivers/lvgl/src/drivers/sdl/lv_sdl_window.c 

OBJS += \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_keyboard.o \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_mouse.o \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_window.o 

C_DEPS += \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_keyboard.d \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_mouse.d \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d \
./Drivers/lvgl/src/drivers/sdl/lv_sdl_window.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/drivers/sdl/%.o Drivers/lvgl/src/drivers/sdl/%.su Drivers/lvgl/src/drivers/sdl/%.cyclo: ../Drivers/lvgl/src/drivers/sdl/%.c Drivers/lvgl/src/drivers/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-sdl

clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-sdl:
	-$(RM) ./Drivers/lvgl/src/drivers/sdl/lv_sdl_keyboard.cyclo ./Drivers/lvgl/src/drivers/sdl/lv_sdl_keyboard.d ./Drivers/lvgl/src/drivers/sdl/lv_sdl_keyboard.o ./Drivers/lvgl/src/drivers/sdl/lv_sdl_keyboard.su ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mouse.cyclo ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mouse.d ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mouse.o ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mouse.su ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mousewheel.cyclo ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mousewheel.d ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mousewheel.o ./Drivers/lvgl/src/drivers/sdl/lv_sdl_mousewheel.su ./Drivers/lvgl/src/drivers/sdl/lv_sdl_window.cyclo ./Drivers/lvgl/src/drivers/sdl/lv_sdl_window.d ./Drivers/lvgl/src/drivers/sdl/lv_sdl_window.o ./Drivers/lvgl/src/drivers/sdl/lv_sdl_window.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-drivers-2f-sdl


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/drivers/glfw/lv_glfw_window.c \
../Drivers/LVGL/src/drivers/glfw/lv_opengles_debug.c \
../Drivers/LVGL/src/drivers/glfw/lv_opengles_driver.c \
../Drivers/LVGL/src/drivers/glfw/lv_opengles_texture.c 

OBJS += \
./Drivers/LVGL/src/drivers/glfw/lv_glfw_window.o \
./Drivers/LVGL/src/drivers/glfw/lv_opengles_debug.o \
./Drivers/LVGL/src/drivers/glfw/lv_opengles_driver.o \
./Drivers/LVGL/src/drivers/glfw/lv_opengles_texture.o 

C_DEPS += \
./Drivers/LVGL/src/drivers/glfw/lv_glfw_window.d \
./Drivers/LVGL/src/drivers/glfw/lv_opengles_debug.d \
./Drivers/LVGL/src/drivers/glfw/lv_opengles_driver.d \
./Drivers/LVGL/src/drivers/glfw/lv_opengles_texture.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/drivers/glfw/%.o Drivers/LVGL/src/drivers/glfw/%.su Drivers/LVGL/src/drivers/glfw/%.cyclo: ../Drivers/LVGL/src/drivers/glfw/%.c Drivers/LVGL/src/drivers/glfw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-glfw

clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-glfw:
	-$(RM) ./Drivers/LVGL/src/drivers/glfw/lv_glfw_window.cyclo ./Drivers/LVGL/src/drivers/glfw/lv_glfw_window.d ./Drivers/LVGL/src/drivers/glfw/lv_glfw_window.o ./Drivers/LVGL/src/drivers/glfw/lv_glfw_window.su ./Drivers/LVGL/src/drivers/glfw/lv_opengles_debug.cyclo ./Drivers/LVGL/src/drivers/glfw/lv_opengles_debug.d ./Drivers/LVGL/src/drivers/glfw/lv_opengles_debug.o ./Drivers/LVGL/src/drivers/glfw/lv_opengles_debug.su ./Drivers/LVGL/src/drivers/glfw/lv_opengles_driver.cyclo ./Drivers/LVGL/src/drivers/glfw/lv_opengles_driver.d ./Drivers/LVGL/src/drivers/glfw/lv_opengles_driver.o ./Drivers/LVGL/src/drivers/glfw/lv_opengles_driver.su ./Drivers/LVGL/src/drivers/glfw/lv_opengles_texture.cyclo ./Drivers/LVGL/src/drivers/glfw/lv_opengles_texture.d ./Drivers/LVGL/src/drivers/glfw/lv_opengles_texture.o ./Drivers/LVGL/src/drivers/glfw/lv_opengles_texture.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-drivers-2f-glfw


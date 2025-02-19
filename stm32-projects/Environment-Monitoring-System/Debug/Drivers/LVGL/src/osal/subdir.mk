################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/osal/lv_cmsis_rtos2.c \
../Drivers/LVGL/src/osal/lv_freertos.c \
../Drivers/LVGL/src/osal/lv_mqx.c \
../Drivers/LVGL/src/osal/lv_os.c \
../Drivers/LVGL/src/osal/lv_pthread.c \
../Drivers/LVGL/src/osal/lv_rtthread.c \
../Drivers/LVGL/src/osal/lv_sdl2.c \
../Drivers/LVGL/src/osal/lv_windows.c 

OBJS += \
./Drivers/LVGL/src/osal/lv_cmsis_rtos2.o \
./Drivers/LVGL/src/osal/lv_freertos.o \
./Drivers/LVGL/src/osal/lv_mqx.o \
./Drivers/LVGL/src/osal/lv_os.o \
./Drivers/LVGL/src/osal/lv_pthread.o \
./Drivers/LVGL/src/osal/lv_rtthread.o \
./Drivers/LVGL/src/osal/lv_sdl2.o \
./Drivers/LVGL/src/osal/lv_windows.o 

C_DEPS += \
./Drivers/LVGL/src/osal/lv_cmsis_rtos2.d \
./Drivers/LVGL/src/osal/lv_freertos.d \
./Drivers/LVGL/src/osal/lv_mqx.d \
./Drivers/LVGL/src/osal/lv_os.d \
./Drivers/LVGL/src/osal/lv_pthread.d \
./Drivers/LVGL/src/osal/lv_rtthread.d \
./Drivers/LVGL/src/osal/lv_sdl2.d \
./Drivers/LVGL/src/osal/lv_windows.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/osal/%.o Drivers/LVGL/src/osal/%.su Drivers/LVGL/src/osal/%.cyclo: ../Drivers/LVGL/src/osal/%.c Drivers/LVGL/src/osal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-osal

clean-Drivers-2f-LVGL-2f-src-2f-osal:
	-$(RM) ./Drivers/LVGL/src/osal/lv_cmsis_rtos2.cyclo ./Drivers/LVGL/src/osal/lv_cmsis_rtos2.d ./Drivers/LVGL/src/osal/lv_cmsis_rtos2.o ./Drivers/LVGL/src/osal/lv_cmsis_rtos2.su ./Drivers/LVGL/src/osal/lv_freertos.cyclo ./Drivers/LVGL/src/osal/lv_freertos.d ./Drivers/LVGL/src/osal/lv_freertos.o ./Drivers/LVGL/src/osal/lv_freertos.su ./Drivers/LVGL/src/osal/lv_mqx.cyclo ./Drivers/LVGL/src/osal/lv_mqx.d ./Drivers/LVGL/src/osal/lv_mqx.o ./Drivers/LVGL/src/osal/lv_mqx.su ./Drivers/LVGL/src/osal/lv_os.cyclo ./Drivers/LVGL/src/osal/lv_os.d ./Drivers/LVGL/src/osal/lv_os.o ./Drivers/LVGL/src/osal/lv_os.su ./Drivers/LVGL/src/osal/lv_pthread.cyclo ./Drivers/LVGL/src/osal/lv_pthread.d ./Drivers/LVGL/src/osal/lv_pthread.o ./Drivers/LVGL/src/osal/lv_pthread.su ./Drivers/LVGL/src/osal/lv_rtthread.cyclo ./Drivers/LVGL/src/osal/lv_rtthread.d ./Drivers/LVGL/src/osal/lv_rtthread.o ./Drivers/LVGL/src/osal/lv_rtthread.su ./Drivers/LVGL/src/osal/lv_sdl2.cyclo ./Drivers/LVGL/src/osal/lv_sdl2.d ./Drivers/LVGL/src/osal/lv_sdl2.o ./Drivers/LVGL/src/osal/lv_sdl2.su ./Drivers/LVGL/src/osal/lv_windows.cyclo ./Drivers/LVGL/src/osal/lv_windows.d ./Drivers/LVGL/src/osal/lv_windows.o ./Drivers/LVGL/src/osal/lv_windows.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-osal


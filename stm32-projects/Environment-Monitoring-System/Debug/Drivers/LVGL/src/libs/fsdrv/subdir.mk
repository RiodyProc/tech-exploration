################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_cbfs.c \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_fatfs.c \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_littlefs.c \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_memfs.c \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_posix.c \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_stdio.c \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_uefi.c \
../Drivers/LVGL/src/libs/fsdrv/lv_fs_win32.c 

OBJS += \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_cbfs.o \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_fatfs.o \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_littlefs.o \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_memfs.o \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_posix.o \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_stdio.o \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_uefi.o \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_win32.o 

C_DEPS += \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_cbfs.d \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_fatfs.d \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_littlefs.d \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_memfs.d \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_posix.d \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_stdio.d \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_uefi.d \
./Drivers/LVGL/src/libs/fsdrv/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/libs/fsdrv/%.o Drivers/LVGL/src/libs/fsdrv/%.su Drivers/LVGL/src/libs/fsdrv/%.cyclo: ../Drivers/LVGL/src/libs/fsdrv/%.c Drivers/LVGL/src/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-libs-2f-fsdrv

clean-Drivers-2f-LVGL-2f-src-2f-libs-2f-fsdrv:
	-$(RM) ./Drivers/LVGL/src/libs/fsdrv/lv_fs_cbfs.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_cbfs.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_cbfs.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_cbfs.su ./Drivers/LVGL/src/libs/fsdrv/lv_fs_fatfs.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_fatfs.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_fatfs.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_fatfs.su ./Drivers/LVGL/src/libs/fsdrv/lv_fs_littlefs.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_littlefs.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_littlefs.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_littlefs.su ./Drivers/LVGL/src/libs/fsdrv/lv_fs_memfs.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_memfs.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_memfs.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_memfs.su ./Drivers/LVGL/src/libs/fsdrv/lv_fs_posix.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_posix.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_posix.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_posix.su ./Drivers/LVGL/src/libs/fsdrv/lv_fs_stdio.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_stdio.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_stdio.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_stdio.su ./Drivers/LVGL/src/libs/fsdrv/lv_fs_uefi.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_uefi.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_uefi.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_uefi.su ./Drivers/LVGL/src/libs/fsdrv/lv_fs_win32.cyclo ./Drivers/LVGL/src/libs/fsdrv/lv_fs_win32.d ./Drivers/LVGL/src/libs/fsdrv/lv_fs_win32.o ./Drivers/LVGL/src/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-libs-2f-fsdrv


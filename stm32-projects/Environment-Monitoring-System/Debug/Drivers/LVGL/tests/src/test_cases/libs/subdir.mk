################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/tests/src/test_cases/libs/test_barcode.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_bin_decoder.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_bmp.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_font_stress.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_freetype.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_libjpeg_turbo.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_libpng.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_lodepng.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_memmove.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_qrcode.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_tiny_ttf.c \
../Drivers/LVGL/tests/src/test_cases/libs/test_tjpgd.c 

OBJS += \
./Drivers/LVGL/tests/src/test_cases/libs/test_barcode.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_bin_decoder.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_bmp.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_font_stress.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_freetype.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_libjpeg_turbo.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_libpng.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_lodepng.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_memmove.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_qrcode.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_tiny_ttf.o \
./Drivers/LVGL/tests/src/test_cases/libs/test_tjpgd.o 

C_DEPS += \
./Drivers/LVGL/tests/src/test_cases/libs/test_barcode.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_bin_decoder.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_bmp.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_font_stress.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_freetype.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_libjpeg_turbo.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_libpng.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_lodepng.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_memmove.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_qrcode.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_tiny_ttf.d \
./Drivers/LVGL/tests/src/test_cases/libs/test_tjpgd.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/tests/src/test_cases/libs/%.o Drivers/LVGL/tests/src/test_cases/libs/%.su Drivers/LVGL/tests/src/test_cases/libs/%.cyclo: ../Drivers/LVGL/tests/src/test_cases/libs/%.c Drivers/LVGL/tests/src/test_cases/libs/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-tests-2f-src-2f-test_cases-2f-libs

clean-Drivers-2f-LVGL-2f-tests-2f-src-2f-test_cases-2f-libs:
	-$(RM) ./Drivers/LVGL/tests/src/test_cases/libs/test_barcode.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_barcode.d ./Drivers/LVGL/tests/src/test_cases/libs/test_barcode.o ./Drivers/LVGL/tests/src/test_cases/libs/test_barcode.su ./Drivers/LVGL/tests/src/test_cases/libs/test_bin_decoder.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_bin_decoder.d ./Drivers/LVGL/tests/src/test_cases/libs/test_bin_decoder.o ./Drivers/LVGL/tests/src/test_cases/libs/test_bin_decoder.su ./Drivers/LVGL/tests/src/test_cases/libs/test_bmp.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_bmp.d ./Drivers/LVGL/tests/src/test_cases/libs/test_bmp.o ./Drivers/LVGL/tests/src/test_cases/libs/test_bmp.su ./Drivers/LVGL/tests/src/test_cases/libs/test_font_stress.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_font_stress.d ./Drivers/LVGL/tests/src/test_cases/libs/test_font_stress.o ./Drivers/LVGL/tests/src/test_cases/libs/test_font_stress.su ./Drivers/LVGL/tests/src/test_cases/libs/test_freetype.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_freetype.d ./Drivers/LVGL/tests/src/test_cases/libs/test_freetype.o ./Drivers/LVGL/tests/src/test_cases/libs/test_freetype.su ./Drivers/LVGL/tests/src/test_cases/libs/test_libjpeg_turbo.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_libjpeg_turbo.d ./Drivers/LVGL/tests/src/test_cases/libs/test_libjpeg_turbo.o ./Drivers/LVGL/tests/src/test_cases/libs/test_libjpeg_turbo.su ./Drivers/LVGL/tests/src/test_cases/libs/test_libpng.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_libpng.d ./Drivers/LVGL/tests/src/test_cases/libs/test_libpng.o ./Drivers/LVGL/tests/src/test_cases/libs/test_libpng.su ./Drivers/LVGL/tests/src/test_cases/libs/test_lodepng.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_lodepng.d ./Drivers/LVGL/tests/src/test_cases/libs/test_lodepng.o ./Drivers/LVGL/tests/src/test_cases/libs/test_lodepng.su ./Drivers/LVGL/tests/src/test_cases/libs/test_memmove.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_memmove.d ./Drivers/LVGL/tests/src/test_cases/libs/test_memmove.o ./Drivers/LVGL/tests/src/test_cases/libs/test_memmove.su ./Drivers/LVGL/tests/src/test_cases/libs/test_qrcode.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_qrcode.d ./Drivers/LVGL/tests/src/test_cases/libs/test_qrcode.o ./Drivers/LVGL/tests/src/test_cases/libs/test_qrcode.su ./Drivers/LVGL/tests/src/test_cases/libs/test_tiny_ttf.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_tiny_ttf.d ./Drivers/LVGL/tests/src/test_cases/libs/test_tiny_ttf.o ./Drivers/LVGL/tests/src/test_cases/libs/test_tiny_ttf.su ./Drivers/LVGL/tests/src/test_cases/libs/test_tjpgd.cyclo ./Drivers/LVGL/tests/src/test_cases/libs/test_tjpgd.d ./Drivers/LVGL/tests/src/test_cases/libs/test_tjpgd.o ./Drivers/LVGL/tests/src/test_cases/libs/test_tjpgd.su

.PHONY: clean-Drivers-2f-LVGL-2f-tests-2f-src-2f-test_cases-2f-libs


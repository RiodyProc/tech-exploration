################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/libs/freetype/lv_freetype.c \
../Drivers/lvgl/src/libs/freetype/lv_freetype_glyph.c \
../Drivers/lvgl/src/libs/freetype/lv_freetype_image.c \
../Drivers/lvgl/src/libs/freetype/lv_freetype_outline.c \
../Drivers/lvgl/src/libs/freetype/lv_ftsystem.c 

OBJS += \
./Drivers/lvgl/src/libs/freetype/lv_freetype.o \
./Drivers/lvgl/src/libs/freetype/lv_freetype_glyph.o \
./Drivers/lvgl/src/libs/freetype/lv_freetype_image.o \
./Drivers/lvgl/src/libs/freetype/lv_freetype_outline.o \
./Drivers/lvgl/src/libs/freetype/lv_ftsystem.o 

C_DEPS += \
./Drivers/lvgl/src/libs/freetype/lv_freetype.d \
./Drivers/lvgl/src/libs/freetype/lv_freetype_glyph.d \
./Drivers/lvgl/src/libs/freetype/lv_freetype_image.d \
./Drivers/lvgl/src/libs/freetype/lv_freetype_outline.d \
./Drivers/lvgl/src/libs/freetype/lv_ftsystem.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/libs/freetype/%.o Drivers/lvgl/src/libs/freetype/%.su Drivers/lvgl/src/libs/freetype/%.cyclo: ../Drivers/lvgl/src/libs/freetype/%.c Drivers/lvgl/src/libs/freetype/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-freetype

clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-freetype:
	-$(RM) ./Drivers/lvgl/src/libs/freetype/lv_freetype.cyclo ./Drivers/lvgl/src/libs/freetype/lv_freetype.d ./Drivers/lvgl/src/libs/freetype/lv_freetype.o ./Drivers/lvgl/src/libs/freetype/lv_freetype.su ./Drivers/lvgl/src/libs/freetype/lv_freetype_glyph.cyclo ./Drivers/lvgl/src/libs/freetype/lv_freetype_glyph.d ./Drivers/lvgl/src/libs/freetype/lv_freetype_glyph.o ./Drivers/lvgl/src/libs/freetype/lv_freetype_glyph.su ./Drivers/lvgl/src/libs/freetype/lv_freetype_image.cyclo ./Drivers/lvgl/src/libs/freetype/lv_freetype_image.d ./Drivers/lvgl/src/libs/freetype/lv_freetype_image.o ./Drivers/lvgl/src/libs/freetype/lv_freetype_image.su ./Drivers/lvgl/src/libs/freetype/lv_freetype_outline.cyclo ./Drivers/lvgl/src/libs/freetype/lv_freetype_outline.d ./Drivers/lvgl/src/libs/freetype/lv_freetype_outline.o ./Drivers/lvgl/src/libs/freetype/lv_freetype_outline.su ./Drivers/lvgl/src/libs/freetype/lv_ftsystem.cyclo ./Drivers/lvgl/src/libs/freetype/lv_ftsystem.d ./Drivers/lvgl/src/libs/freetype/lv_ftsystem.o ./Drivers/lvgl/src/libs/freetype/lv_ftsystem.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-libs-2f-freetype


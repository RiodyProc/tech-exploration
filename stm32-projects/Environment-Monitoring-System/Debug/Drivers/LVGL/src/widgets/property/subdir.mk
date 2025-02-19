################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/widgets/property/lv_animimage_properties.c \
../Drivers/LVGL/src/widgets/property/lv_dropdown_properties.c \
../Drivers/LVGL/src/widgets/property/lv_image_properties.c \
../Drivers/LVGL/src/widgets/property/lv_keyboard_properties.c \
../Drivers/LVGL/src/widgets/property/lv_label_properties.c \
../Drivers/LVGL/src/widgets/property/lv_obj_properties.c \
../Drivers/LVGL/src/widgets/property/lv_roller_properties.c \
../Drivers/LVGL/src/widgets/property/lv_slider_properties.c \
../Drivers/LVGL/src/widgets/property/lv_style_properties.c \
../Drivers/LVGL/src/widgets/property/lv_textarea_properties.c 

OBJS += \
./Drivers/LVGL/src/widgets/property/lv_animimage_properties.o \
./Drivers/LVGL/src/widgets/property/lv_dropdown_properties.o \
./Drivers/LVGL/src/widgets/property/lv_image_properties.o \
./Drivers/LVGL/src/widgets/property/lv_keyboard_properties.o \
./Drivers/LVGL/src/widgets/property/lv_label_properties.o \
./Drivers/LVGL/src/widgets/property/lv_obj_properties.o \
./Drivers/LVGL/src/widgets/property/lv_roller_properties.o \
./Drivers/LVGL/src/widgets/property/lv_slider_properties.o \
./Drivers/LVGL/src/widgets/property/lv_style_properties.o \
./Drivers/LVGL/src/widgets/property/lv_textarea_properties.o 

C_DEPS += \
./Drivers/LVGL/src/widgets/property/lv_animimage_properties.d \
./Drivers/LVGL/src/widgets/property/lv_dropdown_properties.d \
./Drivers/LVGL/src/widgets/property/lv_image_properties.d \
./Drivers/LVGL/src/widgets/property/lv_keyboard_properties.d \
./Drivers/LVGL/src/widgets/property/lv_label_properties.d \
./Drivers/LVGL/src/widgets/property/lv_obj_properties.d \
./Drivers/LVGL/src/widgets/property/lv_roller_properties.d \
./Drivers/LVGL/src/widgets/property/lv_slider_properties.d \
./Drivers/LVGL/src/widgets/property/lv_style_properties.d \
./Drivers/LVGL/src/widgets/property/lv_textarea_properties.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/widgets/property/%.o Drivers/LVGL/src/widgets/property/%.su Drivers/LVGL/src/widgets/property/%.cyclo: ../Drivers/LVGL/src/widgets/property/%.c Drivers/LVGL/src/widgets/property/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-widgets-2f-property

clean-Drivers-2f-LVGL-2f-src-2f-widgets-2f-property:
	-$(RM) ./Drivers/LVGL/src/widgets/property/lv_animimage_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_animimage_properties.d ./Drivers/LVGL/src/widgets/property/lv_animimage_properties.o ./Drivers/LVGL/src/widgets/property/lv_animimage_properties.su ./Drivers/LVGL/src/widgets/property/lv_dropdown_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_dropdown_properties.d ./Drivers/LVGL/src/widgets/property/lv_dropdown_properties.o ./Drivers/LVGL/src/widgets/property/lv_dropdown_properties.su ./Drivers/LVGL/src/widgets/property/lv_image_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_image_properties.d ./Drivers/LVGL/src/widgets/property/lv_image_properties.o ./Drivers/LVGL/src/widgets/property/lv_image_properties.su ./Drivers/LVGL/src/widgets/property/lv_keyboard_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_keyboard_properties.d ./Drivers/LVGL/src/widgets/property/lv_keyboard_properties.o ./Drivers/LVGL/src/widgets/property/lv_keyboard_properties.su ./Drivers/LVGL/src/widgets/property/lv_label_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_label_properties.d ./Drivers/LVGL/src/widgets/property/lv_label_properties.o ./Drivers/LVGL/src/widgets/property/lv_label_properties.su ./Drivers/LVGL/src/widgets/property/lv_obj_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_obj_properties.d ./Drivers/LVGL/src/widgets/property/lv_obj_properties.o ./Drivers/LVGL/src/widgets/property/lv_obj_properties.su ./Drivers/LVGL/src/widgets/property/lv_roller_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_roller_properties.d ./Drivers/LVGL/src/widgets/property/lv_roller_properties.o ./Drivers/LVGL/src/widgets/property/lv_roller_properties.su ./Drivers/LVGL/src/widgets/property/lv_slider_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_slider_properties.d ./Drivers/LVGL/src/widgets/property/lv_slider_properties.o ./Drivers/LVGL/src/widgets/property/lv_slider_properties.su ./Drivers/LVGL/src/widgets/property/lv_style_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_style_properties.d ./Drivers/LVGL/src/widgets/property/lv_style_properties.o ./Drivers/LVGL/src/widgets/property/lv_style_properties.su ./Drivers/LVGL/src/widgets/property/lv_textarea_properties.cyclo ./Drivers/LVGL/src/widgets/property/lv_textarea_properties.d ./Drivers/LVGL/src/widgets/property/lv_textarea_properties.o ./Drivers/LVGL/src/widgets/property/lv_textarea_properties.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-widgets-2f-property


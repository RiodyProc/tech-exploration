################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/others/xml/lv_xml.c \
../Drivers/LVGL/src/others/xml/lv_xml_base_types.c \
../Drivers/LVGL/src/others/xml/lv_xml_component.c \
../Drivers/LVGL/src/others/xml/lv_xml_parser.c \
../Drivers/LVGL/src/others/xml/lv_xml_style.c \
../Drivers/LVGL/src/others/xml/lv_xml_utils.c \
../Drivers/LVGL/src/others/xml/lv_xml_widget.c 

OBJS += \
./Drivers/LVGL/src/others/xml/lv_xml.o \
./Drivers/LVGL/src/others/xml/lv_xml_base_types.o \
./Drivers/LVGL/src/others/xml/lv_xml_component.o \
./Drivers/LVGL/src/others/xml/lv_xml_parser.o \
./Drivers/LVGL/src/others/xml/lv_xml_style.o \
./Drivers/LVGL/src/others/xml/lv_xml_utils.o \
./Drivers/LVGL/src/others/xml/lv_xml_widget.o 

C_DEPS += \
./Drivers/LVGL/src/others/xml/lv_xml.d \
./Drivers/LVGL/src/others/xml/lv_xml_base_types.d \
./Drivers/LVGL/src/others/xml/lv_xml_component.d \
./Drivers/LVGL/src/others/xml/lv_xml_parser.d \
./Drivers/LVGL/src/others/xml/lv_xml_style.d \
./Drivers/LVGL/src/others/xml/lv_xml_utils.d \
./Drivers/LVGL/src/others/xml/lv_xml_widget.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/others/xml/%.o Drivers/LVGL/src/others/xml/%.su Drivers/LVGL/src/others/xml/%.cyclo: ../Drivers/LVGL/src/others/xml/%.c Drivers/LVGL/src/others/xml/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-others-2f-xml

clean-Drivers-2f-LVGL-2f-src-2f-others-2f-xml:
	-$(RM) ./Drivers/LVGL/src/others/xml/lv_xml.cyclo ./Drivers/LVGL/src/others/xml/lv_xml.d ./Drivers/LVGL/src/others/xml/lv_xml.o ./Drivers/LVGL/src/others/xml/lv_xml.su ./Drivers/LVGL/src/others/xml/lv_xml_base_types.cyclo ./Drivers/LVGL/src/others/xml/lv_xml_base_types.d ./Drivers/LVGL/src/others/xml/lv_xml_base_types.o ./Drivers/LVGL/src/others/xml/lv_xml_base_types.su ./Drivers/LVGL/src/others/xml/lv_xml_component.cyclo ./Drivers/LVGL/src/others/xml/lv_xml_component.d ./Drivers/LVGL/src/others/xml/lv_xml_component.o ./Drivers/LVGL/src/others/xml/lv_xml_component.su ./Drivers/LVGL/src/others/xml/lv_xml_parser.cyclo ./Drivers/LVGL/src/others/xml/lv_xml_parser.d ./Drivers/LVGL/src/others/xml/lv_xml_parser.o ./Drivers/LVGL/src/others/xml/lv_xml_parser.su ./Drivers/LVGL/src/others/xml/lv_xml_style.cyclo ./Drivers/LVGL/src/others/xml/lv_xml_style.d ./Drivers/LVGL/src/others/xml/lv_xml_style.o ./Drivers/LVGL/src/others/xml/lv_xml_style.su ./Drivers/LVGL/src/others/xml/lv_xml_utils.cyclo ./Drivers/LVGL/src/others/xml/lv_xml_utils.d ./Drivers/LVGL/src/others/xml/lv_xml_utils.o ./Drivers/LVGL/src/others/xml/lv_xml_utils.su ./Drivers/LVGL/src/others/xml/lv_xml_widget.cyclo ./Drivers/LVGL/src/others/xml/lv_xml_widget.d ./Drivers/LVGL/src/others/xml/lv_xml_widget.o ./Drivers/LVGL/src/others/xml/lv_xml_widget.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-others-2f-xml


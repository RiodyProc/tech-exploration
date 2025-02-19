################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_button_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_chart_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_dropdown_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_image_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_label_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_obj_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_slider_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_table_parser.c \
../Drivers/LVGL/src/others/xml/parsers/lv_xml_tabview_parser.c 

OBJS += \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_button_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_chart_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_dropdown_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_image_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_label_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_obj_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_slider_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_table_parser.o \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_tabview_parser.o 

C_DEPS += \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_button_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_chart_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_dropdown_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_image_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_label_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_obj_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_slider_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_table_parser.d \
./Drivers/LVGL/src/others/xml/parsers/lv_xml_tabview_parser.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/others/xml/parsers/%.o Drivers/LVGL/src/others/xml/parsers/%.su Drivers/LVGL/src/others/xml/parsers/%.cyclo: ../Drivers/LVGL/src/others/xml/parsers/%.c Drivers/LVGL/src/others/xml/parsers/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-others-2f-xml-2f-parsers

clean-Drivers-2f-LVGL-2f-src-2f-others-2f-xml-2f-parsers:
	-$(RM) ./Drivers/LVGL/src/others/xml/parsers/lv_xml_button_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_button_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_button_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_button_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_chart_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_chart_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_chart_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_chart_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_dropdown_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_dropdown_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_dropdown_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_dropdown_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_image_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_image_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_image_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_image_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_label_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_label_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_label_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_label_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_obj_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_obj_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_obj_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_obj_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_slider_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_slider_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_slider_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_slider_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_table_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_table_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_table_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_table_parser.su ./Drivers/LVGL/src/others/xml/parsers/lv_xml_tabview_parser.cyclo ./Drivers/LVGL/src/others/xml/parsers/lv_xml_tabview_parser.d ./Drivers/LVGL/src/others/xml/parsers/lv_xml_tabview_parser.o ./Drivers/LVGL/src/others/xml/parsers/lv_xml_tabview_parser.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-others-2f-xml-2f-parsers


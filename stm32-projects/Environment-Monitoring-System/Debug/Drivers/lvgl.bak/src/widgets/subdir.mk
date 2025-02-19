################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl.bak/src/widgets/lv_arc.c \
../Drivers/lvgl.bak/src/widgets/lv_bar.c \
../Drivers/lvgl.bak/src/widgets/lv_btn.c \
../Drivers/lvgl.bak/src/widgets/lv_btnmatrix.c \
../Drivers/lvgl.bak/src/widgets/lv_canvas.c \
../Drivers/lvgl.bak/src/widgets/lv_checkbox.c \
../Drivers/lvgl.bak/src/widgets/lv_dropdown.c \
../Drivers/lvgl.bak/src/widgets/lv_img.c \
../Drivers/lvgl.bak/src/widgets/lv_label.c \
../Drivers/lvgl.bak/src/widgets/lv_line.c \
../Drivers/lvgl.bak/src/widgets/lv_objx_templ.c \
../Drivers/lvgl.bak/src/widgets/lv_roller.c \
../Drivers/lvgl.bak/src/widgets/lv_slider.c \
../Drivers/lvgl.bak/src/widgets/lv_switch.c \
../Drivers/lvgl.bak/src/widgets/lv_table.c \
../Drivers/lvgl.bak/src/widgets/lv_textarea.c 

OBJS += \
./Drivers/lvgl.bak/src/widgets/lv_arc.o \
./Drivers/lvgl.bak/src/widgets/lv_bar.o \
./Drivers/lvgl.bak/src/widgets/lv_btn.o \
./Drivers/lvgl.bak/src/widgets/lv_btnmatrix.o \
./Drivers/lvgl.bak/src/widgets/lv_canvas.o \
./Drivers/lvgl.bak/src/widgets/lv_checkbox.o \
./Drivers/lvgl.bak/src/widgets/lv_dropdown.o \
./Drivers/lvgl.bak/src/widgets/lv_img.o \
./Drivers/lvgl.bak/src/widgets/lv_label.o \
./Drivers/lvgl.bak/src/widgets/lv_line.o \
./Drivers/lvgl.bak/src/widgets/lv_objx_templ.o \
./Drivers/lvgl.bak/src/widgets/lv_roller.o \
./Drivers/lvgl.bak/src/widgets/lv_slider.o \
./Drivers/lvgl.bak/src/widgets/lv_switch.o \
./Drivers/lvgl.bak/src/widgets/lv_table.o \
./Drivers/lvgl.bak/src/widgets/lv_textarea.o 

C_DEPS += \
./Drivers/lvgl.bak/src/widgets/lv_arc.d \
./Drivers/lvgl.bak/src/widgets/lv_bar.d \
./Drivers/lvgl.bak/src/widgets/lv_btn.d \
./Drivers/lvgl.bak/src/widgets/lv_btnmatrix.d \
./Drivers/lvgl.bak/src/widgets/lv_canvas.d \
./Drivers/lvgl.bak/src/widgets/lv_checkbox.d \
./Drivers/lvgl.bak/src/widgets/lv_dropdown.d \
./Drivers/lvgl.bak/src/widgets/lv_img.d \
./Drivers/lvgl.bak/src/widgets/lv_label.d \
./Drivers/lvgl.bak/src/widgets/lv_line.d \
./Drivers/lvgl.bak/src/widgets/lv_objx_templ.d \
./Drivers/lvgl.bak/src/widgets/lv_roller.d \
./Drivers/lvgl.bak/src/widgets/lv_slider.d \
./Drivers/lvgl.bak/src/widgets/lv_switch.d \
./Drivers/lvgl.bak/src/widgets/lv_table.d \
./Drivers/lvgl.bak/src/widgets/lv_textarea.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl.bak/src/widgets/%.o Drivers/lvgl.bak/src/widgets/%.su Drivers/lvgl.bak/src/widgets/%.cyclo: ../Drivers/lvgl.bak/src/widgets/%.c Drivers/lvgl.bak/src/widgets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-widgets

clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-widgets:
	-$(RM) ./Drivers/lvgl.bak/src/widgets/lv_arc.cyclo ./Drivers/lvgl.bak/src/widgets/lv_arc.d ./Drivers/lvgl.bak/src/widgets/lv_arc.o ./Drivers/lvgl.bak/src/widgets/lv_arc.su ./Drivers/lvgl.bak/src/widgets/lv_bar.cyclo ./Drivers/lvgl.bak/src/widgets/lv_bar.d ./Drivers/lvgl.bak/src/widgets/lv_bar.o ./Drivers/lvgl.bak/src/widgets/lv_bar.su ./Drivers/lvgl.bak/src/widgets/lv_btn.cyclo ./Drivers/lvgl.bak/src/widgets/lv_btn.d ./Drivers/lvgl.bak/src/widgets/lv_btn.o ./Drivers/lvgl.bak/src/widgets/lv_btn.su ./Drivers/lvgl.bak/src/widgets/lv_btnmatrix.cyclo ./Drivers/lvgl.bak/src/widgets/lv_btnmatrix.d ./Drivers/lvgl.bak/src/widgets/lv_btnmatrix.o ./Drivers/lvgl.bak/src/widgets/lv_btnmatrix.su ./Drivers/lvgl.bak/src/widgets/lv_canvas.cyclo ./Drivers/lvgl.bak/src/widgets/lv_canvas.d ./Drivers/lvgl.bak/src/widgets/lv_canvas.o ./Drivers/lvgl.bak/src/widgets/lv_canvas.su ./Drivers/lvgl.bak/src/widgets/lv_checkbox.cyclo ./Drivers/lvgl.bak/src/widgets/lv_checkbox.d ./Drivers/lvgl.bak/src/widgets/lv_checkbox.o ./Drivers/lvgl.bak/src/widgets/lv_checkbox.su ./Drivers/lvgl.bak/src/widgets/lv_dropdown.cyclo ./Drivers/lvgl.bak/src/widgets/lv_dropdown.d ./Drivers/lvgl.bak/src/widgets/lv_dropdown.o ./Drivers/lvgl.bak/src/widgets/lv_dropdown.su ./Drivers/lvgl.bak/src/widgets/lv_img.cyclo ./Drivers/lvgl.bak/src/widgets/lv_img.d ./Drivers/lvgl.bak/src/widgets/lv_img.o ./Drivers/lvgl.bak/src/widgets/lv_img.su ./Drivers/lvgl.bak/src/widgets/lv_label.cyclo ./Drivers/lvgl.bak/src/widgets/lv_label.d ./Drivers/lvgl.bak/src/widgets/lv_label.o ./Drivers/lvgl.bak/src/widgets/lv_label.su ./Drivers/lvgl.bak/src/widgets/lv_line.cyclo ./Drivers/lvgl.bak/src/widgets/lv_line.d ./Drivers/lvgl.bak/src/widgets/lv_line.o ./Drivers/lvgl.bak/src/widgets/lv_line.su ./Drivers/lvgl.bak/src/widgets/lv_objx_templ.cyclo ./Drivers/lvgl.bak/src/widgets/lv_objx_templ.d ./Drivers/lvgl.bak/src/widgets/lv_objx_templ.o ./Drivers/lvgl.bak/src/widgets/lv_objx_templ.su ./Drivers/lvgl.bak/src/widgets/lv_roller.cyclo ./Drivers/lvgl.bak/src/widgets/lv_roller.d ./Drivers/lvgl.bak/src/widgets/lv_roller.o ./Drivers/lvgl.bak/src/widgets/lv_roller.su ./Drivers/lvgl.bak/src/widgets/lv_slider.cyclo ./Drivers/lvgl.bak/src/widgets/lv_slider.d ./Drivers/lvgl.bak/src/widgets/lv_slider.o ./Drivers/lvgl.bak/src/widgets/lv_slider.su ./Drivers/lvgl.bak/src/widgets/lv_switch.cyclo ./Drivers/lvgl.bak/src/widgets/lv_switch.d ./Drivers/lvgl.bak/src/widgets/lv_switch.o ./Drivers/lvgl.bak/src/widgets/lv_switch.su ./Drivers/lvgl.bak/src/widgets/lv_table.cyclo ./Drivers/lvgl.bak/src/widgets/lv_table.d ./Drivers/lvgl.bak/src/widgets/lv_table.o ./Drivers/lvgl.bak/src/widgets/lv_table.su ./Drivers/lvgl.bak/src/widgets/lv_textarea.cyclo ./Drivers/lvgl.bak/src/widgets/lv_textarea.d ./Drivers/lvgl.bak/src/widgets/lv_textarea.o ./Drivers/lvgl.bak/src/widgets/lv_textarea.su

.PHONY: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-widgets


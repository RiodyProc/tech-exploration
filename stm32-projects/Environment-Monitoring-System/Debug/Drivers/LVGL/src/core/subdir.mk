################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/core/lv_group.c \
../Drivers/LVGL/src/core/lv_obj.c \
../Drivers/LVGL/src/core/lv_obj_class.c \
../Drivers/LVGL/src/core/lv_obj_draw.c \
../Drivers/LVGL/src/core/lv_obj_event.c \
../Drivers/LVGL/src/core/lv_obj_id_builtin.c \
../Drivers/LVGL/src/core/lv_obj_pos.c \
../Drivers/LVGL/src/core/lv_obj_property.c \
../Drivers/LVGL/src/core/lv_obj_scroll.c \
../Drivers/LVGL/src/core/lv_obj_style.c \
../Drivers/LVGL/src/core/lv_obj_style_gen.c \
../Drivers/LVGL/src/core/lv_obj_tree.c \
../Drivers/LVGL/src/core/lv_refr.c 

OBJS += \
./Drivers/LVGL/src/core/lv_group.o \
./Drivers/LVGL/src/core/lv_obj.o \
./Drivers/LVGL/src/core/lv_obj_class.o \
./Drivers/LVGL/src/core/lv_obj_draw.o \
./Drivers/LVGL/src/core/lv_obj_event.o \
./Drivers/LVGL/src/core/lv_obj_id_builtin.o \
./Drivers/LVGL/src/core/lv_obj_pos.o \
./Drivers/LVGL/src/core/lv_obj_property.o \
./Drivers/LVGL/src/core/lv_obj_scroll.o \
./Drivers/LVGL/src/core/lv_obj_style.o \
./Drivers/LVGL/src/core/lv_obj_style_gen.o \
./Drivers/LVGL/src/core/lv_obj_tree.o \
./Drivers/LVGL/src/core/lv_refr.o 

C_DEPS += \
./Drivers/LVGL/src/core/lv_group.d \
./Drivers/LVGL/src/core/lv_obj.d \
./Drivers/LVGL/src/core/lv_obj_class.d \
./Drivers/LVGL/src/core/lv_obj_draw.d \
./Drivers/LVGL/src/core/lv_obj_event.d \
./Drivers/LVGL/src/core/lv_obj_id_builtin.d \
./Drivers/LVGL/src/core/lv_obj_pos.d \
./Drivers/LVGL/src/core/lv_obj_property.d \
./Drivers/LVGL/src/core/lv_obj_scroll.d \
./Drivers/LVGL/src/core/lv_obj_style.d \
./Drivers/LVGL/src/core/lv_obj_style_gen.d \
./Drivers/LVGL/src/core/lv_obj_tree.d \
./Drivers/LVGL/src/core/lv_refr.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/core/%.o Drivers/LVGL/src/core/%.su Drivers/LVGL/src/core/%.cyclo: ../Drivers/LVGL/src/core/%.c Drivers/LVGL/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-core

clean-Drivers-2f-LVGL-2f-src-2f-core:
	-$(RM) ./Drivers/LVGL/src/core/lv_group.cyclo ./Drivers/LVGL/src/core/lv_group.d ./Drivers/LVGL/src/core/lv_group.o ./Drivers/LVGL/src/core/lv_group.su ./Drivers/LVGL/src/core/lv_obj.cyclo ./Drivers/LVGL/src/core/lv_obj.d ./Drivers/LVGL/src/core/lv_obj.o ./Drivers/LVGL/src/core/lv_obj.su ./Drivers/LVGL/src/core/lv_obj_class.cyclo ./Drivers/LVGL/src/core/lv_obj_class.d ./Drivers/LVGL/src/core/lv_obj_class.o ./Drivers/LVGL/src/core/lv_obj_class.su ./Drivers/LVGL/src/core/lv_obj_draw.cyclo ./Drivers/LVGL/src/core/lv_obj_draw.d ./Drivers/LVGL/src/core/lv_obj_draw.o ./Drivers/LVGL/src/core/lv_obj_draw.su ./Drivers/LVGL/src/core/lv_obj_event.cyclo ./Drivers/LVGL/src/core/lv_obj_event.d ./Drivers/LVGL/src/core/lv_obj_event.o ./Drivers/LVGL/src/core/lv_obj_event.su ./Drivers/LVGL/src/core/lv_obj_id_builtin.cyclo ./Drivers/LVGL/src/core/lv_obj_id_builtin.d ./Drivers/LVGL/src/core/lv_obj_id_builtin.o ./Drivers/LVGL/src/core/lv_obj_id_builtin.su ./Drivers/LVGL/src/core/lv_obj_pos.cyclo ./Drivers/LVGL/src/core/lv_obj_pos.d ./Drivers/LVGL/src/core/lv_obj_pos.o ./Drivers/LVGL/src/core/lv_obj_pos.su ./Drivers/LVGL/src/core/lv_obj_property.cyclo ./Drivers/LVGL/src/core/lv_obj_property.d ./Drivers/LVGL/src/core/lv_obj_property.o ./Drivers/LVGL/src/core/lv_obj_property.su ./Drivers/LVGL/src/core/lv_obj_scroll.cyclo ./Drivers/LVGL/src/core/lv_obj_scroll.d ./Drivers/LVGL/src/core/lv_obj_scroll.o ./Drivers/LVGL/src/core/lv_obj_scroll.su ./Drivers/LVGL/src/core/lv_obj_style.cyclo ./Drivers/LVGL/src/core/lv_obj_style.d ./Drivers/LVGL/src/core/lv_obj_style.o ./Drivers/LVGL/src/core/lv_obj_style.su ./Drivers/LVGL/src/core/lv_obj_style_gen.cyclo ./Drivers/LVGL/src/core/lv_obj_style_gen.d ./Drivers/LVGL/src/core/lv_obj_style_gen.o ./Drivers/LVGL/src/core/lv_obj_style_gen.su ./Drivers/LVGL/src/core/lv_obj_tree.cyclo ./Drivers/LVGL/src/core/lv_obj_tree.d ./Drivers/LVGL/src/core/lv_obj_tree.o ./Drivers/LVGL/src/core/lv_obj_tree.su ./Drivers/LVGL/src/core/lv_refr.cyclo ./Drivers/LVGL/src/core/lv_refr.d ./Drivers/LVGL/src/core/lv_refr.o ./Drivers/LVGL/src/core/lv_refr.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-core


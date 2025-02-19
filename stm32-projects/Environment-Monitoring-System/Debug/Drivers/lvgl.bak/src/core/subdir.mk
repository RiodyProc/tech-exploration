################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl.bak/src/core/lv_disp.c \
../Drivers/lvgl.bak/src/core/lv_event.c \
../Drivers/lvgl.bak/src/core/lv_group.c \
../Drivers/lvgl.bak/src/core/lv_indev.c \
../Drivers/lvgl.bak/src/core/lv_indev_scroll.c \
../Drivers/lvgl.bak/src/core/lv_obj.c \
../Drivers/lvgl.bak/src/core/lv_obj_class.c \
../Drivers/lvgl.bak/src/core/lv_obj_draw.c \
../Drivers/lvgl.bak/src/core/lv_obj_pos.c \
../Drivers/lvgl.bak/src/core/lv_obj_scroll.c \
../Drivers/lvgl.bak/src/core/lv_obj_style.c \
../Drivers/lvgl.bak/src/core/lv_obj_style_gen.c \
../Drivers/lvgl.bak/src/core/lv_obj_tree.c \
../Drivers/lvgl.bak/src/core/lv_refr.c \
../Drivers/lvgl.bak/src/core/lv_theme.c 

OBJS += \
./Drivers/lvgl.bak/src/core/lv_disp.o \
./Drivers/lvgl.bak/src/core/lv_event.o \
./Drivers/lvgl.bak/src/core/lv_group.o \
./Drivers/lvgl.bak/src/core/lv_indev.o \
./Drivers/lvgl.bak/src/core/lv_indev_scroll.o \
./Drivers/lvgl.bak/src/core/lv_obj.o \
./Drivers/lvgl.bak/src/core/lv_obj_class.o \
./Drivers/lvgl.bak/src/core/lv_obj_draw.o \
./Drivers/lvgl.bak/src/core/lv_obj_pos.o \
./Drivers/lvgl.bak/src/core/lv_obj_scroll.o \
./Drivers/lvgl.bak/src/core/lv_obj_style.o \
./Drivers/lvgl.bak/src/core/lv_obj_style_gen.o \
./Drivers/lvgl.bak/src/core/lv_obj_tree.o \
./Drivers/lvgl.bak/src/core/lv_refr.o \
./Drivers/lvgl.bak/src/core/lv_theme.o 

C_DEPS += \
./Drivers/lvgl.bak/src/core/lv_disp.d \
./Drivers/lvgl.bak/src/core/lv_event.d \
./Drivers/lvgl.bak/src/core/lv_group.d \
./Drivers/lvgl.bak/src/core/lv_indev.d \
./Drivers/lvgl.bak/src/core/lv_indev_scroll.d \
./Drivers/lvgl.bak/src/core/lv_obj.d \
./Drivers/lvgl.bak/src/core/lv_obj_class.d \
./Drivers/lvgl.bak/src/core/lv_obj_draw.d \
./Drivers/lvgl.bak/src/core/lv_obj_pos.d \
./Drivers/lvgl.bak/src/core/lv_obj_scroll.d \
./Drivers/lvgl.bak/src/core/lv_obj_style.d \
./Drivers/lvgl.bak/src/core/lv_obj_style_gen.d \
./Drivers/lvgl.bak/src/core/lv_obj_tree.d \
./Drivers/lvgl.bak/src/core/lv_refr.d \
./Drivers/lvgl.bak/src/core/lv_theme.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl.bak/src/core/%.o Drivers/lvgl.bak/src/core/%.su Drivers/lvgl.bak/src/core/%.cyclo: ../Drivers/lvgl.bak/src/core/%.c Drivers/lvgl.bak/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-core

clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-core:
	-$(RM) ./Drivers/lvgl.bak/src/core/lv_disp.cyclo ./Drivers/lvgl.bak/src/core/lv_disp.d ./Drivers/lvgl.bak/src/core/lv_disp.o ./Drivers/lvgl.bak/src/core/lv_disp.su ./Drivers/lvgl.bak/src/core/lv_event.cyclo ./Drivers/lvgl.bak/src/core/lv_event.d ./Drivers/lvgl.bak/src/core/lv_event.o ./Drivers/lvgl.bak/src/core/lv_event.su ./Drivers/lvgl.bak/src/core/lv_group.cyclo ./Drivers/lvgl.bak/src/core/lv_group.d ./Drivers/lvgl.bak/src/core/lv_group.o ./Drivers/lvgl.bak/src/core/lv_group.su ./Drivers/lvgl.bak/src/core/lv_indev.cyclo ./Drivers/lvgl.bak/src/core/lv_indev.d ./Drivers/lvgl.bak/src/core/lv_indev.o ./Drivers/lvgl.bak/src/core/lv_indev.su ./Drivers/lvgl.bak/src/core/lv_indev_scroll.cyclo ./Drivers/lvgl.bak/src/core/lv_indev_scroll.d ./Drivers/lvgl.bak/src/core/lv_indev_scroll.o ./Drivers/lvgl.bak/src/core/lv_indev_scroll.su ./Drivers/lvgl.bak/src/core/lv_obj.cyclo ./Drivers/lvgl.bak/src/core/lv_obj.d ./Drivers/lvgl.bak/src/core/lv_obj.o ./Drivers/lvgl.bak/src/core/lv_obj.su ./Drivers/lvgl.bak/src/core/lv_obj_class.cyclo ./Drivers/lvgl.bak/src/core/lv_obj_class.d ./Drivers/lvgl.bak/src/core/lv_obj_class.o ./Drivers/lvgl.bak/src/core/lv_obj_class.su ./Drivers/lvgl.bak/src/core/lv_obj_draw.cyclo ./Drivers/lvgl.bak/src/core/lv_obj_draw.d ./Drivers/lvgl.bak/src/core/lv_obj_draw.o ./Drivers/lvgl.bak/src/core/lv_obj_draw.su ./Drivers/lvgl.bak/src/core/lv_obj_pos.cyclo ./Drivers/lvgl.bak/src/core/lv_obj_pos.d ./Drivers/lvgl.bak/src/core/lv_obj_pos.o ./Drivers/lvgl.bak/src/core/lv_obj_pos.su ./Drivers/lvgl.bak/src/core/lv_obj_scroll.cyclo ./Drivers/lvgl.bak/src/core/lv_obj_scroll.d ./Drivers/lvgl.bak/src/core/lv_obj_scroll.o ./Drivers/lvgl.bak/src/core/lv_obj_scroll.su ./Drivers/lvgl.bak/src/core/lv_obj_style.cyclo ./Drivers/lvgl.bak/src/core/lv_obj_style.d ./Drivers/lvgl.bak/src/core/lv_obj_style.o ./Drivers/lvgl.bak/src/core/lv_obj_style.su ./Drivers/lvgl.bak/src/core/lv_obj_style_gen.cyclo ./Drivers/lvgl.bak/src/core/lv_obj_style_gen.d ./Drivers/lvgl.bak/src/core/lv_obj_style_gen.o ./Drivers/lvgl.bak/src/core/lv_obj_style_gen.su ./Drivers/lvgl.bak/src/core/lv_obj_tree.cyclo ./Drivers/lvgl.bak/src/core/lv_obj_tree.d ./Drivers/lvgl.bak/src/core/lv_obj_tree.o ./Drivers/lvgl.bak/src/core/lv_obj_tree.su ./Drivers/lvgl.bak/src/core/lv_refr.cyclo ./Drivers/lvgl.bak/src/core/lv_refr.d ./Drivers/lvgl.bak/src/core/lv_refr.o ./Drivers/lvgl.bak/src/core/lv_refr.su ./Drivers/lvgl.bak/src/core/lv_theme.cyclo ./Drivers/lvgl.bak/src/core/lv_theme.d ./Drivers/lvgl.bak/src/core/lv_theme.o ./Drivers/lvgl.bak/src/core/lv_theme.su

.PHONY: clean-Drivers-2f-lvgl-2e-bak-2f-src-2f-core


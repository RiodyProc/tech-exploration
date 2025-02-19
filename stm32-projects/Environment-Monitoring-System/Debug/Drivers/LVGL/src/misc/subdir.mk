################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/src/misc/lv_anim.c \
../Drivers/LVGL/src/misc/lv_anim_timeline.c \
../Drivers/LVGL/src/misc/lv_area.c \
../Drivers/LVGL/src/misc/lv_array.c \
../Drivers/LVGL/src/misc/lv_async.c \
../Drivers/LVGL/src/misc/lv_bidi.c \
../Drivers/LVGL/src/misc/lv_circle_buf.c \
../Drivers/LVGL/src/misc/lv_color.c \
../Drivers/LVGL/src/misc/lv_color_op.c \
../Drivers/LVGL/src/misc/lv_event.c \
../Drivers/LVGL/src/misc/lv_fs.c \
../Drivers/LVGL/src/misc/lv_iter.c \
../Drivers/LVGL/src/misc/lv_ll.c \
../Drivers/LVGL/src/misc/lv_log.c \
../Drivers/LVGL/src/misc/lv_lru.c \
../Drivers/LVGL/src/misc/lv_math.c \
../Drivers/LVGL/src/misc/lv_matrix.c \
../Drivers/LVGL/src/misc/lv_palette.c \
../Drivers/LVGL/src/misc/lv_profiler_builtin.c \
../Drivers/LVGL/src/misc/lv_rb.c \
../Drivers/LVGL/src/misc/lv_style.c \
../Drivers/LVGL/src/misc/lv_style_gen.c \
../Drivers/LVGL/src/misc/lv_templ.c \
../Drivers/LVGL/src/misc/lv_text.c \
../Drivers/LVGL/src/misc/lv_text_ap.c \
../Drivers/LVGL/src/misc/lv_timer.c \
../Drivers/LVGL/src/misc/lv_tree.c \
../Drivers/LVGL/src/misc/lv_utils.c 

OBJS += \
./Drivers/LVGL/src/misc/lv_anim.o \
./Drivers/LVGL/src/misc/lv_anim_timeline.o \
./Drivers/LVGL/src/misc/lv_area.o \
./Drivers/LVGL/src/misc/lv_array.o \
./Drivers/LVGL/src/misc/lv_async.o \
./Drivers/LVGL/src/misc/lv_bidi.o \
./Drivers/LVGL/src/misc/lv_circle_buf.o \
./Drivers/LVGL/src/misc/lv_color.o \
./Drivers/LVGL/src/misc/lv_color_op.o \
./Drivers/LVGL/src/misc/lv_event.o \
./Drivers/LVGL/src/misc/lv_fs.o \
./Drivers/LVGL/src/misc/lv_iter.o \
./Drivers/LVGL/src/misc/lv_ll.o \
./Drivers/LVGL/src/misc/lv_log.o \
./Drivers/LVGL/src/misc/lv_lru.o \
./Drivers/LVGL/src/misc/lv_math.o \
./Drivers/LVGL/src/misc/lv_matrix.o \
./Drivers/LVGL/src/misc/lv_palette.o \
./Drivers/LVGL/src/misc/lv_profiler_builtin.o \
./Drivers/LVGL/src/misc/lv_rb.o \
./Drivers/LVGL/src/misc/lv_style.o \
./Drivers/LVGL/src/misc/lv_style_gen.o \
./Drivers/LVGL/src/misc/lv_templ.o \
./Drivers/LVGL/src/misc/lv_text.o \
./Drivers/LVGL/src/misc/lv_text_ap.o \
./Drivers/LVGL/src/misc/lv_timer.o \
./Drivers/LVGL/src/misc/lv_tree.o \
./Drivers/LVGL/src/misc/lv_utils.o 

C_DEPS += \
./Drivers/LVGL/src/misc/lv_anim.d \
./Drivers/LVGL/src/misc/lv_anim_timeline.d \
./Drivers/LVGL/src/misc/lv_area.d \
./Drivers/LVGL/src/misc/lv_array.d \
./Drivers/LVGL/src/misc/lv_async.d \
./Drivers/LVGL/src/misc/lv_bidi.d \
./Drivers/LVGL/src/misc/lv_circle_buf.d \
./Drivers/LVGL/src/misc/lv_color.d \
./Drivers/LVGL/src/misc/lv_color_op.d \
./Drivers/LVGL/src/misc/lv_event.d \
./Drivers/LVGL/src/misc/lv_fs.d \
./Drivers/LVGL/src/misc/lv_iter.d \
./Drivers/LVGL/src/misc/lv_ll.d \
./Drivers/LVGL/src/misc/lv_log.d \
./Drivers/LVGL/src/misc/lv_lru.d \
./Drivers/LVGL/src/misc/lv_math.d \
./Drivers/LVGL/src/misc/lv_matrix.d \
./Drivers/LVGL/src/misc/lv_palette.d \
./Drivers/LVGL/src/misc/lv_profiler_builtin.d \
./Drivers/LVGL/src/misc/lv_rb.d \
./Drivers/LVGL/src/misc/lv_style.d \
./Drivers/LVGL/src/misc/lv_style_gen.d \
./Drivers/LVGL/src/misc/lv_templ.d \
./Drivers/LVGL/src/misc/lv_text.d \
./Drivers/LVGL/src/misc/lv_text_ap.d \
./Drivers/LVGL/src/misc/lv_timer.d \
./Drivers/LVGL/src/misc/lv_tree.d \
./Drivers/LVGL/src/misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/misc/%.o Drivers/LVGL/src/misc/%.su Drivers/LVGL/src/misc/%.cyclo: ../Drivers/LVGL/src/misc/%.c Drivers/LVGL/src/misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-src-2f-misc

clean-Drivers-2f-LVGL-2f-src-2f-misc:
	-$(RM) ./Drivers/LVGL/src/misc/lv_anim.cyclo ./Drivers/LVGL/src/misc/lv_anim.d ./Drivers/LVGL/src/misc/lv_anim.o ./Drivers/LVGL/src/misc/lv_anim.su ./Drivers/LVGL/src/misc/lv_anim_timeline.cyclo ./Drivers/LVGL/src/misc/lv_anim_timeline.d ./Drivers/LVGL/src/misc/lv_anim_timeline.o ./Drivers/LVGL/src/misc/lv_anim_timeline.su ./Drivers/LVGL/src/misc/lv_area.cyclo ./Drivers/LVGL/src/misc/lv_area.d ./Drivers/LVGL/src/misc/lv_area.o ./Drivers/LVGL/src/misc/lv_area.su ./Drivers/LVGL/src/misc/lv_array.cyclo ./Drivers/LVGL/src/misc/lv_array.d ./Drivers/LVGL/src/misc/lv_array.o ./Drivers/LVGL/src/misc/lv_array.su ./Drivers/LVGL/src/misc/lv_async.cyclo ./Drivers/LVGL/src/misc/lv_async.d ./Drivers/LVGL/src/misc/lv_async.o ./Drivers/LVGL/src/misc/lv_async.su ./Drivers/LVGL/src/misc/lv_bidi.cyclo ./Drivers/LVGL/src/misc/lv_bidi.d ./Drivers/LVGL/src/misc/lv_bidi.o ./Drivers/LVGL/src/misc/lv_bidi.su ./Drivers/LVGL/src/misc/lv_circle_buf.cyclo ./Drivers/LVGL/src/misc/lv_circle_buf.d ./Drivers/LVGL/src/misc/lv_circle_buf.o ./Drivers/LVGL/src/misc/lv_circle_buf.su ./Drivers/LVGL/src/misc/lv_color.cyclo ./Drivers/LVGL/src/misc/lv_color.d ./Drivers/LVGL/src/misc/lv_color.o ./Drivers/LVGL/src/misc/lv_color.su ./Drivers/LVGL/src/misc/lv_color_op.cyclo ./Drivers/LVGL/src/misc/lv_color_op.d ./Drivers/LVGL/src/misc/lv_color_op.o ./Drivers/LVGL/src/misc/lv_color_op.su ./Drivers/LVGL/src/misc/lv_event.cyclo ./Drivers/LVGL/src/misc/lv_event.d ./Drivers/LVGL/src/misc/lv_event.o ./Drivers/LVGL/src/misc/lv_event.su ./Drivers/LVGL/src/misc/lv_fs.cyclo ./Drivers/LVGL/src/misc/lv_fs.d ./Drivers/LVGL/src/misc/lv_fs.o ./Drivers/LVGL/src/misc/lv_fs.su ./Drivers/LVGL/src/misc/lv_iter.cyclo ./Drivers/LVGL/src/misc/lv_iter.d ./Drivers/LVGL/src/misc/lv_iter.o ./Drivers/LVGL/src/misc/lv_iter.su ./Drivers/LVGL/src/misc/lv_ll.cyclo ./Drivers/LVGL/src/misc/lv_ll.d ./Drivers/LVGL/src/misc/lv_ll.o ./Drivers/LVGL/src/misc/lv_ll.su ./Drivers/LVGL/src/misc/lv_log.cyclo ./Drivers/LVGL/src/misc/lv_log.d ./Drivers/LVGL/src/misc/lv_log.o ./Drivers/LVGL/src/misc/lv_log.su ./Drivers/LVGL/src/misc/lv_lru.cyclo ./Drivers/LVGL/src/misc/lv_lru.d ./Drivers/LVGL/src/misc/lv_lru.o ./Drivers/LVGL/src/misc/lv_lru.su ./Drivers/LVGL/src/misc/lv_math.cyclo ./Drivers/LVGL/src/misc/lv_math.d ./Drivers/LVGL/src/misc/lv_math.o ./Drivers/LVGL/src/misc/lv_math.su ./Drivers/LVGL/src/misc/lv_matrix.cyclo ./Drivers/LVGL/src/misc/lv_matrix.d ./Drivers/LVGL/src/misc/lv_matrix.o ./Drivers/LVGL/src/misc/lv_matrix.su ./Drivers/LVGL/src/misc/lv_palette.cyclo ./Drivers/LVGL/src/misc/lv_palette.d ./Drivers/LVGL/src/misc/lv_palette.o ./Drivers/LVGL/src/misc/lv_palette.su ./Drivers/LVGL/src/misc/lv_profiler_builtin.cyclo ./Drivers/LVGL/src/misc/lv_profiler_builtin.d ./Drivers/LVGL/src/misc/lv_profiler_builtin.o ./Drivers/LVGL/src/misc/lv_profiler_builtin.su ./Drivers/LVGL/src/misc/lv_rb.cyclo ./Drivers/LVGL/src/misc/lv_rb.d ./Drivers/LVGL/src/misc/lv_rb.o ./Drivers/LVGL/src/misc/lv_rb.su ./Drivers/LVGL/src/misc/lv_style.cyclo ./Drivers/LVGL/src/misc/lv_style.d ./Drivers/LVGL/src/misc/lv_style.o ./Drivers/LVGL/src/misc/lv_style.su ./Drivers/LVGL/src/misc/lv_style_gen.cyclo ./Drivers/LVGL/src/misc/lv_style_gen.d ./Drivers/LVGL/src/misc/lv_style_gen.o ./Drivers/LVGL/src/misc/lv_style_gen.su ./Drivers/LVGL/src/misc/lv_templ.cyclo ./Drivers/LVGL/src/misc/lv_templ.d ./Drivers/LVGL/src/misc/lv_templ.o ./Drivers/LVGL/src/misc/lv_templ.su ./Drivers/LVGL/src/misc/lv_text.cyclo ./Drivers/LVGL/src/misc/lv_text.d ./Drivers/LVGL/src/misc/lv_text.o ./Drivers/LVGL/src/misc/lv_text.su ./Drivers/LVGL/src/misc/lv_text_ap.cyclo ./Drivers/LVGL/src/misc/lv_text_ap.d ./Drivers/LVGL/src/misc/lv_text_ap.o ./Drivers/LVGL/src/misc/lv_text_ap.su ./Drivers/LVGL/src/misc/lv_timer.cyclo ./Drivers/LVGL/src/misc/lv_timer.d ./Drivers/LVGL/src/misc/lv_timer.o ./Drivers/LVGL/src/misc/lv_timer.su ./Drivers/LVGL/src/misc/lv_tree.cyclo ./Drivers/LVGL/src/misc/lv_tree.d ./Drivers/LVGL/src/misc/lv_tree.o ./Drivers/LVGL/src/misc/lv_tree.su ./Drivers/LVGL/src/misc/lv_utils.cyclo ./Drivers/LVGL/src/misc/lv_utils.d ./Drivers/LVGL/src/misc/lv_utils.o ./Drivers/LVGL/src/misc/lv_utils.su

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-misc


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Drivers/LVGL/src/draw/sw/blend/neon/lv_blend_neon.S 

OBJS += \
./Drivers/LVGL/src/draw/sw/blend/neon/lv_blend_neon.o 

S_UPPER_DEPS += \
./Drivers/LVGL/src/draw/sw/blend/neon/lv_blend_neon.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/src/draw/sw/blend/neon/%.o: ../Drivers/LVGL/src/draw/sw/blend/neon/%.S Drivers/LVGL/src/draw/sw/blend/neon/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-sw-2f-blend-2f-neon

clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-sw-2f-blend-2f-neon:
	-$(RM) ./Drivers/LVGL/src/draw/sw/blend/neon/lv_blend_neon.d ./Drivers/LVGL/src/draw/sw/blend/neon/lv_blend_neon.o

.PHONY: clean-Drivers-2f-LVGL-2f-src-2f-draw-2f-sw-2f-blend-2f-neon


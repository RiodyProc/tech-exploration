################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/widgets/calendar/lv_calendar.c \
../Drivers/lvgl/src/widgets/calendar/lv_calendar_chinese.c \
../Drivers/lvgl/src/widgets/calendar/lv_calendar_header_arrow.c \
../Drivers/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.c 

OBJS += \
./Drivers/lvgl/src/widgets/calendar/lv_calendar.o \
./Drivers/lvgl/src/widgets/calendar/lv_calendar_chinese.o \
./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_arrow.o \
./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.o 

C_DEPS += \
./Drivers/lvgl/src/widgets/calendar/lv_calendar.d \
./Drivers/lvgl/src/widgets/calendar/lv_calendar_chinese.d \
./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_arrow.d \
./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/widgets/calendar/%.o Drivers/lvgl/src/widgets/calendar/%.su Drivers/lvgl/src/widgets/calendar/%.cyclo: ../Drivers/lvgl/src/widgets/calendar/%.c Drivers/lvgl/src/widgets/calendar/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-calendar

clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-calendar:
	-$(RM) ./Drivers/lvgl/src/widgets/calendar/lv_calendar.cyclo ./Drivers/lvgl/src/widgets/calendar/lv_calendar.d ./Drivers/lvgl/src/widgets/calendar/lv_calendar.o ./Drivers/lvgl/src/widgets/calendar/lv_calendar.su ./Drivers/lvgl/src/widgets/calendar/lv_calendar_chinese.cyclo ./Drivers/lvgl/src/widgets/calendar/lv_calendar_chinese.d ./Drivers/lvgl/src/widgets/calendar/lv_calendar_chinese.o ./Drivers/lvgl/src/widgets/calendar/lv_calendar_chinese.su ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_arrow.cyclo ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_arrow.d ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_arrow.o ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_arrow.su ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.cyclo ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.d ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.o ./Drivers/lvgl/src/widgets/calendar/lv_calendar_header_dropdown.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-widgets-2f-calendar


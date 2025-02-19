################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/UI/ui.c \
../Drivers/UI/ui_comp_hook.c \
../Drivers/UI/ui_dateAndtimeSCR.c \
../Drivers/UI/ui_events.c \
../Drivers/UI/ui_helpers.c \
../Drivers/UI/ui_humidSCR.c \
../Drivers/UI/ui_main.c \
../Drivers/UI/ui_pressSCR.c \
../Drivers/UI/ui_tempSCR.c \
../Drivers/UI/ui_theme_manager.c \
../Drivers/UI/ui_themes.c 

OBJS += \
./Drivers/UI/ui.o \
./Drivers/UI/ui_comp_hook.o \
./Drivers/UI/ui_dateAndtimeSCR.o \
./Drivers/UI/ui_events.o \
./Drivers/UI/ui_helpers.o \
./Drivers/UI/ui_humidSCR.o \
./Drivers/UI/ui_main.o \
./Drivers/UI/ui_pressSCR.o \
./Drivers/UI/ui_tempSCR.o \
./Drivers/UI/ui_theme_manager.o \
./Drivers/UI/ui_themes.o 

C_DEPS += \
./Drivers/UI/ui.d \
./Drivers/UI/ui_comp_hook.d \
./Drivers/UI/ui_dateAndtimeSCR.d \
./Drivers/UI/ui_events.d \
./Drivers/UI/ui_helpers.d \
./Drivers/UI/ui_humidSCR.d \
./Drivers/UI/ui_main.d \
./Drivers/UI/ui_pressSCR.d \
./Drivers/UI/ui_tempSCR.d \
./Drivers/UI/ui_theme_manager.d \
./Drivers/UI/ui_themes.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/UI/%.o Drivers/UI/%.su Drivers/UI/%.cyclo: ../Drivers/UI/%.c Drivers/UI/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Qxx" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/UI" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-UI

clean-Drivers-2f-UI:
	-$(RM) ./Drivers/UI/ui.cyclo ./Drivers/UI/ui.d ./Drivers/UI/ui.o ./Drivers/UI/ui.su ./Drivers/UI/ui_comp_hook.cyclo ./Drivers/UI/ui_comp_hook.d ./Drivers/UI/ui_comp_hook.o ./Drivers/UI/ui_comp_hook.su ./Drivers/UI/ui_dateAndtimeSCR.cyclo ./Drivers/UI/ui_dateAndtimeSCR.d ./Drivers/UI/ui_dateAndtimeSCR.o ./Drivers/UI/ui_dateAndtimeSCR.su ./Drivers/UI/ui_events.cyclo ./Drivers/UI/ui_events.d ./Drivers/UI/ui_events.o ./Drivers/UI/ui_events.su ./Drivers/UI/ui_helpers.cyclo ./Drivers/UI/ui_helpers.d ./Drivers/UI/ui_helpers.o ./Drivers/UI/ui_helpers.su ./Drivers/UI/ui_humidSCR.cyclo ./Drivers/UI/ui_humidSCR.d ./Drivers/UI/ui_humidSCR.o ./Drivers/UI/ui_humidSCR.su ./Drivers/UI/ui_main.cyclo ./Drivers/UI/ui_main.d ./Drivers/UI/ui_main.o ./Drivers/UI/ui_main.su ./Drivers/UI/ui_pressSCR.cyclo ./Drivers/UI/ui_pressSCR.d ./Drivers/UI/ui_pressSCR.o ./Drivers/UI/ui_pressSCR.su ./Drivers/UI/ui_tempSCR.cyclo ./Drivers/UI/ui_tempSCR.d ./Drivers/UI/ui_tempSCR.o ./Drivers/UI/ui_tempSCR.su ./Drivers/UI/ui_theme_manager.cyclo ./Drivers/UI/ui_theme_manager.d ./Drivers/UI/ui_theme_manager.o ./Drivers/UI/ui_theme_manager.su ./Drivers/UI/ui_themes.cyclo ./Drivers/UI/ui_themes.d ./Drivers/UI/ui_themes.o ./Drivers/UI/ui_themes.su

.PHONY: clean-Drivers-2f-UI


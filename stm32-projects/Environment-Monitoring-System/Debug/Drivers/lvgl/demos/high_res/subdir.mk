################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/demos/high_res/lv_demo_high_res.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_api_example.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_app_about.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_app_ev_charging.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_home.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_meter.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_app_thermostat.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_home.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_top_margin.c \
../Drivers/lvgl/demos/high_res/lv_demo_high_res_util.c 

OBJS += \
./Drivers/lvgl/demos/high_res/lv_demo_high_res.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_api_example.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_about.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_ev_charging.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_home.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_meter.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_thermostat.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_home.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_top_margin.o \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_util.o 

C_DEPS += \
./Drivers/lvgl/demos/high_res/lv_demo_high_res.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_api_example.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_about.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_ev_charging.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_home.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_meter.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_thermostat.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_home.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_top_margin.d \
./Drivers/lvgl/demos/high_res/lv_demo_high_res_util.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/demos/high_res/%.o Drivers/lvgl/demos/high_res/%.su Drivers/lvgl/demos/high_res/%.cyclo: ../Drivers/lvgl/demos/high_res/%.c Drivers/lvgl/demos/high_res/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-demos-2f-high_res

clean-Drivers-2f-lvgl-2f-demos-2f-high_res:
	-$(RM) ./Drivers/lvgl/demos/high_res/lv_demo_high_res.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_api_example.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_api_example.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_api_example.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_api_example.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_about.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_about.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_about.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_about.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_ev_charging.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_ev_charging.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_ev_charging.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_ev_charging.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_home.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_home.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_home.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_home.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_meter.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_meter.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_meter.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_smart_meter.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_thermostat.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_thermostat.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_thermostat.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_app_thermostat.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_home.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_home.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_home.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_home.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_top_margin.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_top_margin.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_top_margin.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_top_margin.su ./Drivers/lvgl/demos/high_res/lv_demo_high_res_util.cyclo ./Drivers/lvgl/demos/high_res/lv_demo_high_res_util.d ./Drivers/lvgl/demos/high_res/lv_demo_high_res_util.o ./Drivers/lvgl/demos/high_res/lv_demo_high_res_util.su

.PHONY: clean-Drivers-2f-lvgl-2f-demos-2f-high_res


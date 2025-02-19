################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/demos/high_res/lv_demo_high_res.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_api_example.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_app_about.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_app_ev_charging.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_home.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_meter.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_app_thermostat.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_home.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_top_margin.c \
../Drivers/LVGL/demos/high_res/lv_demo_high_res_util.c 

OBJS += \
./Drivers/LVGL/demos/high_res/lv_demo_high_res.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_api_example.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_about.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_ev_charging.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_home.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_meter.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_thermostat.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_home.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_top_margin.o \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_util.o 

C_DEPS += \
./Drivers/LVGL/demos/high_res/lv_demo_high_res.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_api_example.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_about.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_ev_charging.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_home.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_meter.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_thermostat.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_home.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_top_margin.d \
./Drivers/LVGL/demos/high_res/lv_demo_high_res_util.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/demos/high_res/%.o Drivers/LVGL/demos/high_res/%.su Drivers/LVGL/demos/high_res/%.cyclo: ../Drivers/LVGL/demos/high_res/%.c Drivers/LVGL/demos/high_res/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-demos-2f-high_res

clean-Drivers-2f-LVGL-2f-demos-2f-high_res:
	-$(RM) ./Drivers/LVGL/demos/high_res/lv_demo_high_res.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_api_example.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_api_example.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_api_example.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_api_example.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_about.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_about.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_about.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_about.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_ev_charging.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_ev_charging.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_ev_charging.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_ev_charging.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_home.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_home.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_home.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_home.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_meter.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_meter.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_meter.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_smart_meter.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_thermostat.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_thermostat.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_thermostat.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_app_thermostat.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_home.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_home.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_home.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_home.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_top_margin.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_top_margin.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_top_margin.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_top_margin.su ./Drivers/LVGL/demos/high_res/lv_demo_high_res_util.cyclo ./Drivers/LVGL/demos/high_res/lv_demo_high_res_util.d ./Drivers/LVGL/demos/high_res/lv_demo_high_res_util.o ./Drivers/LVGL/demos/high_res/lv_demo_high_res_util.su

.PHONY: clean-Drivers-2f-LVGL-2f-demos-2f-high_res


################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lvgl/src/misc/cache/lv_cache.c \
../Drivers/lvgl/src/misc/cache/lv_cache_entry.c \
../Drivers/lvgl/src/misc/cache/lv_cache_lru_rb.c \
../Drivers/lvgl/src/misc/cache/lv_image_cache.c \
../Drivers/lvgl/src/misc/cache/lv_image_header_cache.c 

OBJS += \
./Drivers/lvgl/src/misc/cache/lv_cache.o \
./Drivers/lvgl/src/misc/cache/lv_cache_entry.o \
./Drivers/lvgl/src/misc/cache/lv_cache_lru_rb.o \
./Drivers/lvgl/src/misc/cache/lv_image_cache.o \
./Drivers/lvgl/src/misc/cache/lv_image_header_cache.o 

C_DEPS += \
./Drivers/lvgl/src/misc/cache/lv_cache.d \
./Drivers/lvgl/src/misc/cache/lv_cache_entry.d \
./Drivers/lvgl/src/misc/cache/lv_cache_lru_rb.d \
./Drivers/lvgl/src/misc/cache/lv_image_cache.d \
./Drivers/lvgl/src/misc/cache/lv_image_header_cache.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lvgl/src/misc/cache/%.o Drivers/lvgl/src/misc/cache/%.su Drivers/lvgl/src/misc/cache/%.cyclo: ../Drivers/lvgl/src/misc/cache/%.c Drivers/lvgl/src/misc/cache/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/lvgl" -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache

clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache:
	-$(RM) ./Drivers/lvgl/src/misc/cache/lv_cache.cyclo ./Drivers/lvgl/src/misc/cache/lv_cache.d ./Drivers/lvgl/src/misc/cache/lv_cache.o ./Drivers/lvgl/src/misc/cache/lv_cache.su ./Drivers/lvgl/src/misc/cache/lv_cache_entry.cyclo ./Drivers/lvgl/src/misc/cache/lv_cache_entry.d ./Drivers/lvgl/src/misc/cache/lv_cache_entry.o ./Drivers/lvgl/src/misc/cache/lv_cache_entry.su ./Drivers/lvgl/src/misc/cache/lv_cache_lru_rb.cyclo ./Drivers/lvgl/src/misc/cache/lv_cache_lru_rb.d ./Drivers/lvgl/src/misc/cache/lv_cache_lru_rb.o ./Drivers/lvgl/src/misc/cache/lv_cache_lru_rb.su ./Drivers/lvgl/src/misc/cache/lv_image_cache.cyclo ./Drivers/lvgl/src/misc/cache/lv_image_cache.d ./Drivers/lvgl/src/misc/cache/lv_image_cache.o ./Drivers/lvgl/src/misc/cache/lv_image_cache.su ./Drivers/lvgl/src/misc/cache/lv_image_header_cache.cyclo ./Drivers/lvgl/src/misc/cache/lv_image_header_cache.d ./Drivers/lvgl/src/misc/cache/lv_image_header_cache.o ./Drivers/lvgl/src/misc/cache/lv_image_header_cache.su

.PHONY: clean-Drivers-2f-lvgl-2f-src-2f-misc-2f-cache


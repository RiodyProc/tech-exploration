################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_artist_palette.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_books.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_camera_with_flash.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_cat_face.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_deciduous_tree.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_dog_face.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_earth_globe_europe_africa.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_flexed_biceps.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_movie_camera.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_red_heart.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_rocket.c \
../Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_soccer_ball.c 

OBJS += \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_artist_palette.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_books.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_camera_with_flash.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_cat_face.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_deciduous_tree.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_dog_face.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_earth_globe_europe_africa.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_flexed_biceps.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_movie_camera.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_red_heart.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_rocket.o \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_soccer_ball.o 

C_DEPS += \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_artist_palette.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_books.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_camera_with_flash.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_cat_face.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_deciduous_tree.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_dog_face.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_earth_globe_europe_africa.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_flexed_biceps.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_movie_camera.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_red_heart.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_rocket.d \
./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_soccer_ball.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/LVGL/demos/multilang/assets/emojis/%.o Drivers/LVGL/demos/multilang/assets/emojis/%.su Drivers/LVGL/demos/multilang/assets/emojis/%.cyclo: ../Drivers/LVGL/demos/multilang/assets/emojis/%.c Drivers/LVGL/demos/multilang/assets/emojis/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32F411xE -DUSE_FULL_LL_DRIVER -DHSE_VALUE=25000000 -DHSE_STARTUP_TIMEOUT=100 -DLSE_STARTUP_TIMEOUT=5000 -DLSE_VALUE=32768 -DEXTERNAL_CLOCK_VALUE=12288000 -DHSI_VALUE=16000000 -DLSI_VALUE=32000 -DVDD_VALUE=3300 -DPREFETCH_ENABLE=1 -DINSTRUCTION_CACHE_ENABLE=1 -DDATA_CACHE_ENABLE=1 -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Display -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/XPT2046 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Core/Inc -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/BME280 -I/home/withovel/Documents/mbdd/stm32/workspaces/lab6/W25Q64 -I"/home/withovel/Documents/mbdd/stm32/workspaces/lab6/Drivers/LVGL" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-LVGL-2f-demos-2f-multilang-2f-assets-2f-emojis

clean-Drivers-2f-LVGL-2f-demos-2f-multilang-2f-assets-2f-emojis:
	-$(RM) ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_artist_palette.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_artist_palette.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_artist_palette.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_artist_palette.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_books.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_books.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_books.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_books.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_camera_with_flash.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_camera_with_flash.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_camera_with_flash.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_camera_with_flash.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_cat_face.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_cat_face.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_cat_face.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_cat_face.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_deciduous_tree.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_deciduous_tree.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_deciduous_tree.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_deciduous_tree.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_dog_face.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_dog_face.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_dog_face.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_dog_face.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_earth_globe_europe_africa.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_earth_globe_europe_africa.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_earth_globe_europe_africa.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_earth_globe_europe_africa.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_flexed_biceps.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_flexed_biceps.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_flexed_biceps.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_flexed_biceps.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_movie_camera.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_movie_camera.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_movie_camera.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_movie_camera.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_red_heart.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_red_heart.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_red_heart.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_red_heart.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_rocket.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_rocket.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_rocket.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_rocket.su ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_soccer_ball.cyclo ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_soccer_ball.d ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_soccer_ball.o ./Drivers/LVGL/demos/multilang/assets/emojis/img_emoji_soccer_ball.su

.PHONY: clean-Drivers-2f-LVGL-2f-demos-2f-multilang-2f-assets-2f-emojis


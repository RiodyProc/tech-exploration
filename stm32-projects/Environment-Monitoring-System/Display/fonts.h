#ifndef __FONT_H
#define __FONT_H

#include "main.h"

typedef struct {
    const uint8_t width;
    const uint8_t height;
    const uint8_t *data;
    const uint8_t firstcode;
    const uint8_t lastcode;
} FontDef;

typedef struct {
    const uint16_t width;
    const uint16_t height;
    const uint16_t *data;
} tImage;

extern tImage image_cover;

extern FontDef Font_8x13;
extern FontDef Font_15x25;
extern FontDef Font_12x20;
#endif

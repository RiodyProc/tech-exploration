#ifndef CALIBRATE_TOUCH_H_
#define CALIBRATE_TOUCH_H_

#include "main.h"
#include "display.h"
#include "xpt2046.h"

/* Touchscreen calibration on 5 points */
void XPT2046_CalibrateTouch(XPT2046_Handler *t, LCD_Handler *lcd);

/* Conversion of touchscreen coordinates to display coordinates */
void XPT2046_ConvertPoint(tPoint *p_display, volatile tPoint *p_touch, tCoef *coef);

#endif /* CALIBRATE_TOUCH_H_ */

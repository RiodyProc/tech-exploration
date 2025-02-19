#include "calibrate_touch.h"

/*
 * Calculation of coefficients for transforming touch screen coordinates into display coordinates
 */
static void CoefCalc(tPoint *p_d, tPoint *p_t, tCoef *coef, uint8_t all_points)
{
	uint64_t a = 0, b = 0, c = 0, d = 0, e = 0, X1 = 0, X2 = 0, X3 = 0, Y1 = 0, Y2 = 0, Y3 = 0;
	for(uint8_t i = 0; i < all_points; i++)	{
		a += p_t[i].x * p_t[i].x;
		b += p_t[i].y * p_t[i].y;
		c += p_t[i].x * p_t[i].y;
		d += p_t[i].x;
		e += p_t[i].y;
		X1 += p_t[i].x * p_d[i].x;
		X2 += p_t[i].y * p_d[i].x;
		X3 += p_d[i].x;
		Y1 += p_t[i].x * p_d[i].y;
		Y2 += p_t[i].y * p_d[i].y;
		Y3 += p_d[i].y;
	}
	coef->D = all_points * (a * b - c * c) + 2 * c *  d * e - a * e * e - b * d * d;
	coef->Dx1 = all_points * (X1 * b - X2 * c) + e * (X2 * d - X1 * e) + X3 * (c * e - b * d);
	coef->Dx2 = all_points * (X2 * a - X1 * c) + d * (X1 * e - X2 * d) + X3 * (c * d - a * e);
	coef->Dx3 = X3 * (a * b - c * c) + X1 * (c * e - b * d) + X2 * (c * d - a * e);
	coef->Dy1 = all_points * (Y1 * b - Y2 * c) + e * (Y2 * d - Y1 * e) + Y3 * (c * e - b * d);
	coef->Dy2 = all_points * (Y2 * a - Y1 * c) + d * (Y1 * e - Y2 * d) + Y3 * (c * d - a * e);
	coef->Dy3 = Y3 * (a * b - c * c) + Y1 * (c * e - b * d) + Y2 * (c * d -a * e);
}

/*
 * Transformation of touch screen coordinates to display/screen coordinates:
 * - the variable p_t (type tPoint) takes the touch screen coordinates;
 * - the variable coef (type tCoef) takes the transformation coefficients;
 * - the variable p_d (type tPoint) returns the display coordinates.
 */
void XPT2046_ConvertPoint(tPoint *p_d, volatile tPoint *p_t, tCoef *coef)
{
	p_d->x = (int)((p_t->x * coef->Dx1 + p_t->y * coef->Dx2 + coef->Dx3) / coef->D);
	p_d->y = (int)((p_t->x * coef->Dy1 + p_t->y * coef->Dy2 + coef->Dy3) / coef->D);
}

/* Waits for a touch on the screen (interrupt polling is enabled!) */
static void read_touch(XPT2046_Handler *t)
{
	while (1) { // Touchscreen polling loop.
		while (!t->click) { // Wait for a touch on the touchscreen.
			__NOP();
		}
		while (t->click) { // While there is a touch on the touchscreen.
			__NOP();
		}

		if (t->last_click_time > 3) { // Limit the minimum touch duration to filter random touches.
			break; // Break the polling loop.
		}
		__NOP();
	}
}

static void draw_calibrate_point(LCD_Handler *lcd, uint16_t x, uint16_t y, uint16_t r)
{
	LCD_DrawCircle(lcd, x, y, r, COLOR_BLACK);
	LCD_DrawLine(lcd, x, y - 5, x, y + 5, COLOR_RED);
	LCD_DrawLine(lcd, x - 5, y, x + 5, y, COLOR_RED);
}

/* Touch screen calibration */
void XPT2046_CalibrateTouch(XPT2046_Handler *t, LCD_Handler *lcd)
{
	// Table with display coordinates of 5 calibration points (4 - edges + 1 - center).
	uint16_t pos_xy[] = {10, 10, 10, lcd->Height - 10, lcd->Width - 10, 10, lcd->Width - 10, lcd->Height - 10, lcd->Width/2, lcd->Height/2};
	// Arrays to store calibration points data.
	tPoint p_display[5], p_touch[5];
	// Table with display coordinates to check after calibration.
	uint16_t ver_xy[] = {lcd->Width / 2, 20, lcd->Width / 2, lcd->Height - 20};
	uint8_t f_error, i;  // Calibration error flag and calibration point counter.
	t->fl_interrupt = 1; // Enable touchscreen coordinate updates in interrupt
	while (1) { // Keep calibrating until successful.
		i = 0;
		LCD_Fill(lcd, COLOR_WHITE); // Clear the display.
		// Display message prompting user to click on five points (on the edges and in the center of the display).
		LCD_WriteString(lcd, 0, 0, "Calibration. You will be prompted to click on 5 dots "\
				        "(on the edges and in the center of the display). Get ready.",
						&Font_8x13, COLOR_BLUE, COLOR_WHITE, LCD_SYMBOL_PRINT_FAST);
		LL_mDelay(4000); // Wait for 4 seconds.
		LCD_Fill(lcd, COLOR_WHITE); // Clear the display.
		while (i < 5) { // Loop through calibration points.
			// Draw a circle with a cross - calibration point.
			draw_calibrate_point(lcd, pos_xy[2 * i], pos_xy[2 * i + 1], 5);
			// Wait for touchscreen touch and release.
			read_touch(t);
			// Save display coordinates - center of the calibration circle.
			p_display[i].x = pos_xy[2 * i];
			p_display[i].y = pos_xy[2 * i + 1];
			// Save corresponding touchscreen coordinates.
			p_touch[i] = t->point;
			LCD_Fill(lcd, COLOR_WHITE); // Clear the display.
			LL_mDelay(300); // Wait for 1.3 seconds.
			i++; // Move to the next calibration point.
		}
		// Calculate coefficients for converting touch screen coordinates to display coordinates.
		CoefCalc(p_display, p_touch, &t->coef, 5);
		// Check calibration parameters.
		// Display message prompting user to click on two points (top and bottom of the display).
		LCD_WriteString(lcd, 0, 0, "Checking calibration parameters. You will be prompted to click on two dots "\
				        "(top and bottom of the display). Get ready.",
						&Font_8x13, COLOR_BLUE, COLOR_WHITE, LCD_SYMBOL_PRINT_FAST);
		LL_mDelay(1000); // Wait for 4 seconds.
		LCD_Fill(lcd, COLOR_WHITE); // Clear the display.
		f_error = i = 0; // Initialize error flag and calibration point checker
		while (i < 2) {
			// Draw a circle with a cross - calibration point.
			draw_calibrate_point(lcd, ver_xy[2 * i], ver_xy[2 * i + 1], 5);
			// Wait for touchscreen touch and release.
			read_touch(t);
			// Convert touch screen coordinates to display coordinates.
			XPT2046_ConvertPoint(&p_display[0], &t->point, &t->coef);
			// Check if the touch point is within the specified coordinate range.
			// If it is outside the range, set the calibration error flag.
			if (p_display[0].x < ver_xy[2 * i] - 10 || p_display[0].x > ver_xy[2 * i] + 10 ||
				p_display[0].y < ver_xy[2 * i + 1] - 10 || p_display[0].y > ver_xy[2 * i + 1] + 10) f_error = 1;
			
			LCD_Fill(lcd, COLOR_WHITE); // Clear the display.
			LL_mDelay(300); // Wait for 1.3 seconds.
			i++; // Move to the next point.
		}
		if (!f_error)  { // If no errors in calibration parameters, display success message and exit.
			LCD_WriteString(lcd, 0, 0, "Calibration OK!", &Font_8x13, COLOR_BLUE, COLOR_WHITE, LCD_SYMBOL_PRINT_FAST);
			LL_mDelay(1000); // Wait for 2 seconds.
			break;
		}
		// If there are errors in the calibration parameters, display error message and repeat calibration.
		LCD_WriteString(lcd, 0, 0, "Calibration Error!", &Font_8x13, COLOR_RED, COLOR_WHITE, LCD_SYMBOL_PRINT_FAST);
		LL_mDelay(1000); // Wait for 2 seconds.
	}
	LCD_Fill(lcd, COLOR_WHITE); // Clear the display.
}

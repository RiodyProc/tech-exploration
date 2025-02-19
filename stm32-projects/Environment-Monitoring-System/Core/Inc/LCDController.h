#ifndef _INC_LCDCONTROLLER_H_
#define _INC_LCDCONTROLLER_H_


/*********************
 *      INCLUDES
 *********************/
#include "../../Drivers/lvgl/lvgl.h"

/**********************
 * GLOBAL PROTOTYPES
 **********************/

/* Initialize low level display driver */
void lv_port_disp_init(void);

/* Enable updating the screen (the flushing process) when disp_flush() is called by LVGL
 */
void disp_enable_update(void);

/* Disable updating the screen (the flushing process) when disp_flush() is called by LVGL
 */
void disp_disable_update(void);

/**********************
 *      MACROS
 **********************/

#ifdef __cplusplus
} /*extern "C"*/
#endif


#endif// _INC_LCDCONTROLLER_H



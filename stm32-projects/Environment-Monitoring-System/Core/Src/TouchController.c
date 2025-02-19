/*********************
 *      INCLUDES
 *********************/
#include "TouchController.h"
#include "../../Drivers/lvgl/lvgl.h"
#include "ili9341.h"
#include "xpt2046.h"
#include "main.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

static void touchpad_init(void);
static void touchpad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data);
static bool touchpad_is_pressed(void);
static void touchpad_get_xy(lv_coord_t * x, lv_coord_t * y);

/**********************
 *  STATIC VARIABLES
 **********************/

lv_indev_t * indev_touchpad;

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void lv_port_indev_init(void)
{

    static lv_indev_drv_t indev_drv;

    /*------------------
     * Touchpad
     * -----------------*/

    /*Initialize your touchpad if you have*/
    touchpad_init();

    /*Register a touchpad input device*/
    lv_indev_drv_init(&indev_drv);
    indev_drv.type = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = touchpad_read;
    indev_touchpad = lv_indev_drv_register(&indev_drv);

}

/**********************
 *   STATIC FUNCTIONS
 **********************/

/*------------------
 * Touchpad
 * -----------------*/

/*Initialize your touchpad*/
static void touchpad_init(void)
{
  XPT2046_ConnectionData cnt_touch = { 
    .spi     = SPI3,            // The SPI used
    .speed   = 5,               // SPI speed 0...7 (0 - clk/2, 1 - clk/4, ..., 7 - clk/256)
    .cs_port = T_CS_GPIO_Port,  // Port for controlling T_CS
    .cs_pin  = T_CS_Pin,        // Pin for controlling T_CS
    .irq_port = T_IRQ_GPIO_Port,// Port for controlling T_IRQ
    .irq_pin  = T_IRQ_Pin,      // Pin for controlling T_IRQ
    .exti_irq = T_IRQ_EXTI_IRQn // External interrupt channel
  };
  XPT2046_InitTouch(&touch1, 20, &cnt_touch);
}

/*Will be called by the library to read the touchpad*/
static void touchpad_read(lv_indev_drv_t * indev_drv, lv_indev_data_t * data)
{
    static lv_coord_t last_x = 0;
    static lv_coord_t last_y = 0;

    /*Save the pressed coordinates and the state*/
    if(touchpad_is_pressed()) {
        touchpad_get_xy(&last_x, &last_y);
        data->state = LV_INDEV_STATE_PR;
    }
    else {
        data->state = LV_INDEV_STATE_REL;
    }

    /*Set the last pressed coordinates*/
    data->point.x = last_x;
    data->point.y = last_y;
}

/*Return true is the touchpad is pressed*/
static bool touchpad_is_pressed(void)
{
	XPT2046_GetTouch(&touch1);
  	touch1.fl_interrupt = 0; //Prohibit polling the touchscreen in interrupts
    if (touch1.status == XPT2046_STATUS_CLICK || touch1.status == XPT2046_STATUS_HOLD) {
		return true;
    }
    return false;
}

/*Get the x and y coordinates if the touchpad is pressed*/
static void touchpad_get_xy(lv_coord_t * x, lv_coord_t * y)
{
    tPoint p_display;
    XPT2046_ConvertPoint(&p_display, &touch1.point, &touch1.coef);
  
    *x = p_display.x;
    *y = p_display.y;
}


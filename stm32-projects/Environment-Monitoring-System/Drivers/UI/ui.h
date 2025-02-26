// This file was generated by SquareLine Studio
// SquareLine Studio version: SquareLine Studio 1.5.0
// LVGL version: 8.3.11
// Project name: SquareLine_Project

#ifndef _SQUARELINE_PROJECT_UI_H
#define _SQUARELINE_PROJECT_UI_H

#ifdef __cplusplus
extern "C" {
#endif

#include "../lvgl/lvgl.h"

#include "ui_helpers.h"
#include "ui_events.h"
#include "ui_theme_manager.h"
#include "ui_themes.h"

// SCREEN: ui_main
void ui_main_screen_init(void);
void ui_event_main(lv_event_t * e);
extern lv_obj_t * ui_main;
extern lv_obj_t * ui_separator;
extern lv_obj_t * ui_tempMain;
extern lv_obj_t * ui_rhMain;
extern lv_obj_t * ui_pMain;
extern lv_obj_t * ui_pageCNT0;
extern lv_obj_t * ui_labeltimeformat;
void ui_event_tfChangeBTN(lv_event_t * e);
extern lv_obj_t * ui_tfChangeBTN;
extern lv_obj_t * ui_popuptimeformat;
void ui_event_amFormat(lv_event_t * e);
extern lv_obj_t * ui_amFormat;
extern lv_obj_t * ui_AMlabel;
void ui_event_pmFormat(lv_event_t * e);
extern lv_obj_t * ui_pmFormat;
extern lv_obj_t * ui_PMlabel;
void ui_event_timeButton(lv_event_t * e);
extern lv_obj_t * ui_timeButton;
extern lv_obj_t * ui_lableTime;
extern lv_obj_t * ui_lableDate;
void ui_event_dateButton(lv_event_t * e);
extern lv_obj_t * ui_dateButton;
// CUSTOM VARIABLES

// SCREEN: ui_tempSCR
void ui_tempSCR_screen_init(void);
void ui_event_tempSCR(lv_event_t * e);
extern lv_obj_t * ui_tempSCR;
extern lv_obj_t * ui_tempCH;
extern lv_obj_t * ui_pageCNT1;
extern lv_obj_t * ui_valTempSCR1;
extern lv_obj_t * ui_Label5;
extern lv_obj_t * ui_tempStaticCH;
extern lv_obj_t * ui_TempStaticPeriod;
void ui_event_tempArchive(lv_event_t * e);
extern lv_obj_t * ui_tempArchive;
extern lv_obj_t * ui_Label20;
extern uint8_t tempArch_flag;
extern lv_chart_series_t * ui_tempStaticCH_series_1;
// CUSTOM VARIABLES

// SCREEN: ui_humidSCR
void ui_humidSCR_screen_init(void);
void ui_event_humidSCR(lv_event_t * e);
extern lv_obj_t * ui_humidSCR;
extern lv_obj_t * ui_humidCH;
extern lv_obj_t * ui_pageCNT2;
extern lv_obj_t * ui_valHumidSCR2;
extern lv_obj_t * ui_Label6;
extern lv_obj_t * ui_humidStaticCH;
extern lv_obj_t * ui_HumidStaticPeriod;
void ui_event_humidArchive(lv_event_t * e);
extern lv_obj_t * ui_humidArchive;
extern lv_obj_t * ui_Label22;
extern uint8_t humidArch_flag;
extern lv_chart_series_t * ui_humidStaticCH_series_1;
// CUSTOM VARIABLES

// SCREEN: ui_pressSCR
void ui_pressSCR_screen_init(void);
void ui_event_pressSCR(lv_event_t * e);
extern lv_obj_t * ui_pressSCR;
extern lv_obj_t * ui_pressCH;
extern lv_obj_t * ui_pageCNT3;
extern lv_obj_t * ui_valPressSCR3;
extern lv_obj_t * ui_Label2;
extern lv_obj_t * ui_pressStaticCH;
extern lv_obj_t * ui_PressStaticPeriod;
void ui_event_pressArchive(lv_event_t * e);
extern lv_obj_t * ui_pressArchive;
extern lv_obj_t * ui_Label21;
extern uint8_t pressArch_flag;
extern lv_chart_series_t * ui_pressStaticCH_series_1;
// CUSTOM VARIABLES

// SCREEN: ui_dateAndtimeSCR
void ui_dateAndtimeSCR_screen_init(void);
extern lv_obj_t * ui_dateAndtimeSCR;
void ui_event_timeOK(lv_event_t * e);
extern lv_obj_t * ui_timeOK;
extern lv_obj_t * ui_textOKh;
void ui_event_dateOK(lv_event_t * e);
extern lv_obj_t * ui_dateOK;
extern lv_obj_t * ui_textOKh1;
void ui_event_timeAndDateCANCEL(lv_event_t * e);
extern lv_obj_t * ui_timeAndDateCANCEL;
extern lv_obj_t * ui_textCancel;
extern lv_obj_t * ui_lableTimeChange;
extern lv_obj_t * ui_lableDateChange;
extern lv_obj_t * ui_ContainerTime;
void ui_event_hourUP(lv_event_t * e);
extern lv_obj_t * ui_hourUP;
extern lv_obj_t * ui_Label7;
void ui_event_hourDOWN(lv_event_t * e);
extern lv_obj_t * ui_hourDOWN;
extern lv_obj_t * ui_Label1;
void ui_event_minuteUP(lv_event_t * e);
extern lv_obj_t * ui_minuteUP;
extern lv_obj_t * ui_Label4;
void ui_event_minuteDOWN(lv_event_t * e);
extern lv_obj_t * ui_minuteDOWN;
extern lv_obj_t * ui_Label3;
void ui_event_secondUP(lv_event_t * e);
extern lv_obj_t * ui_secondUP;
extern lv_obj_t * ui_Label8;
void ui_event_secondDOWN(lv_event_t * e);
extern lv_obj_t * ui_secondDOWN;
extern lv_obj_t * ui_Label9;
void ui_event_btnsavetime(lv_event_t * e);
extern lv_obj_t * ui_btnsavetime;
extern lv_obj_t * ui_Label10;
void ui_event_btncancelChoose(lv_event_t * e);
extern lv_obj_t * ui_btncancelChoose;
extern lv_obj_t * ui_Label11;
extern lv_obj_t * ui_spinboxSeconds;
extern lv_obj_t * ui_spinboxMinutes;
extern lv_obj_t * ui_spinboxHours;
extern lv_obj_t * ui_ContainerDate;
void ui_event_hourUP1(lv_event_t * e);
extern lv_obj_t * ui_hourUP1;
extern lv_obj_t * ui_Label12;
void ui_event_hourDOWN1(lv_event_t * e);
extern lv_obj_t * ui_hourDOWN1;
extern lv_obj_t * ui_Label13;
void ui_event_minuteUP1(lv_event_t * e);
extern lv_obj_t * ui_minuteUP1;
extern lv_obj_t * ui_Label14;
void ui_event_minuteDOWN1(lv_event_t * e);
extern lv_obj_t * ui_minuteDOWN1;
extern lv_obj_t * ui_Label15;
void ui_event_secondUP1(lv_event_t * e);
extern lv_obj_t * ui_secondUP1;
extern lv_obj_t * ui_Label16;
void ui_event_secondDOWN1(lv_event_t * e);
extern lv_obj_t * ui_secondDOWN1;
extern lv_obj_t * ui_Label17;
void ui_event_btnsavedate(lv_event_t * e);
extern lv_obj_t * ui_btnsavedate;
extern lv_obj_t * ui_Label18;
void ui_event_btncancelChoose1(lv_event_t * e);
extern lv_obj_t * ui_btncancelChoose1;
extern lv_obj_t * ui_Label19;
extern lv_obj_t * ui_spinboxYear;
extern lv_obj_t * ui_spinboxMonth;
extern lv_obj_t * ui_spinboxDay;
extern lv_obj_t * ui_ContainerTimeStatic;
void ui_event_hourUP8(lv_event_t * e);
extern lv_obj_t * ui_hourUP8;
extern lv_obj_t * ui_Label76;
void ui_event_hourDOWN8(lv_event_t * e);
extern lv_obj_t * ui_hourDOWN8;
extern lv_obj_t * ui_Label77;
void ui_event_minuteUP8(lv_event_t * e);
extern lv_obj_t * ui_minuteUP8;
extern lv_obj_t * ui_Label69;
void ui_event_minuteDOWN8(lv_event_t * e);
extern lv_obj_t * ui_minuteDOWN8;
extern lv_obj_t * ui_Label70;
void ui_event_secondUP8(lv_event_t * e);
extern lv_obj_t * ui_secondUP8;
extern lv_obj_t * ui_Label71;
void ui_event_secondDOWN8(lv_event_t * e);
extern lv_obj_t * ui_secondDOWN8;
extern lv_obj_t * ui_Label72;
void ui_event_btnsavetime4(lv_event_t * e);
extern lv_obj_t * ui_btnsavetime4;
extern lv_obj_t * ui_Label73;
void ui_event_btncancelChoose8(lv_event_t * e);
extern lv_obj_t * ui_btncancelChoose8;
extern lv_obj_t * ui_Label74;
extern lv_obj_t * ui_startSecond;
extern lv_obj_t * ui_startMinute;
extern lv_obj_t * ui_startHour;
extern lv_obj_t * ui_Label68;
extern lv_obj_t * ui_lableTimeChange1;
extern lv_obj_t * ui_ContainerDateStatic;
void ui_event_hourUP9(lv_event_t * e);
extern lv_obj_t * ui_hourUP9;
extern lv_obj_t * ui_Label75;
void ui_event_hourDOWN9(lv_event_t * e);
extern lv_obj_t * ui_hourDOWN9;
extern lv_obj_t * ui_Label78;
void ui_event_minuteUP9(lv_event_t * e);
extern lv_obj_t * ui_minuteUP9;
extern lv_obj_t * ui_Label79;
void ui_event_minuteDOWN9(lv_event_t * e);
extern lv_obj_t * ui_minuteDOWN9;
extern lv_obj_t * ui_Label80;
void ui_event_secondUP9(lv_event_t * e);
extern lv_obj_t * ui_secondUP9;
extern lv_obj_t * ui_Label81;
void ui_event_secondDOWN9(lv_event_t * e);
extern lv_obj_t * ui_secondDOWN9;
extern lv_obj_t * ui_Label82;
void ui_event_btnsavedateStatic(lv_event_t * e);
extern lv_obj_t * ui_btnsavedateStatic;
extern lv_obj_t * ui_Label83;
void ui_event_btncancelChooseStatic(lv_event_t * e);
extern lv_obj_t * ui_btncancelChooseStatic;
extern lv_obj_t * ui_Label84;
extern lv_obj_t * ui_startYear;
extern lv_obj_t * ui_startMonth;
extern lv_obj_t * ui_startDay;
extern lv_obj_t * ui_Label85;
extern lv_obj_t * ui_lableDateChange4;
// CUSTOM VARIABLES

// EVENTS
extern lv_obj_t * ui____initial_actions0;

// UI INIT
void ui_init(void);

#ifdef __cplusplus
} /*extern "C"*/
#endif

#endif

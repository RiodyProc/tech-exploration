SET(SOURCES ui_main.c
    ui_tempSCR.c
    ui_humidSCR.c
    ui_pressSCR.c
    ui_dateAndtimeSCR.c
    ui_tempSCRstatic.c
    ui_humidSCRstatic.c
    ui_pressSCRstatic.c
    ui_theme_manager.c
    ui_themes.c
    ui.c
    ui_comp_hook.c
    ui_helpers.c
    ui_events.c
    ui_img_new_png.c)

add_library(ui ${SOURCES})

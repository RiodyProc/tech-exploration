#ifndef INC_ILI9341_H_
#define INC_ILI9341_H_

#include "main.h"

#define ILI9341_CONTROLLER_WIDTH    240
#define ILI9341_CONTROLLER_HEIGHT   320

// ILI9341 controller commands
#define ILI9341_NOP                    0x00
#define ILI9341_SOFTRESET              0x01
#define ILI9341_READID                 0x04
#define ILI9341_READSTATUS             0x09
#define ILI9341_READPOWERMODE          0x0A
#define ILI9341_READMADCTL             0x0B
#define ILI9341_READPIXELFORMAT        0x0C
#define ILI9341_READIMAGEFORMAT        0x0D
#define ILI9341_READSIGNALMODE         0x0E
#define ILI9341_READSELFDIAGNOSTIC     0x0F
#define ILI9341_SLEEPIN                0x10
#define ILI9341_SLEEPOUT               0x11
#define ILI9341_PARTIALMODE            0x12
#define ILI9341_NORMALDISP             0x13
#define ILI9341_INVERTOFF              0x20
#define ILI9341_INVERTON               0x21
#define ILI9341_GAMMASET               0x26
#define ILI9341_DISPLAYOFF             0x28
#define ILI9341_DISPLAYON              0x29
#define ILI9341_COLADDRSET             0x2A
#define ILI9341_PAGEADDRSET            0x2B
#define ILI9341_MEMORYWRITE            0x2C
#define ILI9341_COLORSET               0x2D
#define ILI9341_MEMORYREAD             0x2E
#define ILI9341_PARTIALAREA            0x30
#define ILI9341_VERTICALSCROLING       0x33
#define ILI9341_TEARINGEFFECTOFF       0x34
#define ILI9341_TEARINGEFFECTON        0x35
#define ILI9341_MEMCONTROL             0x36
#define ILI9341_VSCROLLSTARTADDRESS    0x37
#define ILI9341_IDLEMODEOFF            0x38
#define ILI9341_IDLEMODEON             0x39
#define ILI9341_PIXELFORMAT            0x3A
#define ILI9341_WRITEMEMCONTINUE       0x3C
#define ILI9341_READMEMCONTINUE        0x3E
#define ILI9341_SETSCANLINE            0x44
#define ILI9341_GETSCANLINE            0x45
#define ILI9341_WRITEBRIGHTNESS        0x51
#define ILI9341_READBRIGHTNESS         0x52
#define ILI9341_WRITECTRL              0x53
#define ILI9341_READCTRL               0x54
#define ILI9341_WRITECABC              0x55
#define ILI9341_READCABC               0x56
#define ILI9341_WRITECABCMIN           0x5E
#define ILI9341_READCABCMIN            0x5F
#define ILI9341_RGBSIGNALCONTROL       0xB0
#define ILI9341_FRAMECONTROLNORMAL     0xB1
#define ILI9341_FRAMECONTROLIDLE       0xB2
#define ILI9341_FRAMECONTROLPARTIAL    0xB3
#define ILI9341_INVERSIONCONTROL       0xB4
#define ILI9341_BLANKINGPORCHCONT      0xB5
#define ILI9341_DISPLAYFUNC            0xB6
#define ILI9341_ENTRYMODE              0xB7
#define ILI9341_BACKLIGHTCONTROL1      0xB8
#define ILI9341_BACKLIGHTCONTROL2      0xB9
#define ILI9341_BACKLIGHTCONTROL3      0xBA
#define ILI9341_BACKLIGHTCONTROL4      0xBB
#define ILI9341_BACKLIGHTCONTROL5      0xBC
#define ILI9341_BACKLIGHTCONTROL7      0xBE
#define ILI9341_BACKLIGHTCONTROL8      0xBF
#define ILI9341_POWERCONTROL1          0xC0
#define ILI9341_POWERCONTROL2          0xC1
#define ILI9341_VCOMCONTROL1           0xC5
#define ILI9341_VCOMCONTROL2           0xC7
#define ILI9341_POWERCONTROLA          0xCB
#define ILI9341_POWERCONTROLB          0xCF
#define ILI9341_NVMEMORYWRITE          0xD0
#define ILI9341_NVMEMORYKEY            0xD1
#define ILI9341_NVMEMORYSTATUSREAD     0xD2
#define ILI9341_READID4                0xD3
#define ILI9341_READID1                0xDA
#define ILI9341_READID2                0xDB
#define ILI9341_READID3                0xDC
#define ILI9341_POSITIVEGAMMCORR       0xE0
#define ILI9341_NEGATIVEGAMMCORR       0xE1
#define ILI9341_DIGITALGAMMCONTROL1    0xE2
#define ILI9341_DIGITALGAMMCONTROL2    0xE3
#define ILI9341_DRIVERTIMCONTROLA      0xE8
#define ILI9341_DRIVERTIMCONTROLC      0xEA
#define ILI9341_POWERSEQCONTROL        0xED
#define ILI9341_ENABLE3G               0xF2
#define ILI9341_INTERFACECONTROL       0xF6
#define ILI9341_PUMPRATIOCONTROL       0xF7

// Display memory configuration parameters
#define ILI9341_MADCTL_MY              0x80 // bit D7
#define ILI9341_MADCTL_MX              0x40 // bit D6
#define ILI9341_MADCTL_MV              0x20 // bit D5
#define ILI9341_MADCTL_ML              0x10 // bit D4
#define ILI9341_MADCTL_BGR             0x08 // bit D3
#define ILI9341_MADCTL_MH              0x04 // bit D2

// Color modes
#define ILI9341_COLOR_MODE_16bit       0x55 // RGB565 (16bit)
#define ILI9341_COLOR_MODE_18bit       0x66 // RGB666 (18bit)

uint8_t* ILI9341_Init(uint8_t orientation);
uint8_t* ILI9341_SetWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1);
uint8_t* ILI9341_SleepIn(void);
uint8_t* ILI9341_SleepOut(void);

#endif /* INC_ILI9341_H_ */

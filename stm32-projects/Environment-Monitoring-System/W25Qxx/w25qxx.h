#ifndef _W25Q_H_
#define _W25Q_H_

#define W25_ENABLE_RESET  0x66
#define W25_RESET  0x99
#define W25_READ  0x03
#define W25_GET_JEDEC_ID  0x9f
#define SPI_IS_BUSY 	(HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_4)==GPIO_PIN_RESET)
#define W25_W_ENABLE		0x06
#define W25_CH_ERASE		0xC7
#define W25_R_SFPD_REG		0x5A
#define W25_R_SR1			0x05
#define SR1_BIT_BUSY		(01U)  //status only: 1 means busy device
#define W25_DUMMY			0x00	//dummy MUST be 0x00, in "read manufacturer"
#define W25_FAST_READ  0x0B
#define W25_WRITE_DISABLE  0x04
#define W25_WRITE_ENABLE 0x06
#define W25_SECTOR_ERASE 0x20
#define W25_BLOCK_ERASE  0xD8
#define W25_CHIP_ERASE 0xC7
#define W25_READ_STATUS_1  0x05
#define W25_READ_STATUS_2  0x35
#define W25_READ_STATUS_3  0x15
#define W25_WRITE_STATUS_1 0x01
#define W25_WRITE_STATUS_2 0x31
#define W25_WRITE_STATUS_3 0x11
#define W25_PAGE_PROGRAMM  0x02

#define FLASH_START_ADDRESS  0x000000  // Начальный адрес буфера во флеш
#define FLASH_END_ADDRESS    0x7FFFFF  // Конечный адрес флеш (8 МБ)
#define PAGE_SIZE            256       // 16 bytes * 16
#define SECTOR_SIZE 		 4096 // 16 pages * 256

uint8_t Flash_Init();
void W25_Write_Data(uint32_t addr, uint8_t* data, uint32_t sz);
void W25_Write_Page(uint8_t* data, uint32_t page_addr, uint32_t offset, uint32_t sz);
void W25_Read_Data(uint32_t addr, uint8_t* data, uint32_t sz);
void W25_Read_Page(uint8_t* data, uint32_t page_addr, uint32_t offset, uint32_t sz);
void W25_Erase_Sector(uint32_t addr);
void W25_Erase_Block(uint32_t addr);
void W25_Erase_Chip(void);
void Write_To_Flash_Loop(uint8_t last_iteration);

typedef struct
{
  uint16_t  PageSize;
  uint32_t  PageCount;
  uint32_t  SectorSize;
  uint32_t  SectorCount;
  uint32_t  BlockSize;
  uint32_t  BlockCount;
  uint32_t  NumKB;
  uint8_t   SR1;
  uint8_t   SR2;
  uint8_t   SR3;
  uint8_t   high_cap;
  uint8_t   StatusRegister1;
  uint8_t   StatusRegister2;
  uint8_t   StatusRegister3;
}w25_info_t;

#endif // _W25Q_H_

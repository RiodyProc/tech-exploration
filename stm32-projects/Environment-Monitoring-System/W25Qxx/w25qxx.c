#include <stdio.h>
#include <string.h>
#include "main.h"
#include "w25qxx.h"

extern char str1[512];
uint8_t rx_buf[1025];
uint8_t tx_buf[10];
unsigned int addr = 0;

w25_info_t  w25_info;

void Flash_Select(void) {
    // Wait for SPI transmission to complete
    while (LL_SPI_IsActiveFlag_BSY(SPI1)) {}

    // Set the Chip Select (CS) line to low
    LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_4);
}

void Flash_UnSelect(void) {
    // Set the Chip Select (CS) line to high
    LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_4);
}

void Flash_Transmit(uint8_t* data, uint16_t dataSize) {

    // Wait until SPI is ready for transmission
    while (!LL_SPI_IsActiveFlag_TXE(SPI1)) {}

    // Transmit data
    for (uint16_t i = 0; i < dataSize; i++) {
        // Write data to SPI Data Register
        LL_SPI_TransmitData8(SPI1, data[i]);

        // Wait until the transmitter is empty
        while (!LL_SPI_IsActiveFlag_TXE(SPI1)) {}
        // Wait for the data transmission to complete
        while (!LL_SPI_IsActiveFlag_RXNE(SPI1)) {}
        (void) SPI1->DR;
    }
}

void Flash_Receive(uint8_t* data, uint16_t dataSize) {
    // Transmit data (for example, send a dummy byte to receive data)
    for (uint16_t i = 0; i < dataSize; i++) {
        // Wait until SPI is ready for transmission
        while (!LL_SPI_IsActiveFlag_TXE(SPI1)) {}

        // Transmit a dummy byte to start data reception
        LL_SPI_TransmitData8(SPI1, 0xFF);  // Usually 0xFF is used for reading

        // Wait until the data is received
        while (!LL_SPI_IsActiveFlag_RXNE(SPI1)) {}

        // Read data from the SPI register
        data[i] = LL_SPI_ReceiveData8(SPI1);
    }
}

//-------------------------------------------------------------
void W25_Write_Enable(void)
{
	Flash_Select();
  	tx_buf[0] = W25_WRITE_ENABLE;
	Flash_Transmit(tx_buf, 1);
	Flash_UnSelect();
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Write_Disable(void)
{
	Flash_Select();
  	tx_buf[0] = W25_WRITE_DISABLE;
	Flash_Transmit(tx_buf, 1);
	Flash_UnSelect();
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Set_Block_Protect(uint8_t val)
{
    tx_buf[0] = 0x50;// Enable writing in status reg
	Flash_Select();
	Flash_Transmit(tx_buf, 1);
	Flash_UnSelect();
    
	tx_buf[0] = W25_WRITE_STATUS_1;
    tx_buf[1] = ((val & 0x0F) << 2);
	Flash_Select();
    Flash_Transmit(tx_buf, 2);
	Flash_UnSelect();
}
//-------------------------------------------------------------

/**************************
 * @BRIEF	keeps looping inside this function until "BUSY" bit in SR1 register
 * 			becomes 0, meaning that the runnin data operation (writing or erasing)
 * 			on the chip, ended
 **************************/
void Flash_WaitForWritingComplete(void){
uint8_t buffer[1];
	
	Flash_Select();
	buffer[0] = W25_R_SR1;
	Flash_Transmit(buffer, 1);
	do {
		Flash_Receive(buffer, 1);  //SR1 is repeteadly sent until Flash is selected
	} while (buffer[0] & SR1_BIT_BUSY);
	Flash_UnSelect();
}
//-------------------------------------------------------------
void W25_Wait_Write_End(void)
{
  LL_mDelay(1);
  Flash_Select();
  tx_buf[0] = W25_READ_STATUS_1;
  Flash_Transmit(tx_buf, 1);
  do{
    Flash_Receive(tx_buf,1);
    w25_info.StatusRegister1 = tx_buf[0];
    LL_mDelay(1);
  }
  while((w25_info.StatusRegister1 & 0x01) == 0x01);
  Flash_UnSelect();
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Erase_Sector(uint32_t addr)
{
  W25_Wait_Write_End();
  W25_Set_Block_Protect(0x00);

  addr = addr * w25_info.SectorSize;
  W25_Write_Enable();
  Flash_Select();
  
  tx_buf[0] = W25_SECTOR_ERASE;
  if(w25_info.high_cap)
  {
    tx_buf[1] = (addr >> 24) & 0xFF;
    tx_buf[2] = (addr >> 16) & 0xFF;
    tx_buf[3] = (addr >> 8) & 0xFF;
    tx_buf[4] = addr & 0xFF;
    Flash_Transmit(tx_buf, 5);
  }
  else
  {
    tx_buf[1] = (addr >> 16) & 0xFF;
    tx_buf[2] = (addr >> 8) & 0xFF;
    tx_buf[3] = addr & 0xFF;
    Flash_Transmit(tx_buf, 4);
  }
  Flash_UnSelect();
  W25_Wait_Write_End();
  W25_Write_Disable();
  W25_Set_Block_Protect(0x0F);
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Erase_Block(uint32_t addr)
{
  W25_Wait_Write_End();
  W25_Set_Block_Protect(0x00);

  addr = addr * w25_info.BlockSize;
  W25_Write_Enable();
  Flash_Select();
  
  tx_buf[0] = W25_BLOCK_ERASE;
  if(w25_info.high_cap)
  {
    tx_buf[1] = (addr >> 24) & 0xFF;
    tx_buf[2] = (addr >> 16) & 0xFF;
    tx_buf[3] = (addr >> 8) & 0xFF;
    tx_buf[4] = addr & 0xFF;
    Flash_Transmit(tx_buf, 5);
  }
  else
  {
    tx_buf[1] = (addr >> 16) & 0xFF;
    tx_buf[2] = (addr >> 8) & 0xFF;
    tx_buf[3] = addr & 0xFF;
    Flash_Transmit(tx_buf, 4);
  }
  Flash_UnSelect();
  W25_Wait_Write_End();
  W25_Write_Disable();
  W25_Set_Block_Protect(0x0F);
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Erase_Chip(void)
{
  W25_Wait_Write_End();
  W25_Set_Block_Protect(0x00);

  W25_Write_Enable();
  
  Flash_Select();
  tx_buf[0] = W25_CHIP_ERASE;
  Flash_Transmit(tx_buf, 1);
  Flash_UnSelect();
  
  W25_Wait_Write_End();
  W25_Write_Disable();
  W25_Set_Block_Protect(0x0F);
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Write_Data(uint32_t addr, uint8_t* data, uint32_t sz)
{
  Flash_WaitForWritingComplete();
  W25_Set_Block_Protect(0x00);
  W25_Write_Enable();
  Flash_Select();
  
  tx_buf[0] = W25_PAGE_PROGRAMM;
  if(w25_info.high_cap)
  {
    tx_buf[1] = (addr >> 24) & 0xFF;
    tx_buf[2] = (addr >> 16) & 0xFF;
    tx_buf[3] = (addr >> 8) & 0xFF;
    tx_buf[4] = addr & 0xFF;
    Flash_Transmit(tx_buf, 5);
  }
  else
  {
    tx_buf[1] = (addr >> 16) & 0xFF;
    tx_buf[2] = (addr >> 8) & 0xFF;
    tx_buf[3] = addr & 0xFF;
    Flash_Transmit(tx_buf, 4);
  }
  Flash_Transmit(data, sz);
  Flash_UnSelect();
  Flash_WaitForWritingComplete();
  W25_Write_Disable();
  W25_Set_Block_Protect(0x0F);
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Write_Page(uint8_t* data, uint32_t page_addr, uint32_t offset, uint32_t sz)
{
  if(sz > w25_info.PageSize)
      sz = w25_info.PageSize;
  if((offset+sz) > w25_info.PageSize)
      sz = w25_info.PageSize - offset;
  page_addr = page_addr * w25_info.PageSize + offset;
  
  //W25_Wait_Write_End();
  Flash_WaitForWritingComplete();
  W25_Set_Block_Protect(0x00);
  W25_Write_Enable();
  Flash_Select();
  
  tx_buf[0] = W25_PAGE_PROGRAMM;
  if(w25_info.high_cap)
  {
    tx_buf[1] = (page_addr >> 24) & 0xFF;
    tx_buf[2] = (page_addr >> 16) & 0xFF;
    tx_buf[3] = (page_addr >> 8) & 0xFF;
    tx_buf[4] = page_addr & 0xFF;
    Flash_Transmit(tx_buf, 5);
  }
  else
  {
    tx_buf[1] = (page_addr >> 16) & 0xFF;
    tx_buf[2] = (page_addr >> 8) & 0xFF;
    tx_buf[3] = page_addr & 0xFF;
    Flash_Transmit(tx_buf, 4);
  }
  Flash_Transmit(data, sz);
  //W25_Wait_Write_End();
  Flash_UnSelect();
  Flash_WaitForWritingComplete();
  W25_Write_Disable();
  W25_Set_Block_Protect(0x0F);
}

//-------------------------------------------------------------
void W25_Read_Data(uint32_t addr, uint8_t* data, uint32_t sz)
{
  Flash_Select();
  tx_buf[0] = W25_READ;
  tx_buf[1] = (addr >> 16) & 0xFF;
  tx_buf[2] = (addr >> 8) & 0xFF;
  tx_buf[3] = addr & 0xFF;
  Flash_Transmit(tx_buf, 4);
  Flash_Receive(data, sz);
  Flash_UnSelect();
}
//-------------------------------------------------------------

//-------------------------------------------------------------
void W25_Read_Page(uint8_t* data, uint32_t page_addr, uint32_t offset, uint32_t sz)
{ 
  if(sz > w25_info.PageSize)
      sz = w25_info.PageSize;
  if((offset+sz) > w25_info.PageSize)
      sz = w25_info.PageSize - offset;

  page_addr = page_addr * w25_info.PageSize + offset;

  tx_buf[0] = W25_FAST_READ;
  if(w25_info.high_cap)
  {
    tx_buf[1] = (page_addr >> 24) & 0xFF;
    tx_buf[2] = (page_addr >> 16) & 0xFF;
    tx_buf[3] = (page_addr >> 8) & 0xFF;
    tx_buf[4] = page_addr & 0xFF;
    tx_buf[5] = 0;
	Flash_Select();
    Flash_Transmit(tx_buf, 6);
  }
  else
  {
    tx_buf[1] = (page_addr >> 16) & 0xFF;
    tx_buf[2] = (page_addr >> 8) & 0xFF;
    tx_buf[3] = page_addr & 0xFF;
    tx_buf[4] = 0;
	Flash_Select();
    Flash_Transmit(tx_buf, 5);
  }
  Flash_Receive(data, sz);
  Flash_UnSelect();
}
//-------------------------------------------------------------

void Flash_Reset(){
uint8_t command;
	command = W25_ENABLE_RESET;
	Flash_Select();
	Flash_Transmit(&command, 1);
	Flash_UnSelect();
	command = W25_RESET;
	Flash_Select();
	Flash_Transmit(&command, 1);
	Flash_UnSelect();
	LL_mDelay(1);	// 30us needed by resetting
}
/**********************************
 * @BRIEF	Full chip erase to 0XFF
 * 			Chip Erase may need up to 100s
 * 			(typ. 20s)
 * 			waiting the writing complete in each page
 *********************************/
void Flash_ChipErase(){
uint8_t buffer[4];
	Flash_Select();
	buffer[0] = W25_W_ENABLE;
	Flash_Transmit(buffer, 1);
	Flash_UnSelect();

	buffer[0] = W25_CH_ERASE;
	Flash_Select();
	Flash_Transmit(buffer, 1);
	Flash_UnSelect();
	Flash_WaitForWritingComplete();
}
/*********************************
 * @RETURN	256byte SFDP register content:
 *********************************/
void Flash_ReadSFDP(uint8_t* data) {
uint8_t buffer[5];
	buffer[0] = W25_R_SFPD_REG;
	for (uint8_t k=1;k<5;k++)
		buffer[k]=0;
	Flash_Select();
	Flash_Transmit(buffer, 5);
	Flash_Receive(data, 256);
	Flash_UnSelect();
}
/*********************************
 * @BRIEF	testing chip alive and kicking
 * 			reading SFDP record, it must return
 * 			a string beginning with "SFDP"
 * @RETURN	1 	test passed
 * 			0	no
 *********************************/
uint8_t Flash_TestAvailability() {
uint8_t data[256];
uint8_t test=1;

	for (uint8_t k=0;k!=254;k++)
		  data[k]=0xFF;
	Flash_ReadSFDP(data);
	if (data[0]!='S')
		test=0;
	if (data[1]!='F')
		test=0;
	if (data[2]!='D')
		test=0;
	if (data[3]!='P')
		test=0;
	return test;
}
/******************************************************************
 * @RETURN	32bit value divided in 4 bytes:
 * 			(1)MSB	dummy
 * 			(2)		Jedec Manufacturer ID
 * 			(3)		Memory Type
 * 			(4)		Capacity
 ******************************************************************
 * Memory Capacity code:
 * 			10H ->	 5Mb		11H ->  10Mb		12H ->  20Mb
 * 			13H ->  40Mb		14H ->  80Mb		15H ->  16Mb
 * 			16H ->  32Mb		17H ->  64Mb		18H -> 128Mb
 * 			19H -> 256Mb		20H -> 512Mb		21H ->   1Gb
 ******************************************************************/
uint32_t Flash_ReadJedecID() {
uint8_t buffer[4];
uint8_t data[3];
uint32_t result;

	buffer[0] = W25_GET_JEDEC_ID;
	Flash_Select();
	Flash_Transmit(buffer, 1);
	Flash_Receive(data, 3);
	Flash_UnSelect();
	result=((data[0]<<16) | (data[1] <<8) | data[2]);
	return result;
}

uint8_t Flash_Init(){
  
  uint32_t JedecID;
  
  LL_mDelay(6);	// supposing init is called on system startup: 5 ms (tPUW) required after power-up to be fully available
  Flash_Reset();
 
  // Flash_TestAvailability
  if (!Flash_TestAvailability()){
  	uart_send_string("\n\rFlash_TestAvailability Error...\n\r");
  	return 0;
  }
  uart_send_string("\n\rFlash_TestAvailability OK!\n\r");
  
  // Flash_TestJedecID
  JedecID = Flash_ReadJedecID() ;	//select the memSize byte
  if (((JedecID >> 16) & 0XFF) != 0xEF){  // if ManufacturerID is not Winbond (0xEF)
  	uart_send_string("\n\rJedecID Error...\n\r");
  	return 0;
  }
  uart_send_string("\n\rJedecID OK!");
  sprintf(str1,"\n\rID: 0x%X\n\r", JedecID);
  uart_send_string(str1);
  
  // Model information
  JedecID &= 0x0000ffff;
  w25_info.high_cap = 0;

  switch(JedecID)
  {
    case 0x401A:
      w25_info.BlockCount=1024;
      w25_info.high_cap = 1;
      sprintf(str1,"\n\rw25qxx Chip: w25q512\r\n");
      break;
    case 0x4019:
      w25_info.BlockCount=512;
      w25_info.high_cap = 1;
      sprintf(str1,"\n\rw25qxx Chip: w25q256\r\n");
      break;
    case 0x4018:
      w25_info.BlockCount=256;
      sprintf(str1,"\n\rw25qxx Chip: w25q128\r\n");
      break;
    case 0x4017:
      w25_info.BlockCount=128;
      sprintf(str1,"\n\rw25qxx Chip: w25q64\r\n");
      break;
    case 0x4016:
      w25_info.BlockCount=64;
      sprintf(str1,"\n\rw25qxx Chip: w25q32\r\n");
      break;
    case 0x4015:
      w25_info.BlockCount=32;
      sprintf(str1,"\n\rw25qxx Chip: w25q16\r\n");
      break;
    case 0x4014:
      w25_info.BlockCount=16;
      sprintf(str1,"\n\rw25qxx Chip: w25q80\r\n");
      break;
    case 0x4013:
      w25_info.BlockCount=8;
      sprintf(str1,"\n\rw25qxx Chip: w25q40\r\n");
      break;
    case 0x4012:
      w25_info.BlockCount=4;
      sprintf(str1,"\n\rw25qxx Chip: w25q20\r\n");
      break;
    case 0x4011:
      w25_info.BlockCount=2;
      sprintf(str1,"\n\rw25qxx Chip: w25q10\r\n");
      break;
    default:
      sprintf(str1,"\n\rw25qxx Unknown ID\r\n");
      uart_send_string(str1);
      return 1;
  }
  uart_send_string(str1);
  uart_send_string("\n\r");

  // Global information
  w25_info.PageSize=256;
  w25_info.SectorSize=0x1000;
  w25_info.SectorCount=w25_info.BlockCount*16;
  w25_info.PageCount=(w25_info.SectorCount*w25_info.SectorSize)/w25_info.PageSize;
  w25_info.BlockSize=w25_info.SectorSize*16;
  w25_info.NumKB=(w25_info.SectorCount*w25_info.SectorSize)/1024;
  
  sprintf(str1,"Page Size: %d Bytes\r\n",(unsigned int)w25_info.PageSize);
  uart_send_string(str1);
  sprintf(str1,"Page Count: %u\r\n",(unsigned int)w25_info.PageCount);
  uart_send_string(str1);
  sprintf(str1,"Sector Size: %u Bytes\r\n",(unsigned int)w25_info.SectorSize);
  uart_send_string(str1);
  sprintf(str1,"Sector Count: %u\r\n",(unsigned int)w25_info.SectorCount);
  uart_send_string(str1);
  sprintf(str1,"Block Size: %u Bytes\r\n",(unsigned int)w25_info.BlockSize);
  uart_send_string(str1);
  sprintf(str1,"Block Count: %u\r\n",(unsigned int)w25_info.BlockCount);
  uart_send_string(str1);
  sprintf(str1,"Capacity: %u KB\r\n",(unsigned int)w25_info.NumKB);
  uart_send_string(str1);
  uart_send_string("\n\r");
  
  return 1;  //return memSize as per table in Flash_ReadJedecID() definition
}


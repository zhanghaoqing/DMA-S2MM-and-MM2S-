#include "I2C_8bit.h"
#include "xgpio.h"
#include "xil_exception.h"
#include"xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xdevcfg.h"
#include "xgpiops.h"
#include "sys_intr.h"

#define IMAGE_WIDTH     640
#define IMAGE_HEIGHT	480
#define BYTES_PER_PIXEL	4
#define image_length 0x0004b000

#define MEM_BASE_ADDR		0x10000000

#define BUFFER0_BASE		0x10000000
#define BUFFER1_BASE		0x20000000
#define BUFFER2_BASE		0x30000000

#define AXI_GPIO_DEV_ID	        XPAR_AXI_GPIO_0_DEVICE_ID

#define XGpio_axi_WriteReg(BaseAddr, RegOffset, Data)	\
		Xil_Out32((BaseAddr) + (u32)(RegOffset), (u32)(Data))

#define XPAR_GPIO_LITE_ML_0 0x40400000
static XScuGic Intc;

int main(void)
{
	printf("hello\n");
	int s2mm_count = 0;
	int mm2s_count = 0;

	u32 *BufferPtr[3];
	BufferPtr[0] = (u32 *)BUFFER0_BASE;
	BufferPtr[1] = (u32 *)BUFFER1_BASE;
	BufferPtr[2] = (u32 *)BUFFER2_BASE;

	/******************************************************************************/
	static XGpioPs psGpioInstancePtr;
	XGpioPs_Config* GpioConfigPtr;
	int xStatus;
	GpioConfigPtr = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	xStatus = XGpioPs_CfgInitialize(&psGpioInstancePtr,GpioConfigPtr, GpioConfigPtr->BaseAddr);


	if(XST_SUCCESS != xStatus)
		print(" PS GPIO INIT FAILED \n\r");

	XGpioPs_SetDirectionPin(&psGpioInstancePtr, 54,0);
	XGpioPs_SetOutputEnablePin(&psGpioInstancePtr, 54,0);

	XGpioPs_SetDirectionPin(&psGpioInstancePtr, 55,0);
	XGpioPs_SetOutputEnablePin(&psGpioInstancePtr, 55,0);
	/******************************************************************************/

	static XGpio Gpio;
	XGpio_Initialize(&Gpio, AXI_GPIO_DEV_ID);
	XGpio_SetDataDirection(&Gpio, 1, 0);

	I2C_config_init();

	XGpio_DiscreteWrite(&Gpio, 1, 1);

	/******************************************************************************/

	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,8,0x20000000);
	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,12,0x0004b000);
	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,12,0xFF04b000);
	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,12,0x0004b000);

	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,0,0x10000000);
	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,4,0x0004b000);
	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,4,0xFF04b000);
	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,4,0x0004b000);

	/******************************************************************************/

	while(1)
	{

	    if(XGpioPs_ReadPin(&psGpioInstancePtr,55)!=0)
	    {
	    	printf("s2mm\n");
	    	if(s2mm_count == 2)
	    		s2mm_count = 0;
	    	else
	    		s2mm_count++;

	    	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,0,(u32)BufferPtr[s2mm_count]);
	    	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,4,0xFF04b000);
	    	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,4,0x0004b000);
	    }


	    if(XGpioPs_ReadPin(&psGpioInstancePtr,54)!=0)
	    {
	    	printf("mm2s: %d\n",mm2s_count);
	    	if(mm2s_count == 2)
	    		mm2s_count = 0;
	    	else
	    		mm2s_count++;

	    	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,8,(u32)BufferPtr[mm2s_count]);
	    	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,12,0xFF04b000);
	    	XGpio_axi_WriteReg(XPAR_GPIO_LITE_ML_0,12,0x0004b000);
	    }
	}


	return 0;
}



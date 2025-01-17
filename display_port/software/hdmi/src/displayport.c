/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xvtc.h"
#include "vga_modes.h"
#include "xv_tpg.h"
#include "xvidc.h"
#include "xavbuf.h"
#include "xavbuf_clk.h"
#include "xvidc.h"
#include "xdpdma_video_example.h"
#include "xparameters.h"

XVtc	VtcInst;
XVtc_Config *vtc_config ;
XV_tpg tpg;
XV_tpg_Config *tpg_config;
XAVBuf_Config *AVBuf_config;
XAVBuf		AVBufPtr;
void setup_tpg();
//
//typedef enum {
//	LANE_COUNT_1 = 1,
//	LANE_COUNT_2 = 2,
//} LaneCount_t;
//
//typedef enum {
//	LINK_RATE_162GBPS = 0x06,
//	LINK_RATE_270GBPS = 0x0A,
//	LINK_RATE_540GBPS = 0x14,
//} LinkRate_t;
//
//typedef struct {
//	XVidC_VideoMode	  VideoMode;
//	XVidC_ColorDepth  Bpc;
//	XAVBuf_VideoFormat ColorEncode;
//
//	u8 UseMaxLaneCount;
//	u8 UseMaxLinkRate;
//	u8 LaneCount;
//	u8 LinkRate;
//	u8 UseMaxCfgCaps;
//	u8 EnSynchClkMode;
//
//	u32 PixClkHz;
//} Run_Config;
//
Run_Config RunCfgPtr;

int main()
{

	XVtc_Timing vtcTiming;
	XVtc_SourceSelect SourceSelect;
	VideoMode video;

    init_platform();

    print("\n\rDisplay Port Test\n\r");

    vtc_config = XVtc_LookupConfig(XPAR_VTC_0_DEVICE_ID);
    XVtc_CfgInitialize(&VtcInst, vtc_config, vtc_config->BaseAddress);
    run_dppsu();
    /* Initialize Video Pipeline driver */

	RunCfgPtr.VideoMode             = XVIDC_VM_1280x720_60_P;
	RunCfgPtr.Bpc		            = XVIDC_BPC_8;
	RunCfgPtr.ColorEncode			= RGB_8BPC;
	RunCfgPtr.UseMaxCfgCaps		    = 1;
	RunCfgPtr.LaneCount			    = LANE_COUNT_2;
	RunCfgPtr.LinkRate				= LINK_RATE_270GBPS;
	RunCfgPtr.EnSynchClkMode		= 0;
	RunCfgPtr.UseMaxLaneCount		= 1;
	RunCfgPtr.UseMaxLinkRate		= 1;

	AVBuf_config->BaseAddr = XPAR_PSU_DP_BASEADDR;
	AVBuf_config->DeviceId = XPAR_PSU_DP_DEVICE_ID;
    XAVBuf_CfgInitialize(&AVBufPtr, AVBuf_config->BaseAddr, XPAR_PSU_DP_DEVICE_ID);

    XAVBuf_SetInputLiveVideoFormat(&AVBufPtr, RGB_8BPC);
	XAVBuf_EnableVideoBuffers(&AVBufPtr, 1);
	/* Set the output Video Format */
	XAVBuf_SetOutputVideoFormat(&AVBufPtr, RGB_8BPC);
	XAVBuf_InputVideoSelect(&AVBufPtr, XAVBUF_VIDSTREAM1_LIVE, XAVBUF_VIDSTREAM2_NONE);
	/* Configure Video pipeline for graphics channel */
	/* Configure the output video pipeline */
	XAVBuf_ConfigureOutputVideo(&AVBufPtr);
	/* Disable the global alpha, since we are using the pixel based alpha */
	XAVBuf_SetBlenderAlpha(&AVBufPtr, 0, 0);
	XAVBuf_SetAudioVideoClkSrc(&AVBufPtr, XAVBUF_PL_CLK, XAVBUF_PS_CLK);
	XAVBuf_SoftReset(&AVBufPtr);

    xil_printf("Setting up video mode\n");

    video = VMODE_1280x720;
	vtcTiming.HActiveVideo = video.width;	/**< Horizontal Active Video Size */
	vtcTiming.HFrontPorch = video.hps - video.width;	/**< Horizontal Front Porch Size */
	vtcTiming.HSyncWidth = video.hpe - video.hps;		/**< Horizontal Sync Width */
	vtcTiming.HBackPorch = video.hmax - video.hpe + 1;		/**< Horizontal Back Porch Size */
	vtcTiming.HSyncPolarity = video.hpol;	/**< Horizontal Sync Polarity */
	vtcTiming.VActiveVideo = video.height;	/**< Vertical Active Video Size */
	vtcTiming.V0FrontPorch = video.vps - video.height;	/**< Vertical Front Porch Size */
	vtcTiming.V0SyncWidth = video.vpe - video.vps;	/**< Vertical Sync Width */
	vtcTiming.V0BackPorch = video.vmax - video.vpe + 1;;	/**< Horizontal Back Porch Size */
	vtcTiming.V1FrontPorch = video.vps - video.height;	/**< Vertical Front Porch Size */
	vtcTiming.V1SyncWidth = video.vpe - video.vps;	/**< Vertical Sync Width */
	vtcTiming.V1BackPorch = video.vmax - video.vpe + 1;;	/**< Horizontal Back Porch Size */
	vtcTiming.VSyncPolarity = video.vpol;	/**< Vertical Sync Polarity */
	vtcTiming.Interlaced = 0;


    memset((void *)&SourceSelect, 0, sizeof(SourceSelect));
	SourceSelect.VBlankPolSrc = 1;
	SourceSelect.VSyncPolSrc = 1;
	SourceSelect.HBlankPolSrc = 1;
	SourceSelect.HSyncPolSrc = 1;
	SourceSelect.ActiveVideoPolSrc = 1;
	SourceSelect.ActiveChromaPolSrc= 1;
	SourceSelect.VChromaSrc = 1;
	SourceSelect.VActiveSrc = 1;
	SourceSelect.VBackPorchSrc = 1;
	SourceSelect.VSyncSrc = 1;
	SourceSelect.VFrontPorchSrc = 1;
	SourceSelect.VTotalSrc = 1;
	SourceSelect.HActiveSrc = 1;
	SourceSelect.HBackPorchSrc = 1;
	SourceSelect.HSyncSrc = 1;
	SourceSelect.HFrontPorchSrc = 1;
	SourceSelect.HTotalSrc = 1;
	XVtc_RegUpdateEnable(&VtcInst);
	XVtc_SetGeneratorTiming(&VtcInst, &vtcTiming);
	XVtc_SetSource(&VtcInst, &SourceSelect);
	XVtc_EnableGenerator(&VtcInst);
	XVtc_Enable(&VtcInst);

	 setup_tpg();

	 while(1){

	 }


    cleanup_platform();
    return 0;
}

void setup_tpg()
{

    u32 height,width,status;

    tpg_config = XV_tpg_LookupConfig(XPAR_XV_TPG_0_DEVICE_ID);
    XV_tpg_CfgInitialize(&tpg, tpg_config, tpg_config->BaseAddress);

#ifdef DEBUG
    status = XV_tpg_IsReady(&tpg);
	printf("TPG Status %u \n\r", (unsigned int) status);
#endif
	XV_tpg_Set_height(&tpg, (u32)720);
	XV_tpg_Set_width(&tpg, (u32)1280);
	height = XV_tpg_Get_height(&tpg);
	width = XV_tpg_Get_width(&tpg);
	XV_tpg_Set_colorFormat(&tpg,XVIDC_CSF_RGB);
	XV_tpg_Set_maskId(&tpg, 0x0);
	XV_tpg_Set_motionSpeed(&tpg, 0x4);
#ifdef DEBUG
	printf("info from tpg %u %u \n\r", (unsigned int)height, (unsigned int)width);
#endif
	XV_tpg_Set_bckgndId(&tpg,  XTPG_BKGND_COLOR_BARS); //XTPG_BKGND_TARTAN_COLOR_BARS);

#ifdef DEBUG
	status = XV_tpg_Get_bckgndId(&tpg);
	printf("Status %x \n\r", (unsigned int) status);
#endif
	XV_tpg_EnableAutoRestart(&tpg);
	XV_tpg_Start(&tpg);

#ifdef DEBUG
	status = XV_tpg_IsIdle(&tpg);
	printf("Status %u \n\r", (unsigned int) status);
#endif

}

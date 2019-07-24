/*
 * jdapistd.c
 *
 * Copyright (C) 1994-1996, Thomas G. Lane.
 * This file is part of the Independent JPEG Group's software.
 * For conditions of distribution and use, see the accompanying README file.
 *
 * This file contains application interface code for the decompression half
 * of the JPEG library.  These are the "standard" API routines that are
 * used in the normal full-decompression case.  They are not used by a
 * transcoding-only application.  Note that if an application links in
 * jpeg_start_decompress, it will end up linking in the entire decompressor.
 * We thus must separate this file from jdapimin.c to avoid linking the
 * whole decompression library into a transcoder.
 */

#define JPEG_INTERNALS
#include "jinclude.h"
#include "jpeglib.h"
#include "jdatasrc.h"

#include "hi_jpeg_config.h"
#include "hi_jpeg_api.h"

/**
 ** add the include file about the functions that hard decode needed
 ** CNcomment: 增加硬件解码需要的头文件 CNend\n
 **/
#include "jpeg_hdec_api.h"

#if defined(CONFIG_JPEG_ANDROID_DEBUG_ENABLE) && defined(CONFIG_JPEG_DEBUG_INFO)
#define LOG_TAG "libjpeg"
#endif

/* Forward declarations */
LOCAL(boolean) output_pass_setup JPP((j_decompress_ptr cinfo));


#ifdef CONFIG_JPEG_SAVE_INPUTSTREAM_DATA
extern HI_VOID JPEG_HDEC_PrintInputStream(HI_UCHAR* InputStreamVirBuf, HI_ULONG InputStreamSize);
extern HI_VOID JPEG_HDEC_SaveInputStream(HI_UCHAR* InputStreamVirBuf, HI_ULONG InputStreamSize);
#endif


/*
 * Decompression initialization.
 * jpeg_read_header must be completed before calling this.
 *
 * If a multipass operating mode was selected, this will do all but the
 * last pass, and thus may take a great deal of time.
 *
 * Returns FALSE if suspended.  The return value need be inspected only if
 * a suspending data source is used.
 */

/**
 ** the soft decode move from jpeg_start_decompress,now jpeg_start_decompress
 ** have two decode type, hard decode and soft decode
 ** CNcomment: 原先jpeg_start_decompress的软件解码流程，现在将他重新
 **            命名一个函数实现 CNend\n
 **/
#ifndef CONFIG_JPEG_ADD_SRC_FUNCTION
static HI_BOOL jpeg_seek_input_data(j_decompress_ptr cinfo, long byte_offset)
{

	 int ret = 0;
	 my_src_ptr src = (my_src_ptr) cinfo->src;
	 
	 ret = fseek(src->infile,byte_offset,SEEK_SET);
	 if(0 != ret)
	 {
		 ERREXIT(cinfo, JERR_STREAM_BACK_FAILURE);
	 }
	 
	 src->pub.next_input_byte = src->buffer;
	 src->pub.bytes_in_buffer = 0;
     
	 return HI_TRUE;
	
}
#endif
#if 0//def CONFIG_JPEG_ADD_GOOGLEFUNCTION
static HI_VOID register_callback_src(j_decompress_ptr cinfo)
{
     JPEG_HDEC_HANDLE_S_PTR pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)(cinfo->client_data);
     cinfo->src = (struct jpeg_source_mgr*)pJpegHandle->pCallBackSrc;
}
static boolean my_fill_input_buffer(j_decompress_ptr cinfo)
{
    my_src_ptr src = (my_src_ptr) cinfo->src;
    if(0 == src->pub.bytes_in_buffer)
    {/** 已经将码流buffer里的码流处理完了 **/
        register_callback_src(cinfo);
    }
    return HI_TRUE;
}
static HI_VOID my_skip_input_data(j_decompress_ptr cinfo, long num_bytes)
{
    /** nothing to do **/
}
static HI_VOID my_term_source(j_decompress_ptr cinfo)
{
    /** nothing to do **/
}
static HI_VOID register_my_src(j_decompress_ptr cinfo)
{
     my_src_ptr src = (my_src_ptr) cinfo->src;
     JPEG_HDEC_HANDLE_S_PTR    pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)(cinfo->client_data);
     src->pub.fill_input_buffer  = my_fill_input_buffer;
     src->pub.skip_input_data    = my_skip_input_data;
     src->pub.term_source        = my_term_source;
     src->pub.next_input_byte    = (JOCTET*)pJpegHandle->stHDecDataBuf.pSaveStreamVirBuf;
     src->pub.bytes_in_buffer    = pJpegHandle->s32ContinueSize;
}
#endif

static HI_BOOL jpeg_start_soft_decompress(j_decompress_ptr cinfo)
{

        if (cinfo->global_state == DSTATE_READY)
        {
             /* First call: initialize master control, select active modules */
             jinit_master_decompress(cinfo);
             if (cinfo->buffered_image)
             {
                /* No more work here; expecting jpeg_start_output next */
                cinfo->global_state = DSTATE_BUFIMAGE;
                return TRUE;
             }
             cinfo->global_state = DSTATE_PRELOAD;
        }
        if (cinfo->global_state == DSTATE_PRELOAD)
        {
              /* If file has multiple scans, absorb them all into the coef buffer */
              if (cinfo->inputctl->has_multiple_scans)
              {
                    #ifdef D_MULTISCAN_FILES_SUPPORTED
                    for (;;)
                    {
                        int retcode;
                        /* Call progress monitor hook if present */
                        if (cinfo->progress != NULL)
                           (*cinfo->progress->progress_monitor) ((j_common_ptr) cinfo);

                        /* Absorb some more input */
                        retcode = (*cinfo->inputctl->consume_input) (cinfo);
                        if (retcode == JPEG_SUSPENDED)
                            return FALSE;

                        if (retcode == JPEG_REACHED_EOI)
                            break;

                        /* Advance progress counter if appropriate */
                        if (cinfo->progress != NULL && (retcode == JPEG_ROW_COMPLETED || retcode == JPEG_REACHED_SOS))
                        {
                            if (++cinfo->progress->pass_counter >= cinfo->progress->pass_limit)
                            {
                              /* jdmaster underestimated number of scans; ratchet up one scan */
                              cinfo->progress->pass_limit += (long) cinfo->total_iMCU_rows;
                            }
                         }
                     }
                     #else
                     ERREXIT(cinfo, JERR_NOT_COMPILED);
                     #endif /* D_MULTISCAN_FILES_SUPPORTED */
                }
                cinfo->output_scan_number = cinfo->input_scan_number;

            }
           else if (cinfo->global_state != DSTATE_PRESCAN)
                ERREXIT1(cinfo, JERR_BAD_STATE, cinfo->global_state);
           /* Perform any dummy output passes, and set up for the final pass */
           return output_pass_setup(cinfo);

}


GLOBAL(boolean) jpeg_start_decompress (j_decompress_ptr cinfo)
{
     HI_BOOL bRet = HI_FALSE;

     HI_S32 s32BeforeStartHardDecState = 0;

     JPEG_HDEC_HANDLE_S_PTR    pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)(cinfo->client_data);

     s32BeforeStartHardDecState = cinfo->global_state;

#ifdef CONFIG_JPEG_CODE_DEPTH_CUT
     if(   (JCS_UNKNOWN     == cinfo->out_color_space) \
         ||(JCS_GRAYSCALE   == cinfo->out_color_space) \
         ||(JCS_YCbCr       == cinfo->out_color_space) \
         ||(JCS_CMYK        == cinfo->out_color_space) \
         ||(JCS_YCCK        == cinfo->out_color_space) \
         ||(JCS_CrCbY       == cinfo->out_color_space) \
         ||(JCS_RGB         == cinfo->out_color_space) \
         ||(JCS_ARGB_8888   == cinfo->out_color_space) \
         ||(JCS_ARGB_1555   == cinfo->out_color_space) \
         ||(JCS_RGB_565     == cinfo->out_color_space)){
         JPEG_TRACE("the output color fmt not support\n");
         ERREXIT(cinfo, JERR_HDEC_INIT_FAILURE);
     }
#endif

#ifdef CONFIG_JPEG_LOW_DELAY_SUPPORT
     if(    (HI_TRUE == pJpegHandle->bLowDelayEn)
         && (   HI_FALSE == pJpegHandle->stHDecDataBuf.bUserPhyMem
             || HI_FALSE == pJpegHandle->stOutDesc.stOutSurface.bUserPhyMem
             || 0 != pJpegHandle->u32ScalRation
             || HI_TRUE == pJpegHandle->bOutYUV420SP)){
         ERREXIT(cinfo, JERR_BAD_STATE);
     }
#endif

     if (HI_TRUE == pJpegHandle->bFirstDec){
         if (DSTATE_READY == s32BeforeStartHardDecState){
             pJpegHandle->pCallBackSrc = (HI_CHAR*)cinfo->src;
             bRet = JPEG_HDEC_Start(cinfo);
         }
         if (HI_TRUE == bRet){
            #ifdef CONFIG_JPEG_OUTPUT_NEED_OS_MEMSIZE
            JPEG_TRACE("the need os memory size is %lfM\n",(pJpegHandle->u32NeedMemSize/1024.0)/1024.0);
            #endif
            #ifdef CONFIG_JPEG_SAVE_INPUTSTREAM_DATA
            JPEG_HDEC_PrintInputStream((HI_UCHAR*)pJpegHandle->stHDecDataBuf.pDataVirBuf,(unsigned long)pJpegHandle->stHDecDataBuf.u64DataSize);
            #endif
            return TRUE;
         }

         cinfo->global_state = s32BeforeStartHardDecState;

#ifdef CONFIG_JPEG_ADD_GOOGLEFUNCTION
         if ( (HI_TRUE == pJpegHandle->bInHardDec) && (NULL != cinfo->src->seek_input_data) ){
              cinfo->src->seek_input_data(cinfo, pJpegHandle->u32CurrentOffset);
         } else if (  (HI_FALSE == pJpegHandle->stHDecDataBuf.bUseInsideData)
                    &&(HI_TRUE == pJpegHandle->bInHardDec)
                    &&(HI_TRUE == pJpegHandle->bFirstContinueStream)
                    &&(HI_TRUE == pJpegHandle->bFillInput)){
              pJpegHandle->bFirstDec = HI_FALSE;
         }else if ((HI_FALSE == pJpegHandle->stHDecDataBuf.bUseInsideData) && (HI_TRUE == pJpegHandle->bInHardDec)){
              pJpegHandle->bFirstDec = HI_FALSE;
              return HI_FALSE;
         }else if ((HI_TRUE == pJpegHandle->stHDecDataBuf.bUseFileData) && (HI_TRUE == pJpegHandle->bInHardDec)){
              jpeg_seek_input_data(cinfo, pJpegHandle->u32CurrentOffset);
         }else{
         }
#else
   #ifdef CONFIG_JPEG_ADD_SRC_FUNCTION
         if ((HI_TRUE == pJpegHandle->bInHardDec) && (NULL != cinfo->src->seek_input_data) ){
                cinfo->src->seek_input_data(cinfo, pJpegHandle->u32CurrentOffset);
         }else if ((HI_TRUE == pJpegHandle->bInHardDec) && (NULL == cinfo->src->seek_input_data) ){
             pJpegHandle->bFirstDec = HI_FALSE;
             return HI_FALSE;
         }
    #else
         if ((HI_FALSE == pJpegHandle->stHDecDataBuf.bUseInsideData)&&(HI_TRUE == pJpegHandle->bInHardDec) && (HI_TRUE == pJpegHandle->bFillInput)){
             pJpegHandle->bFirstDec = HI_FALSE;
             return HI_FALSE;
         }else if ((HI_TRUE == pJpegHandle->stHDecDataBuf.bUseFileData) && (HI_TRUE == pJpegHandle->bInHardDec)){
             jpeg_seek_input_data(cinfo, pJpegHandle->u32CurrentOffset);
         }
    #endif
         else{
         }
#endif
    }

#if defined(CONFIG_JPEG_FPGA_TEST_ENABLE) && defined(CONFIG_JPEG_TEST_CHIP_RANDOM_RESET)
     if (HI_FALSE == pJpegHandle->bHdecEnd){
         JPEG_TRACE("===============================================================\n");
         JPEG_TRACE("test random reset, hard dec failure!\n");
         JPEG_TRACE("===============================================================\n");
         ERREXIT(cinfo, JERR_HDEC_INIT_FAILURE);
     }
#endif

     bRet = jpeg_start_soft_decompress(cinfo);

#ifdef CONFIG_JPEG_SAVE_INPUTSTREAM_DATA
     JPEG_TRACE("===============================================================\n");
     JPEG_TRACE("soft dec success!\n");
     JPEG_TRACE("===============================================================\n");
     JPEG_HDEC_SaveInputStream((HI_UCHAR*)pJpegHandle->stHDecDataBuf.pDataVirBuf,(unsigned long)pJpegHandle->stHDecDataBuf.u64DataSize);
#endif

#ifdef CONFIG_JPEG_OUTPUT_NEED_OS_MEMSIZE
     JPEG_TRACE("the need os memory size is %lfM\n",(pJpegHandle->u32NeedMemSize/1024.0)/1024.0);
#endif

     return bRet;
}


#ifdef CONFIG_JPEG_ADD_GOOGLEFUNCTION

#ifdef CONFIG_JPEG_SUBSET_HARD_DEC_ENABLE
static HI_BOOL jpeg_start_tile_hard_decompress(j_decompress_ptr cinfo)
{
       if (HI_TRUE != JPEG_HDEC_Start(cinfo)){
             return HI_FALSE;
       }

       return HI_TRUE;
}
#endif

static HI_BOOL jpeg_start_tile_soft_decompress(j_decompress_ptr cinfo)
{

	if (cinfo->global_state == DSTATE_READY) 
	{
	    /* First call: initialize master control, select active modules */
	    cinfo->tile_decode = TRUE;
	    jinit_master_decompress(cinfo);
	    if (cinfo->buffered_image) 
		{
	      cinfo->global_state = DSTATE_BUFIMAGE;
	      return TRUE;
	    }
	    cinfo->global_state = DSTATE_PRELOAD;
 	 }
  	 if (cinfo->global_state == DSTATE_PRELOAD) 
	 {
    	cinfo->output_scan_number = cinfo->input_scan_number;
 	 } 
	 else if (cinfo->global_state != DSTATE_PRESCAN)
	 {
    	ERREXIT1(cinfo, JERR_BAD_STATE, cinfo->global_state);
	 }
  	 /* Perform any dummy output passes, and set up for the final pass */
  	 return output_pass_setup(cinfo);
	
}

GLOBAL(boolean)
jpeg_start_tile_decompress (j_decompress_ptr cinfo)
{

	HI_BOOL bRet = HI_FALSE;

#ifdef CONFIG_JPEG_SUBSET_HARD_DEC_ENABLE

	HI_S32 s32BeforeStartHardDecState = 0;
    JPEG_HDEC_HANDLE_S_PTR	pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)(cinfo->client_data);
	s32BeforeStartHardDecState = cinfo->global_state;
	
	if(HI_TRUE == pJpegHandle->bFirstDec)
	{
		if(DSTATE_READY == s32BeforeStartHardDecState)
		{
			bRet = jpeg_start_tile_hard_decompress(cinfo);
		}
		if(HI_TRUE == bRet)
		{ 
			return TRUE;
		}
	   /** 
		** if hard decode failure, to beging soft decode and the golbal_state 
		** should return the state that before hard decode,because the start_decompress
		** should use the golbal state.
		**/
		cinfo->global_state = s32BeforeStartHardDecState;

		if( (HI_TRUE == pJpegHandle->bInHardDec) && (NULL != cinfo->src->seek_input_data) )
		{
			cinfo->src->seek_input_data(cinfo, pJpegHandle->u32CurrentOffset);
		}
		
	}
#endif

	bRet = jpeg_start_tile_soft_decompress(cinfo);

	return bRet;
	
}


#endif /** CONFIG_JPEG_ADD_GOOGLEFUNCTION **/


/*
 * Set up for an output pass, and perform any dummy pass(es) needed.
 * Common subroutine for jpeg_start_decompress and jpeg_start_output.
 * Entry: global_state = DSTATE_PRESCAN only if previously suspended.
 * Exit: If done, returns TRUE and sets global_state for proper output mode.
 *       If suspended, returns FALSE and sets global_state = DSTATE_PRESCAN.
 */

LOCAL(boolean)
output_pass_setup (j_decompress_ptr cinfo)
{
  if (cinfo->global_state != DSTATE_PRESCAN) {
    /* First call: do pass setup */
    (*cinfo->master->prepare_for_output_pass) (cinfo);
    cinfo->output_scanline = 0;
    cinfo->global_state = DSTATE_PRESCAN;
  }
  /* Loop over any required dummy passes */
  while (cinfo->master->is_dummy_pass) {
#ifdef QUANT_2PASS_SUPPORTED
    /* Crank through the dummy pass */
    while (cinfo->output_scanline < cinfo->output_height) {
      JDIMENSION last_scanline;
      /* Call progress monitor hook if present */
      if (cinfo->progress != NULL) {
	cinfo->progress->pass_counter = (long) cinfo->output_scanline;
	cinfo->progress->pass_limit = (long) cinfo->output_height;
	(*cinfo->progress->progress_monitor) ((j_common_ptr) cinfo);
      }
      /* Process some data */
      last_scanline = cinfo->output_scanline;
      (*cinfo->main->process_data) (cinfo, (JSAMPARRAY) NULL,
				    &cinfo->output_scanline, (JDIMENSION) 0);
      if (cinfo->output_scanline == last_scanline)
	return FALSE;		/* No progress made, must suspend */
    }
    /* Finish up dummy pass, and set up for another one */
    (*cinfo->master->finish_output_pass) (cinfo);
    (*cinfo->master->prepare_for_output_pass) (cinfo);
    cinfo->output_scanline = 0;
#else
    ERREXIT(cinfo, JERR_NOT_COMPILED);
#endif /* QUANT_2PASS_SUPPORTED */
  }
  /* Ready for application to drive output pass through
   * jpeg_read_scanlines or jpeg_read_raw_data.
   */
  cinfo->global_state = cinfo->raw_data_out ? DSTATE_RAW_OK : DSTATE_SCANNING;
  return TRUE;
}


/*
 * Read some scanlines of data from the JPEG decompressor.
 *
 * The return value will be the number of lines actually read.
 * This may be less than the number requested in several cases,
 * including bottom of image, data source suspension, and operating
 * modes that emit multiple scanlines at a time.
 *
 * Note: we warn about excess calls to jpeg_read_scanlines() since
 * this likely signals an application programmer error.  However,
 * an oversize buffer (max_lines > scanlines remaining) is not an error.
 */
static HI_U32 jpeg_soft_read_scanlines(j_decompress_ptr cinfo, 
                                                   JSAMPARRAY scanlines,
		                                           JDIMENSION max_lines)
{

		JDIMENSION row_ctr;

		if (cinfo->global_state != DSTATE_SCANNING)
		     ERREXIT1(cinfo, JERR_BAD_STATE, cinfo->global_state);
		
		if (cinfo->output_scanline >= cinfo->output_height) 
		{
		    WARNMS(cinfo, JWRN_TOO_MUCH_DATA);
		    return 0;
		}

		/* Call progress monitor hook if present */
		if (cinfo->progress != NULL) 
		{
			  cinfo->progress->pass_counter = (long) cinfo->output_scanline;
			  cinfo->progress->pass_limit = (long) cinfo->output_height;
			  (*cinfo->progress->progress_monitor) ((j_common_ptr) cinfo);
		}

		/* Process some data */
		row_ctr = 0;
		
		(*cinfo->main->process_data) (cinfo, scanlines, &row_ctr, max_lines);
		
		cinfo->output_scanline += row_ctr;
		
		return row_ctr;

}

static HI_U32 jpeg_hard_read_scanlines(j_decompress_ptr cinfo,
                                                   JSAMPARRAY scanlines,
                                                   JDIMENSION max_lines)
{
       HI_S32 row_ctr = 0;

    #ifdef CONFIG_JPEG_SOFTCSC_ENABLE
       row_ctr = JPEG_HDEC_SoftCSC(cinfo);
    #else
       row_ctr = JPEG_HDEC_HardCSC(cinfo);
       #endif
       if(HI_SUCCESS != row_ctr)
       {/**
         ** because the jpeg hard dec success,so the csc must success
         ** CNcomment:硬件解码成功，所以硬件转换也必须成功 CNend\n
         **/
          ERREXIT(cinfo, JERR_HARD_CSC_FAILURE);
       }
       if(NULL != scanlines)
       {
          row_ctr = JPEG_HDEC_OutUserBuf(cinfo, max_lines,(HI_CHAR*)scanlines[0]);
       }
       else
       {
          row_ctr = JPEG_HDEC_OutUserBuf(cinfo, max_lines,NULL);
       }
       return (HI_U32)row_ctr;

}

GLOBAL(JDIMENSION)
jpeg_read_scanlines (j_decompress_ptr cinfo, JSAMPARRAY scanlines,JDIMENSION max_lines)
{

       HI_U32 row_ctr = 0;
       JPEG_HDEC_HANDLE_S_PTR    pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)(cinfo->client_data);

       if(HI_TRUE == pJpegHandle->bHdecEnd)
       {
          row_ctr = jpeg_hard_read_scanlines(cinfo,scanlines,max_lines);
       }
       else
       {
           row_ctr = jpeg_soft_read_scanlines(cinfo,scanlines,max_lines);
       }

       return row_ctr;


}


#ifdef CONFIG_JPEG_ADD_GOOGLEFUNCTION
/*
 * Initialize the jpeg decoder to decompressing a rectangle with size of (width, height)
 * and its upper-left corner located at (start_x, start_y).
 * Align start_x and start_y to multiplies of iMCU width and height, respectively.
 * Also, the new reader position and sampled image size will be returned in
 * (start_x, start_y) and (width, height), respectively.
 */

GLOBAL(void)
jpeg_init_read_tile_scanline(j_decompress_ptr cinfo, huffman_index *index,
		     int *start_x, int *start_y, int *width, int *height)
{
	  int lines_per_iMCU_row;
	  int lines_per_iMCU_col;
      int row_offset;
	  int col_left_boundary;
	  int col_right_boundary;

#ifdef CONFIG_JPEG_SUBSET_HARD_DEC_ENABLE

      HI_JPEG_SURFACE_DESCRIPTION_S stSurfaceDesc;
      JPEG_HDEC_HANDLE_S_PTR  pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)(cinfo->client_data);
	  if(HI_TRUE == pJpegHandle->bHdecEnd)
	  {
		   memset(&stSurfaceDesc,0,sizeof(HI_JPEG_SURFACE_DESCRIPTION_S));
	       stSurfaceDesc.bCrop = HI_TRUE;
		   stSurfaceDesc.stCropRect.x = *start_x;
	       stSurfaceDesc.stCropRect.y = *start_y;
	       stSurfaceDesc.stCropRect.w = *width;
	       stSurfaceDesc.stCropRect.h = *height;
		   HI_JPEG_SetOutDesc(cinfo, &stSurfaceDesc);
	  }
	  else
#endif
	  {
	  	  // Calculates the boundary of iMCU
		  lines_per_iMCU_row = cinfo->max_v_samp_factor * DCTSIZE;
		  lines_per_iMCU_col = cinfo->max_h_samp_factor * DCTSIZE;
		  row_offset = *start_y / lines_per_iMCU_row;
		  col_left_boundary = ((*start_x / lines_per_iMCU_col)
		            / index->MCU_sample_size) * index->MCU_sample_size;
		  col_right_boundary =
		                  jdiv_round_up(*start_x + *width, lines_per_iMCU_col);

		  cinfo->coef->MCU_columns_to_skip =
		      *start_x / lines_per_iMCU_col - col_left_boundary;

		  *height = (*start_y - row_offset * lines_per_iMCU_row) + *height;
		  *start_x = col_left_boundary * lines_per_iMCU_col;
		  *start_y = row_offset * lines_per_iMCU_row;
		  cinfo->image_width = jmin(cinfo->original_image_width,
		          col_right_boundary * lines_per_iMCU_col) -
		          col_left_boundary * lines_per_iMCU_col;
		  cinfo->input_iMCU_row = row_offset;
		  cinfo->output_iMCU_row = row_offset;
		  
#ifndef CONFIG_JPEG_CODE_CUT_RGB
		  jinit_color_deconverter(cinfo);
#endif /** CONFIG_JPEG_CODE_CUT_RGB **/

		  jpeg_calc_output_dimensions(cinfo);
		  
		  jinit_upsampler(cinfo);
		  
		  (*cinfo->master->prepare_for_output_pass) (cinfo);
		  if (cinfo->progressive_mode)
		    (*cinfo->entropy->start_pass) (cinfo);
		  else
		    jpeg_decompress_per_scan_setup(cinfo);

		  int sample_size = DCTSIZE / cinfo->min_DCT_scaled_size;

		  *height = jdiv_round_up(*height, sample_size);
		  *width = cinfo->output_width;
		  cinfo->output_scanline = lines_per_iMCU_row * row_offset / sample_size;
		  cinfo->inputctl->consume_input = cinfo->coef->consume_data;
		  cinfo->inputctl->consume_input_build_huffman_index =
		      cinfo->coef->consume_data_build_huffman_index;
		  cinfo->entropy->index = index;
		  cinfo->input_iMCU_row = row_offset;
		  cinfo->output_iMCU_row = row_offset;
		  cinfo->coef->MCU_column_left_boundary = col_left_boundary;
		  cinfo->coef->MCU_column_right_boundary = col_right_boundary;
		  cinfo->coef->column_left_boundary =
		      col_left_boundary / index->MCU_sample_size;
		  cinfo->coef->column_right_boundary =
		      jdiv_round_up(col_right_boundary, index->MCU_sample_size);

	  }

}

/*
 * Read a scanline from the current position.
 *
 * Return the number of lines actually read.
 */

#ifdef CONFIG_JPEG_SUBSET_HARD_DEC_ENABLE
static HI_U32 jpeg_hard_read_tile_scanlines(j_decompress_ptr cinfo, huffman_index *index,JSAMPARRAY scanlines)
{

       HI_S32 row_ctr = 0;
	#ifdef CONFIG_JPEG_SOFTCSC_ENABLE
       row_ctr = JPEG_HDEC_SoftCSC(cinfo);
    #else
	   row_ctr = JPEG_HDEC_HardCSC(cinfo);
   	#endif
	   if(HI_SUCCESS != row_ctr)
	   {/**
		 ** because the jpeg hard dec success,so the csc must success
		 ** CNcomment:硬件解码成功，所以硬件转换也必须成功 CNend\n
		 **/
          ERREXIT(cinfo, JERR_HARD_CSC_FAILURE);
	   }
       if(NULL != scanlines)
       {
	      row_ctr = JPEG_HDEC_OutUserBuf(cinfo, 1,(HI_CHAR*)scanlines[0]);
       }
       else
       {
          row_ctr = JPEG_HDEC_OutUserBuf(cinfo,1,NULL);
       }
	   /**
	    ** 这里解码完毕有可能调用jpeg_destroy_huffman_index，而没有调用销毁解码器，所以这里要释放硬件内存
        ** 这个地方看如何做好处理
	    **/
	   if(cinfo->output_scanline == cinfo->output_height)
	   {
	   		JPEG_HDEC_CloseDev(cinfo);
	   		JPEG_HDEC_ReleaseRes(cinfo);
	   }
	   
	   return (HI_U32)row_ctr;

}
#endif

static HI_U32  jpeg_soft_read_tile_scanlines(j_decompress_ptr cinfo, huffman_index *index,JSAMPARRAY scanlines)
{

  	 // Calculates the boundary of iMCU
	  int lines_per_iMCU_row = cinfo->max_v_samp_factor * DCTSIZE;
	  //int lines_per_iMCU_col = cinfo->max_h_samp_factor * DCTSIZE;
	  int sample_size = DCTSIZE / cinfo->min_DCT_scaled_size;
	  JDIMENSION row_ctr = 0;

	  if (cinfo->progressive_mode) 
	  {
	    (*cinfo->main->process_data) (cinfo, scanlines, &row_ctr, 1);
	  } 
	  else 
	  {
	  
		    if (cinfo->output_scanline % (lines_per_iMCU_row / sample_size) == 0) 
			{
		      // Set the read head to the next iMCU row
		      int iMCU_row_offset = cinfo->output_scanline / (lines_per_iMCU_row / sample_size);
		      int offset_data_col_position = cinfo->coef->MCU_column_left_boundary / index->MCU_sample_size;
		      huffman_offset_data offset_data = index->scan[0].offset[iMCU_row_offset][offset_data_col_position];

			  (*cinfo->entropy->configure_huffman_decoder) (cinfo, offset_data);
			  
		    }
			
		    (*cinfo->main->process_data) (cinfo, scanlines, &row_ctr, 1);
		
	  }

	  cinfo->output_scanline += row_ctr;
	  
	  return row_ctr;
  
}


GLOBAL(JDIMENSION)
jpeg_read_tile_scanline (j_decompress_ptr cinfo, huffman_index *index,JSAMPARRAY scanlines)
{
	HI_U32 row_ctr = 0;
	
#ifdef CONFIG_JPEG_SUBSET_HARD_DEC_ENABLE

	JPEG_HDEC_HANDLE_S_PTR	 pJpegHandle = (JPEG_HDEC_HANDLE_S_PTR)(cinfo->client_data);

	if(HI_TRUE == pJpegHandle->bHdecEnd)
	{
	   row_ctr = jpeg_hard_read_tile_scanlines(cinfo,index,scanlines);
	}
	else
#endif
	{
		row_ctr = jpeg_soft_read_tile_scanlines(cinfo,index,scanlines);
	}

	return row_ctr;
}

#endif /** CONFIG_JPEG_ADD_GOOGLEFUNCTION **/


/*
 * Alternate entry point to read raw data.
 * Processes exactly one iMCU row per call, unless suspended.
 */

GLOBAL(JDIMENSION)
jpeg_read_raw_data (j_decompress_ptr cinfo, JSAMPIMAGE data,
		    JDIMENSION max_lines)
{
  JDIMENSION lines_per_iMCU_row;

  if (cinfo->global_state != DSTATE_RAW_OK)
    ERREXIT1(cinfo, JERR_BAD_STATE, cinfo->global_state);
  if (cinfo->output_scanline >= cinfo->output_height) {
    WARNMS(cinfo, JWRN_TOO_MUCH_DATA);
    return 0;
  }

  /* Call progress monitor hook if present */
  if (cinfo->progress != NULL) {
    cinfo->progress->pass_counter = (long) cinfo->output_scanline;
    cinfo->progress->pass_limit = (long) cinfo->output_height;
    (*cinfo->progress->progress_monitor) ((j_common_ptr) cinfo);
  }

  /* Verify that at least one iMCU row can be returned. */
  lines_per_iMCU_row = cinfo->max_v_samp_factor * cinfo->min_DCT_scaled_size;
  if (max_lines < lines_per_iMCU_row)
    ERREXIT(cinfo, JERR_BUFFER_SIZE);

  /* Decompress directly into user's buffer. */
  if (! (*cinfo->coef->decompress_data) (cinfo, data))
    return 0;			/* suspension forced, can do nothing more */

  /* OK, we processed one iMCU row. */
  cinfo->output_scanline += lines_per_iMCU_row;
  return lines_per_iMCU_row;
}


/* Additional entry points for buffered-image mode. */

#ifdef D_MULTISCAN_FILES_SUPPORTED

/*
 * Initialize for an output pass in buffered-image mode.
 */

GLOBAL(boolean)
jpeg_start_output (j_decompress_ptr cinfo, int scan_number)
{
  if (cinfo->global_state != DSTATE_BUFIMAGE &&
      cinfo->global_state != DSTATE_PRESCAN)
    ERREXIT1(cinfo, JERR_BAD_STATE, cinfo->global_state);
  /* Limit scan number to valid range */
  if (scan_number <= 0)
    scan_number = 1;
  if (cinfo->inputctl->eoi_reached &&
      scan_number > cinfo->input_scan_number)
    scan_number = cinfo->input_scan_number;
  cinfo->output_scan_number = scan_number;
  /* Perform any dummy output passes, and set up for the real pass */
  return output_pass_setup(cinfo);
}


/*
 * Finish up after an output pass in buffered-image mode.
 *
 * Returns FALSE if suspended.  The return value need be inspected only if
 * a suspending data source is used.
 */

GLOBAL(boolean)
jpeg_finish_output (j_decompress_ptr cinfo)
{
  if ((cinfo->global_state == DSTATE_SCANNING ||
       cinfo->global_state == DSTATE_RAW_OK) && cinfo->buffered_image) {
    /* Terminate this pass. */
    /* We do not require the whole pass to have been completed. */
    (*cinfo->master->finish_output_pass) (cinfo);
    cinfo->global_state = DSTATE_BUFPOST;
  } else if (cinfo->global_state != DSTATE_BUFPOST) {
    /* BUFPOST = repeat call after a suspension, anything else is error */
    ERREXIT1(cinfo, JERR_BAD_STATE, cinfo->global_state);
  }
  /* Read markers looking for SOS or EOI */
  while (cinfo->input_scan_number <= cinfo->output_scan_number &&
	 ! cinfo->inputctl->eoi_reached) {
    if ((*cinfo->inputctl->consume_input) (cinfo) == JPEG_SUSPENDED)
      return FALSE;		/* Suspend, come back later */
  }
  cinfo->global_state = DSTATE_BUFIMAGE;
  return TRUE;
}

#endif /* D_MULTISCAN_FILES_SUPPORTED */

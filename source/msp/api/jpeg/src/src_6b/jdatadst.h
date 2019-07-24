/******************************************************************************
*
* Copyright (C) 2014 Hisilicon Technologies Co., Ltd.  All rights reserved. 
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon), 
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name	    : jdatadst.h
Version		    : Initial Draft
Author		    : 
Created		    : 2014/05/15
Description	    : 
Function List 	: 

			  		  
History       	:
Date				Author        		Modification
2013/06/20		    y00181162  		    Created file      	
******************************************************************************/
#ifndef __JDATADST_H__
#define __JDATADST_H__


/*********************************add include here******************************/

#include "jinclude.h"

/*****************************************************************************/


#ifdef __cplusplus
      #if __cplusplus
   
extern "C" 
{

      #endif
#endif /* __cplusplus */

    /***************************** Macro Definition ******************************/

    #define OUTPUT_BUF_SIZE  4096	/* choose an efficiently fwrite'able size */

    /*************************** Structure Definition ****************************/

	typedef struct 
	{
		struct jpeg_destination_mgr pub; /* public fields */

		FILE * outfile;		    /* target stream */
		JOCTET * buffer;		/* start of buffer */
	} my_destination_mgr;

	typedef my_destination_mgr * my_dest_ptr;


    /***************************  The enum of Jpeg image format  ******************/


    /********************** Global Variable declaration **************************/

   

    /******************************* API declaration *****************************/


    #ifdef __cplusplus
    
        #if __cplusplus


      
}
      
        #endif
        
   #endif /* __cplusplus */

#endif /* __JDATADST_H__*/

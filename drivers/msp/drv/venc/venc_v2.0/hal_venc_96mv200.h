#ifndef __HAL_VENC_H__
#define __HAL_VENC_H__

#include "hi_type.h"
#include "drv_venc_ratecontrol.h"
#include "drv_venc_reg_96mv200.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif

#define VEDU_REG_BASE_ADDR 0xf8c80000
#define VEDU_IRQ_ID 133 /* 101+32 */

#ifdef HI_SMMU_SUPPORT
#define VEDU_SMMU_NS_IRQ_ID    133    /*101 + 32*/
#define VEDU_SMMU_S_IRQ_ID     133   /* 99 + 32*/
#endif

enum
{
	VEDU_H264	= 0,
	VEDU_JPGE   = 1,
	VEDU_H263	= 2,
	VEDU_MPEG4  = 3,
	VEDU_H265	= 4,
};

typedef struct
{
	HI_U8* pu8StartVirAddr;    /*VirAddr*/
	HI_U32 u32StartPhyAddr;    /*PhyAddr or SmmuAddr*/
	HI_U32 u32Size;
} VENC_BUFFER_S;

typedef struct
{
    HI_U32   Enable [8];    /* only used at H264  */
    HI_U32   AbsQpEn[8];
    HI_S32   Qp     [8];    /* -26 ~ 25 or 0 ~ 51 */
    HI_U32   Width  [8];    /* size in MB */
    HI_U32   Height [8];    /* size in MB */
    HI_U32   StartX [8];    /* size in MB */
    HI_U32   StartY [8];    /* size in MB */
    HI_U32   Keep   [8];

} VeduEfl_RoiAttr_S;
#if 0
typedef struct
{
  HI_U32 cu_qp_delta_thresh[16];   
  HI_U32 qp_delta_level[16];
  HI_U32 qp_madi_switch_thr;

  HI_U32 large_move_qp_delta;
  HI_U32 strong_edge_qp_delta; 
  HI_U32 strong_edge_move_qp_delta;
  //HI_U32 low_luma_qp_delta;
  HI_U32 skin_qp_delta;
  HI_U32 intra_det_qp_delta;
  
  HI_U32 large_move_max_qp ;   
  HI_U32 strong_edge_max_qp ;
  HI_U32 move_edge_max_qp;
  HI_U32 skin_max_qp   ;
  HI_U32 intra_det_max_qp;
  HI_U32 lowluma_max_qp;


  HI_U32  h264_smooth_qp_delta ;
  HI_U32  h264_smooth_qp_delta1 ; 
  HI_U32  h264_smooth_max_qp ;
  HI_U32  cu32_delta_low; 
  HI_U32  cu32_delta_high; 
  
  HI_U32 qp_delta;   
  HI_U32 lambda[80];
  
  HI_U32 qp_restrain_madi_thr ;
  HI_U32 qp_restrain_mode ;
  HI_U32 qp_restrain_en ;
  HI_U32 qp_restrain_delta_blk32 ; 
  HI_U32 lambda_qp_offset;
  
  HI_U32 low_min_sad_en;
  HI_U32 high_min_sad_en;
  
  HI_U32 rc_h264_smooth_mb_en ;
  HI_U32 rc_low_luma_en ;
  HI_U32 rc_cu_qp_en;
  HI_U32 rc_row_qp_en;
  
  HI_U32 rc_cu_madi_en;
  HI_U32 rc_qp_restrain_en;
  HI_U32 move_scene_en;
  HI_U32 move_sad_en;
  HI_U32 vcpi_bfg_roi_qp_en;
  HI_U32 strong_edge_move_en; 
  HI_U32 intra_det_qp_en;
    
  HI_U32 min_sad_thresh_low;
  HI_U32 min_sad_thresh_high;

  HI_U32 min_sad_level;
  HI_U32 low_min_sad_mode;
  HI_U32 high_min_sad_mode;
  HI_U32 qp_restrain_delta_blk16;
  HI_U32 min_sad_madi_en;
  HI_U32 min_sad_qp_restrain_en;
  HI_U32 rdo_lambda_choose_mode;
  HI_U32 lambda_inter_stredge_en;

  HI_U32 rd_smooth_mb_en;
  HI_U32 rd_min_sad_flag_en;
  HI_U32 wr_min_sad_flag_en;
  HI_U32  prev_min_sad_en;
  HI_U32  qp_detlta_size_cu64;
  HI_U32  smart_get_cu64_qp_mode;
  HI_U32  smart_get_cu32_qp_mode;
  HI_U32  smart_cu_level_qp_mode;
  HI_U32  rc_smart_abs_qp_mode;
  HI_U32  skin_min_qp;
  HI_U32  stredge_move_min_qp;
  HI_U32  intra_det_min_qp;
  HI_U32  large_move_min_qp;
  HI_U32  stredge_min_qp;
  HI_U32  lowluma_min_qp;
  HI_U32  smooth_min_qp;
  HI_U32  row_target_bits;

}VeduEfl_QpgAttr_S;

typedef struct
{
  HI_U32 l0_psw_adapt_en;

  HI_U32 l0_psw_thr0;
  HI_U32 l0_psw_thr1;
  HI_U32 l0_psw_thr2;

  HI_U32 tr_weightx_2;   
  HI_U32 tr_weightx_1;   
  HI_U32 tr_weightx_0;   
  HI_U32 tr_weighty_2;   
  HI_U32 tr_weighty_1;   
  HI_U32 tr_weighty_0;   
  HI_U32 sr_weight_2;    
  HI_U32 sr_weight_1;    
  HI_U32 sr_weight_0;

  HI_U32 skin_num;  
  HI_U32 skin_v_min_thr; 
  HI_U32 skin_v_max_thr;
  HI_U32 skin_u_min_thr; 
  HI_U32 skin_u_max_thr;

  HI_U32 pme_intra16_madi_thr;
  HI_U32 pme_intra32_madi_thr;
  
  HI_U32 pme_intra_lowpow_en;
  HI_U32 pme_iblk_pre_cost_thr_h264;
  HI_U32 pme_intrablk_det_cost_thr1;
  HI_U32 still_scene_thr;   
  HI_U32 high_edge_cnt;   
  HI_U32 high_edge_thr;   
 
  HI_U32 move_sad_thr ;
  HI_U32 move_scene_thr ;
  HI_U32 interstrongedge_madi_thr ;
  HI_U32 interdiff_max_min_madi_times ;
  HI_U32 interdiff_max_min_madi_abs ;
  HI_U32 cost_lamda_en ;
  HI_U32 mvp3median_en ;
  HI_U32 new_cost_en;   
  HI_U32 cost_lamda1 ;
  HI_U32 cost_lamda0 ;

  HI_U32 l0_win0_width;
  HI_U32 l0_win0_height;
  HI_U32 l0_win1_width;
  HI_U32 l0_win1_height;
  HI_U32 l0_win2_width;
  HI_U32 l0_win2_height;
  HI_U32 l0_win3_width;
  HI_U32 l0_win3_height;

  HI_U32 l0_cost_offset ;
  HI_U32 pme_intrablk_det_cost_thr0   ;
  HI_U32 pme_intrablk_det_mvx_thr     ;
  HI_U32 pme_intrablk_det_mvy_thr     ;
  HI_U32 pme_intrablk_det_mv_dif_thr0 ;
  HI_U32 pme_intrablk_det_mv_dif_thr1 ;

  HI_U32 pme_safe_line;
  HI_U32 pme_safe_line_val;

  HI_U32 pme_iblk_refresh_start_num;
  HI_U32 pme_iblk_refresh_num;
  HI_U32 pme_high_luma_thr;
  HI_U32 smooth_madi_thr;
  HI_U32 pme_inter_first;
  HI_U32 low_luma_thr     ;
  HI_U32 low_luma_madi_thr  ;
  HI_U32 madi_dif_thr      ;
  HI_U32 cur_madi_dif_thr  ;
  HI_U32 min_sad_thr_gain  ;
  HI_U32 min_sad_thr_offset;

}VeduEfl_PmeAttr_S;

typedef struct
{
    HI_U32 img_improve_en;
    HI_U32 static_en;
    HI_U32 highedge_en;
    HI_U32 skin_en;

    HI_U32 norm32_tr1_denois_max_num;
    HI_U32 norm32_coeff_protect_num;
    HI_U32 norm16_tr1_denois_max_num;
    HI_U32 norm16_coeff_protect_num;
    HI_U32 skin32_tr1_denois_max_num;
    HI_U32 skin32_coeff_protect_num;
    HI_U32 skin16_tr1_denois_max_num;
    HI_U32 skin16_coeff_protect_num;
    HI_U32 static32_tr1_denois_max_num;
    HI_U32 static32_coeff_protect_num;
    HI_U32 static16_tr1_denois_max_num;
    HI_U32 static16_coeff_protect_num;
    HI_U32 hedge32_tr1_denois_max_num;
    HI_U32 hedge32_coeff_protect_num;
    HI_U32 hedge16_tr1_denois_max_num;
    HI_U32 hedge16_coeff_protect_num;

    HI_U32 norm_intra_cu32_rdcost_offset;
    HI_U32 norm_intra_cu16_rdcost_offset;
    HI_U32 norm_intra_cu8_rdcost_offset;
    HI_U32 norm_intra_cu4_rdcost_offset;

    HI_U32 strmov_intra_cu32_rdcost_offset;
    HI_U32 strmov_intra_cu16_rdcost_offset;
    HI_U32 strmov_intra_cu8_rdcost_offset;
    HI_U32 strmov_intra_cu4_rdcost_offset;

    HI_U32 norm_mrg_cu64_rdcost_offset;
    HI_U32 norm_mrg_cu32_rdcost_offset;
    HI_U32 norm_mrg_cu16_rdcost_offset;
    HI_U32 norm_mrg_cu8_rdcost_offset;
    HI_U32 strmov_mrg_cu64_rdcost_offset;
    HI_U32 strmov_mrg_cu32_rdcost_offset;
    HI_U32 strmov_mrg_cu16_rdcost_offset;
    HI_U32 strmov_mrg_cu8_rdcost_offset;


    HI_U32 norm_fme_cu64_rdcost_offset;
    HI_U32 norm_fme_cu32_rdcost_offset;
    HI_U32 norm_fme_cu16_rdcost_offset;
    HI_U32 norm_fme_cu8_rdcost_offset;
    HI_U32 strmov_fme_cu64_rdcost_offset;
    HI_U32 strmov_fme_cu32_rdcost_offset;
    HI_U32 strmov_fme_cu16_rdcost_offset;
    HI_U32 strmov_fme_cu8_rdcost_offset;

    HI_U32 skin_intra_cu32_rdcost_offset;
    HI_U32 skin_intra_cu16_rdcost_offset;
    HI_U32 skin_intra_cu8_rdcost_offset ;
    HI_U32 skin_intra_cu4_rdcost_offset ;
    HI_U32 sobel_str_intra_cu32_rdcost_offset;
    HI_U32 sobel_str_intra_cu16_rdcost_offset;
    HI_U32 sobel_str_intra_cu8_rdcost_offset ;
    HI_U32 sobel_str_intra_cu4_rdcost_offset ;

    HI_U32 skin_mrg_cu64_rdcost_offset;
    HI_U32 skin_mrg_cu32_rdcost_offset;
    HI_U32 skin_mrg_cu16_rdcost_offset;
    HI_U32 skin_mrg_cu8_rdcost_offset ;
    HI_U32 sobel_str_mrg_cu64_rdcost_offset;
    HI_U32 sobel_str_mrg_cu32_rdcost_offset;
    HI_U32 sobel_str_mrg_cu16_rdcost_offset;
    HI_U32 sobel_str_mrg_cu8_rdcost_offset ;

    HI_U32 skin_fme_cu64_rdcost_offset;
    HI_U32 skin_fme_cu32_rdcost_offset;
    HI_U32 skin_fme_cu16_rdcost_offset;
    HI_U32 skin_fme_cu8_rdcost_offset ;
    HI_U32 sobel_str_fme_cu64_rdcost_offset;
    HI_U32 sobel_str_fme_cu32_rdcost_offset;
    HI_U32 sobel_str_fme_cu16_rdcost_offset;
    HI_U32 sobel_str_fme_cu8_rdcost_offset ;

    HI_U32 hedge_intra_cu32_rdcost_offset; 
    HI_U32 hedge_intra_cu16_rdcost_offset; 
    HI_U32 hedge_intra_cu8_rdcost_offset;   
    HI_U32 hedge_intra_cu4_rdcost_offset; 
    HI_U32 sobel_tex_intra_cu32_rdcost_offset; 
    HI_U32 sobel_tex_intra_cu16_rdcost_offset; 
    HI_U32 sobel_tex_intra_cu8_rdcost_offset;   
    HI_U32 sobel_tex_intra_cu4_rdcost_offset;  

    HI_U32 hedge_mrg_cu64_rdcost_offset;  
    HI_U32 hedge_mrg_cu32_rdcost_offset;  
    HI_U32 hedge_mrg_cu16_rdcost_offset;  
    HI_U32 hedge_mrg_cu8_rdcost_offset;    
    HI_U32 sobel_tex_mrg_cu64_rdcost_offset;  
    HI_U32 sobel_tex_mrg_cu32_rdcost_offset;  
    HI_U32 sobel_tex_mrg_cu16_rdcost_offset;  
    HI_U32 sobel_tex_mrg_cu8_rdcost_offset;  

    HI_U32 hedge_fme_cu64_rdcost_offset;  
    HI_U32 hedge_fme_cu32_rdcost_offset;  
    HI_U32 hedge_fme_cu16_rdcost_offset;  
    HI_U32 hedge_fme_cu8_rdcost_offset;
    HI_U32 sobel_tex_fme_cu64_rdcost_offset;  
    HI_U32 sobel_tex_fme_cu32_rdcost_offset;  
    HI_U32 sobel_tex_fme_cu16_rdcost_offset;  
    HI_U32 sobel_tex_fme_cu8_rdcost_offset;   

    HI_U32 roundingedgemovmechanism;
    HI_U32 roundingedgemovdegreethresh;
    HI_U32 roundingedgemovforcezeroresidthresh;
    HI_U32 roundingedgemovac32sum;
    HI_U32 roundingedgemovac16sum;
    HI_U32 roundingedgemovlowfreqacblk32;
    HI_U32 roundingedgemovlowfreqacblk16;
    HI_U32 roundingsobelstrmechanism;
    HI_U32 roundingsobelstrdegreethresh ;
    HI_U32 roundingsobelstrforcezeroresidthresh;
    HI_U32 roundingsobelstrac32sum;
    HI_U32 roundingsobelstrac16sum;
    HI_U32 roundingsobelstrlowfreqacblk32;
    HI_U32 roundingsobelstrlowfreqacblk16;
    HI_U32 roundingsobelweakmechanism;
    HI_U32 roundingsobelweakdegreethresh;
    HI_U32 roundingsobelweakforcezeroresidthresh;
    HI_U32 roundingsobelweakac32sum;
    HI_U32 roundingsobelweakac16sum;
    HI_U32 roundingsobelweaklowfreqacblk32;
    HI_U32 roundingsobelweaklowfreqacblk16;

    HI_U32 roundingoffset16x16;
    HI_U32 roundingoffset32x32;
    HI_U32 roundingskinoffset16x16;
    HI_U32 roundingskinoffset32x32;
    HI_U32 roundingstilloffset16x16;
    HI_U32 roundingstilloffset32x32;
    HI_U32 roundingedgeoffset16x16;
    HI_U32 roundingedgeoffset32x32;
    HI_U32 roundingedgemovoffset16x16;
    HI_U32 roundingedgemovoffset32x32;
    HI_U32 roundingsobelstroffset16x16;
    HI_U32 roundingsobelstroffset32x32;
    HI_U32 roundingsobelweakoffset16x16;
    HI_U32 roundingsobelweakoffset32x32;
    HI_U32 edgemov32_coeff_protect_num;
    HI_U32 edgemov32_tr1_denois_max_num;
    HI_U32 edgemov16_coeff_protect_num;
    HI_U32 edgemov16_tr1_denois_max_num;
    HI_U32 sobelstr32_coeff_protect_num;
    HI_U32 sobelstr32_tr1_denois_max_num;
    HI_U32 sobelstr16_coeff_protect_num;
    HI_U32 sobelstr16_tr1_denois_max_num;
    HI_U32 sobelweak32_coeff_protect_num;
    HI_U32 sobelweak32_tr1_denois_max_num;
    HI_U32 sobelweak16_coeff_protect_num;
    HI_U32 sobelweak16_tr1_denois_max_num;

    HI_U32 norm_isolate_ac_enable;
    HI_U32 norm_force_zero_cnt;
    HI_U32 norm_engsum_32;
    HI_U32 norm_engcnt_32;
    HI_U32 norm_engsum_16;
    HI_U32 norm_engcnt_16;
    HI_U32 skin_isolate_ac_enable;
    HI_U32 skin_force_zero_cnt;
    HI_U32 skin_engsum_32;
    HI_U32 skin_engcnt_32;
    HI_U32 skin_engsum_16;
    HI_U32 skin_engcnt_16;
    HI_U32 still_isolate_ac_enable;
    HI_U32 still_force_zero_cnt;
    HI_U32 still_engsum_32;
    HI_U32 still_engcnt_32;
    HI_U32 still_engsum_16;
    HI_U32 still_engcnt_16;
    HI_U32 stredge_isolate_ac_enable ;
    HI_U32 stredge_force_zero_cnt;
    HI_U32 stredge_engsum_32;
    HI_U32 stredge_engcnt_32;
    HI_U32 stredge_engsum_16;
    HI_U32 stredge_engcnt_16;
    HI_U32 edgemov_isolate_ac_enable;
    HI_U32 edgemov_force_zero_cnt;
    HI_U32 edgemov_engsum_32;
    HI_U32 edgemov_engcnt_32;
    HI_U32 edgemov_engsum_16;
    HI_U32 edgemov_engcnt_16;
    HI_U32 sobelstr_isolate_ac_enable;
    HI_U32 sobelstr_force_zero_cnt;
    HI_U32 sobelstr_engsum_32;
    HI_U32 sobelstr_engcnt_32;
    HI_U32 sobelstr_engsum_16;
    HI_U32 sobelstr_engcnt_16;
    HI_U32 sobelwk_isolate_ac_enable;
    HI_U32 sobelwk_force_zero_cnt;
    HI_U32 sobelwk_engsum_32;
    HI_U32 sobelwk_engcnt_32;
    HI_U32 sobelwk_engsum_16;
    HI_U32 sobelwk_engcnt_16;

    HI_U32  roundingMechanism   ;
    HI_U32  roundingDegreeThresh;
    HI_U32  roundingForceZeroResidThresh;
    HI_U32  roundingAC32sum;
    HI_U32  roundingAC16sum ;
    HI_U32  roundingLowFreqACBlk32;
    HI_U32  roundingLowFreqACBlk16;

    HI_U32  roundingSkinMechanism;
    HI_U32  roundingSkinDegreeThresh;
    HI_U32  roundingSkinForceZeroResidThresh;
    HI_U32  roundingSkinAC32sum;
    HI_U32  roundingSkinAC16sum;
    HI_U32  roundingSkinLowFreqACBlk32;
    HI_U32  roundingSkinLowFreqACBlk16;

    HI_U32  roundingStillMechanism;
    HI_U32  roundingStillDegreeThresh;
    HI_U32  roundingStillForceZeroResidThresh;
    HI_U32  roundingStillAC32sum;
    HI_U32  roundingStillAC16sum;
    HI_U32  roundingStillLowFreqACBlk32;
    HI_U32  roundingStillLowFreqACBlk16;

    HI_U32  roundingEdgeMechanism;
    HI_U32  roundingEdgeDegreeThresh;
    HI_U32  roundingEdgeForceZeroResidThresh;
    HI_U32  roundingEdgeAC32sum;
    HI_U32  roundingEdgeAC16sum;
    HI_U32  roundingEdgeLowFreqACBlk32;
    HI_U32  roundingEdgeLowFreqACBlk16;

    HI_U32 norm_sel_cu8_rd_offset;
    HI_U32 skin_sel_cu8_rd_offset;
    HI_U32 hedge_sel_cu8_rd_offset;
    HI_U32 strmov_sel_cu8_rd_offset;
    HI_U32 sobelstr_sel_cu8_rd_offset;
    HI_U32 sobeltex_sel_cu8_rd_offset;

    HI_U32 skin_inter_cu_rdcost_offset;
    HI_U32 hedge_inter_cu_rdcost_offset;
    HI_U32 skin_layer_rdcost_offset;

    HI_U32 sobelstr_inter_cu_rdcost_offset;
    HI_U32 sobeltex_inter_cu_rdcost_offset;
    HI_U32 hedge_layer_rdcost_offset;

    HI_U32 strmov_inter_cu_rdcost_offset;
    HI_U32 norm_inter_cu_rdcost_offset;
    HI_U32 strmov_layer_rdcost_offset;

    HI_U32 sobelstr_layer_rdcost_offset;
    HI_U32 sobeltex_layer_rdcost_offset;
    HI_U32 norm_layer_rdcost_offset;

    HI_U32 sel_intra4_8_abs_offset;
    HI_U32 sel_intra16_abs_offset;
    HI_U32 sel_inter8_16_abs_offset;
    HI_U32 sel_inter32_abs_offset;
    HI_U32 sel_layer32_abs_offset;

} VeduEfl_ImgImproveAttr_S;

typedef struct
{
    HI_U32 vcpi_ipcm_en;
    HI_U32 vcpi_intra_cu_en;
    HI_U32 vcpi_trans_mode;
    HI_U32 vcpi_entropy_mode;

    HI_U32 vcpi_sao_chroma;
    HI_U32 vcpi_sao_luma;

    HI_U32 max_num_mergecand;    
    HI_U32 tmv_en; 

    HI_U32 pmv_poc[6];

}VeduEfl_BaseAttr_S;
#endif

typedef struct
{
    HI_U32 enable_cfg_err;
    HI_U32 enable_vedu_timeout;
    HI_U32 enable_vedu_step;
    HI_U32 enable_vedu_brkpt;
    HI_U32 enable_vedu_slice_end;
    HI_U32 enable_ve_pbitsover;
    HI_U32 enable_ve_buffull;
    HI_U32 enable_ve_eop;

    HI_U32 lcu_target_bit;
    HI_U32 vcpi_dbgmod;
    HI_U32 vcpi_bkp_en;
    HI_U32 vcpi_time_en;
    HI_U32 vedu_timeout;
    HI_U32 vcpi_refc_nload;
    HI_U32 vcpi_cfg_mode;
    HI_U32 vcpi_lcu_time_sel;
    HI_U32 vcpi_vedsel;
    HI_U32 vcpi_slice_int_en;

    HI_U32 vcpi_cnt_clr;
    HI_U32 vcpi_frame_no;
    HI_U32 IntraPeriod;
    HI_U32 vcpi_bp_lcu_y;
    HI_U32 vcpi_bp_lcu_x;
    HI_U32 vcpi_cb_qp_offset;
    HI_U32 vcpi_cr_qp_offset;
    HI_U32 vcpi_frm_qp;
    HI_U32 max_qp;
    HI_U32  cu_qp_delta_enable_flag;
    HI_U32 min_qp;
    HI_U32 vcpi_crop_en       ;
    HI_U32 vcpi_scale_en           ;
    HI_U32 vcpi_crop_xstart                ;
    HI_U32 vcpi_crop_ystart                ;
    HI_U32 vcpi_crop_xend                ;
    HI_U32 vcpi_crop_yend      ;
    HI_U32 vcpi_xscale              ;
    HI_U32 vcpi_yscale                 ;
    HI_U32 vcpi_oriwidth_pix           ;
    HI_U32 vcpi_oriheight_pix      ;
    HI_U32 vcpi_blk_type;
    HI_U32 vcpi_store_mode;
    HI_U32 vcpi_byte_stuffing;
    HI_U32 vcpi_num_refidx;
    HI_U32 vcpi_cabac_init_idc;
    HI_U32 vcpi_ref_idc;
    HI_U32 vcpi_w_outstanding;
    HI_U32 vcpi_r_outstanding;
    HI_U32 vcpi_protocol;
    HI_U32 frame_type;
    HI_U32 vcpi_imgheight_pix;
    HI_U32 vcpi_imgwidth_pix;
    HI_U32 vcpi_package_sel;
    HI_U32 vcpi_str_fmt;

    HI_U32 vcpi_mrg_cu_en;
    HI_U32 vcpi_fme_cu_en;
    HI_U32 vcpi_force_inter;
    HI_U32 vcpi_pintra_inter_flag_disable;
    HI_U32 vcpi_ipcm_en;
    HI_U32 vcpi_intra_cu_en;
    HI_U32 vcpi_intra_h264_cutdiag;
    HI_U32 vcpi_inter8x8_en;  //H264
    HI_U32 vcpi_rec_cmp_en;
    HI_U32 vcpi_high_speed_en;
    HI_U32 vcpi_lcu_size;
    HI_U32 vcpi_trans_mode;
    HI_U32 vcpi_blk8_inter;
    HI_U32 vcpi_sobel_weight_en;
    HI_U32 vcpi_pskp_en;
    HI_U32 vcpi_tiles_en;
    HI_U32 vcpi_ref1_cmp_en;
    HI_U32 vcpi_ref0_cmp_en;
    HI_U32 vcpi_idr_pic;
    HI_U32 vcpi_entropy_mode;
    HI_U32 vcpi_multislc_en;
    HI_U32 vcpi_slcspilt_mod;
    HI_U32 vcpi_slice_size;
    HI_U32 vcpi_dblk_filter_flag;
    HI_S32 vcpi_dblk_alpha;
    HI_S32 vcpi_dblk_beta;
    HI_U32 vcpi_sao_chroma;
    HI_U32 vcpi_sao_luma;
    HI_U32 vcpi_tmv_wr_rd_avail;
    HI_U32 vcpi_cross_tile;
    HI_U32 vcpi_cross_slice;
    HI_U32 vcpi_rft_emasa;
    HI_U32 vcpi_rft_emaa;
    HI_U32 vcpi_rft_emab;
    HI_U32 vcpi_rfs_ema;
    HI_U32 vcpi_rfs_emaw;
    HI_U32 vcpi_ras_ema;
    HI_U32 vcpi_ras_emaw;

    HI_U32 inter_avail;
    HI_U32 intra_smooth;
    //dc shift
    HI_U32 intra_dc_shift_en;
    HI_U32 intra_dc_16mode_en;
    HI_U32 intra_dc_8mode_en;
    HI_U32 intra_dc_4mode_en;
    HI_U32 intra_dc_16shift;
    HI_U32 intra_dc_8shift;
    HI_U32 intra_dc_4shift;

    HI_U32 intra_bit_weight;
    HI_U32 intra_dc_16madi;
    HI_U32 intra_dc_8madi;
    HI_U32 intra_dc_4madi;

    //  HI_U32 bCUQpDeltaEnable;
    HI_U32 intra_cu4_rdo_cost_offset                	;
    HI_U32 intra_cu8_rdo_cost_offset                ;
    HI_U32 intra_cu16_non_dc_mode_offset           ;
    HI_U32 intra_cu32_non_dc_mode_offset            ;
    HI_U32 intra_cu4_non_dc_mode_offset             ;
    HI_U32  intra_cu8_non_dc_mode_offset           ;

    HI_U32 intra_cu4_mode0_31_en;
    HI_U32 intra_cu4_mode32_34_en;
    HI_U32 intra_cu8_mode0_31_en;
    HI_U32 intra_cu8_mode32_34_en;
    HI_U32 intra_cu16_mode0_31_en;
    HI_U32 intra_cu16_mode32_34_en;
    HI_U32 intra_cu32_mode0_31_en;
    HI_U32 intra_cu32_mode32_34_en;
    HI_U32 h264chroma_mode0_en;
    HI_U32 h264chroma_mode1_en;
    HI_U32 h264chroma_mode2_en;
    HI_U32 h264chroma_mode3_en;

    HI_U32 vcpi_tile_height;
    HI_U32 vcpi_tile_width;
    HI_U32 vcpi_pblk_pre_en;
    HI_U32 vcpi_iblk_pre_en;
    HI_U32 vcpi_pblk_pre_cost_thr;
    HI_U32 vcpi_iblk_pre_cost_thr;
    HI_U32 vcpi_iblk_pre_mvy_thr;
    HI_U32 vcpi_iblk_pre_mvx_thr;
    HI_U32 vcpi_iblk_pre_mv_dif_thr1;
    HI_U32 vcpi_iblk_pre_mv_dif_thr0;

    HI_U32 vcpi_ext_edge_en;
    HI_U32 vcpi_skin_close_angle;
    HI_U32  vcpi_rounding_sobel_en;
    HI_U32 vcpi_sw_l0_height;
    HI_U32 vcpi_sw_l0_width;

    HI_U32 narrow_tile_width;
    HI_U32 lcu_performance_baseline;
    HI_U32 flat_region_force_low3layer;
    HI_U32  vcpi_long_term_refpic ;
    HI_U32  vcpi_ref_num          ;
    HI_U32 num_ref_idx_l0_active_minus1;
    HI_U32 num_ref_idx_l1_active_minus1;
    HI_U32 short_term_ref_pic_set_idx;
    HI_U32 num_short_term_ref_pic_sets;

    HI_U32 refld_vcpi2cont_title_en;
    HI_U32 refld_posx_limit;
    HI_U32 refld_res_thr;
    HI_U32  refld_col2gray_en;

    HI_U32	ime_no_intra_ang_en;
    HI_U32  ime_no_intra_ang_cost_thr;
    HI_U32 ime_no_intra_ang_mvx_thr;
    HI_U32 ime_no_intra_ang_mvy_thr;
    HI_U32 vcpi_lambdaoff16;
    HI_U32 vcpi_lambdaoff8;
    HI_U32	mrg_force_v_zero_en;
    HI_U32	mrg_force_u_zero_en;
    HI_U32	mrg_force_y_zero_en;
    HI_U32	mrg_force_zero_en;
    HI_U32  mrg_force_skip_en;
    HI_U32 pack_sybtax_config;
    HI_U32 vcpi2cu_qp_min_cu_size;
    HI_U32 vcpi2cu_tq_bypass_enabled_flag;
    HI_U32 vcpi2pu_log2_max_ipcm_cbsizey;
    HI_U32 vcpi2pu_log2_min_ipcm_cbsizey;
    HI_U32 vcpi2res_tf_skip_enabled_flag;
    HI_U32  byte_stuff_en;

    HI_U32 max_num_mergecand;
    HI_U32 cabac_max_num_mergecand              ;
    HI_U32 cabac_nal_unit_head                      	;
    HI_U32 cabac_slchdr_size_part1                  ;
    HI_U32 cabac_slchdr_size_part2                  ;
    HI_U32 cabac_slchdr_part1                       	;
    HI_U32 cabac_slchdr_size_part1_i                ;
    HI_U32 cabac_slchdr_size_part2_i                ;
    HI_U32 cabac_slchdr_part1_i                       ;
    HI_U32 vlc_markingbit                           	;
    HI_U32 vlc_reorderbit                           	;
    HI_U32 vlc_parabit                              	;
    HI_U32 vlc_svc_en                               	;
    HI_U32 vlc_svc_strm                             	;
    HI_U32 vlc_markingbit_i                         	;
    HI_U32 vlc_reorderbit_i                         	;
    HI_U32 vlc_parabit_i                            	;

    HI_U32 tmv_en;
    HI_U32 force_zero_en    ;
    HI_U32 force_v_zero_en  ;
    HI_U32 force_u_zero_en   ;
    HI_U32 force_y_zero_en     ;
    HI_U32 force_skip_en;
    HI_U32 recst_disable    ;
    HI_U32  pmv_poc[6];
    HI_U32 vcpi_svc_strm;
    HI_U32 vcpi_svc_en;
    HI_U32  MaxDecPicBufferM1;
    HI_U32  MaxNumReorderPics;

    HI_U32 curld_col2gray_en;
    HI_U32 curld_clip_en;
    HI_U32    curld_read_interval;
    HI_U32    curld_lowdly_en;
    HI_U32 clip_chrm_max;
    HI_U32 clip_chrm_min;
    HI_U32 clip_luma_max;
    HI_U32 clip_luma_min;

    HI_U32 curld_osd0_stride           ;
    HI_U32 curld_osd1_stride        ;
    HI_U32 curld_osd2_stride           ;
    HI_U32 curld_osd3_stride         ;
    HI_U32 curld_osd4_stride          ;
    HI_U32 curld_osd5_stride          ;
    HI_U32 curld_osd6_stride         ;
    HI_U32 curld_osd7_stride        ;

    HI_U32 mrg_pu8_bias_cost;
    HI_U32 mrg_pu16_bias_cost;
    HI_U32 mrg_pu32_bias_cost;
    HI_U32 mrg_pu64_bias_cost;

    HI_U32 fme_pu8_bias_cost;
    HI_U32 fme_pu16_bias_cost;
    HI_U32 fme_pu32_bias_cost;
    HI_U32 fme_pu64_bias_cost;

    HI_U32 vcpi_col_long_flag  ;
    HI_U32 vcpi_curr_ref_long_flag;
    HI_U32 vcpi_col_from_l0_flag;
    HI_U32 vcpi_predflag_sel;
    HI_U32 vcpi_pintra_pu16_amp_th        ;
    HI_U32 vcpi_pintra_pu32_amp_th        ;
    HI_U32 vcpi_pintra_pu64_amp_th        ;
    HI_U32 vcpi_pintra_pu16_std_th        ;
    HI_U32 vcpi_pintra_pu32_std_th        ;
    HI_U32 vcpi_pintra_pu16_angel_cost_th ;
    HI_U32 vcpi_pintra_pu32_angel_cost_th ;

    HI_U32 vcpi_insert_i_slc_en ;
    HI_U32 vcpi_insert_i_slc_idx ;

    HI_U32 vcpi_clkdiv_en;

    //HI_U32 move_sad_en            ;
    HI_U32   pblk_pre_mvy_thr ;
    HI_U32   pblk_pre_mvx_thr;
    HI_U32 vctrl_roi_en;

    HI_U32 vcpi_nbild_bypass;
    HI_U32 vcpi_pmeld_bypass;
    HI_U32 vcpi_refyh_bypass;
    HI_U32 vcpi_refch_bypass;
    HI_U32 vcpi_refy_bypass;
    HI_U32 vcpi_refc_bypass;

    HI_U32 vcpi_pmeinfold0_bypass;
    HI_U32 vcpi_pmeinfold1_bypass;
    HI_U32 vcpi_srcy_bypass;
    HI_U32 vcpi_srcu_bypass;
    HI_U32 vcpi_srcv_bypass;
    HI_U32 vcpi_nbist_bypass;
    HI_U32 vcpi_pmest_bypass;
    HI_U32 vcpi_recyh_bypass;
    HI_U32 vcpi_recch_bypass;
    HI_U32 vcpi_recy_bypass;
    HI_U32 vcpi_recc_bypass;
    HI_U32 vcpi_pmeinfost_bypass;
    HI_U32 vcpi_strm_bypass;
    HI_U32 venc_yuv_file;
} VeduEfl_BaseAttr_S;

typedef struct
{

    HI_U32  img_improve_en ;
    HI_U32  static_en ;
    HI_U32  highedge_en ;
    HI_U32  skin_en ;

    HI_U32 norm32_tr1_denois_max_num;
    HI_U32 norm32_coeff_protect_num;
    HI_U32 norm16_tr1_denois_max_num;
    HI_U32 norm16_coeff_protect_num;
    HI_U32 skin32_tr1_denois_max_num;
    HI_U32 skin32_coeff_protect_num;
    HI_U32 skin16_tr1_denois_max_num;
    HI_U32 skin16_coeff_protect_num;
    HI_U32 static32_tr1_denois_max_num;
    HI_U32 static32_coeff_protect_num;
    HI_U32 static16_tr1_denois_max_num;
    HI_U32 static16_coeff_protect_num;
    HI_U32 hedge32_tr1_denois_max_num;
    HI_U32 hedge32_coeff_protect_num;
    HI_U32 hedge16_tr1_denois_max_num;
    HI_U32 hedge16_coeff_protect_num;

    HI_U32 norm_intra_cu32_rdcost_offset;
    HI_U32 norm_intra_cu16_rdcost_offset;
    HI_U32 norm_intra_cu8_rdcost_offset;
    HI_U32 norm_intra_cu4_rdcost_offset;

    HI_U32 strmov_intra_cu32_rdcost_offset;
    HI_U32 strmov_intra_cu16_rdcost_offset;
    HI_U32 strmov_intra_cu8_rdcost_offset;
    HI_U32 strmov_intra_cu4_rdcost_offset;

    HI_U32 norm_mrg_cu64_rdcost_offset;
    HI_U32 norm_mrg_cu32_rdcost_offset;
    HI_U32 norm_mrg_cu16_rdcost_offset;
    HI_U32 norm_mrg_cu8_rdcost_offset;
    HI_U32 strmov_mrg_cu64_rdcost_offset;
    HI_U32 strmov_mrg_cu32_rdcost_offset;
    HI_U32 strmov_mrg_cu16_rdcost_offset;
    HI_U32 strmov_mrg_cu8_rdcost_offset;


    HI_U32 norm_fme_cu64_rdcost_offset;
    HI_U32 norm_fme_cu32_rdcost_offset;
    HI_U32 norm_fme_cu16_rdcost_offset;
    HI_U32 norm_fme_cu8_rdcost_offset;
    HI_U32 strmov_fme_cu64_rdcost_offset;
    HI_U32 strmov_fme_cu32_rdcost_offset;
    HI_U32 strmov_fme_cu16_rdcost_offset;
    HI_U32 strmov_fme_cu8_rdcost_offset;

    HI_U32 skin_intra_cu32_rdcost_offset;
    HI_U32 skin_intra_cu16_rdcost_offset;
    HI_U32 skin_intra_cu8_rdcost_offset ;
    HI_U32 skin_intra_cu4_rdcost_offset ;
    HI_U32 sobel_str_intra_cu32_rdcost_offset;
    HI_U32 sobel_str_intra_cu16_rdcost_offset;
    HI_U32 sobel_str_intra_cu8_rdcost_offset ;
    HI_U32 sobel_str_intra_cu4_rdcost_offset ;

    HI_U32 skin_mrg_cu64_rdcost_offset;
    HI_U32 skin_mrg_cu32_rdcost_offset;
    HI_U32 skin_mrg_cu16_rdcost_offset;
    HI_U32 skin_mrg_cu8_rdcost_offset  ;
    HI_U32 sobel_str_mrg_cu64_rdcost_offset;
    HI_U32 sobel_str_mrg_cu32_rdcost_offset;
    HI_U32 sobel_str_mrg_cu16_rdcost_offset;
    HI_U32 sobel_str_mrg_cu8_rdcost_offset  ;

    HI_U32 skin_fme_cu64_rdcost_offset;
    HI_U32 skin_fme_cu32_rdcost_offset;
    HI_U32 skin_fme_cu16_rdcost_offset;
    HI_U32 skin_fme_cu8_rdcost_offset  ;
    HI_U32 sobel_str_fme_cu64_rdcost_offset;
    HI_U32 sobel_str_fme_cu32_rdcost_offset;
    HI_U32 sobel_str_fme_cu16_rdcost_offset;
    HI_U32 sobel_str_fme_cu8_rdcost_offset  ;

    HI_U32 hedge_intra_cu32_rdcost_offset;
    HI_U32 hedge_intra_cu16_rdcost_offset;
    HI_U32 hedge_intra_cu8_rdcost_offset;
    HI_U32 hedge_intra_cu4_rdcost_offset;
    HI_U32 sobel_tex_intra_cu32_rdcost_offset;
    HI_U32 sobel_tex_intra_cu16_rdcost_offset;
    HI_U32 sobel_tex_intra_cu8_rdcost_offset;
    HI_U32 sobel_tex_intra_cu4_rdcost_offset;

    HI_U32 hedge_mrg_cu64_rdcost_offset;
    HI_U32 hedge_mrg_cu32_rdcost_offset;
    HI_U32 hedge_mrg_cu16_rdcost_offset;
    HI_U32 hedge_mrg_cu8_rdcost_offset;
    HI_U32 sobel_tex_mrg_cu64_rdcost_offset;
    HI_U32 sobel_tex_mrg_cu32_rdcost_offset;
    HI_U32 sobel_tex_mrg_cu16_rdcost_offset;
    HI_U32 sobel_tex_mrg_cu8_rdcost_offset;

    HI_U32 hedge_fme_cu64_rdcost_offset;
    HI_U32 hedge_fme_cu32_rdcost_offset;
    HI_U32 hedge_fme_cu16_rdcost_offset;
    HI_U32 hedge_fme_cu8_rdcost_offset;
    HI_U32 sobel_tex_fme_cu64_rdcost_offset;
    HI_U32 sobel_tex_fme_cu32_rdcost_offset;
    HI_U32 sobel_tex_fme_cu16_rdcost_offset;
    HI_U32 sobel_tex_fme_cu8_rdcost_offset;

    HI_U32 roundingedgemovmechanism ;
    HI_U32 roundingedgemovdegreethresh ;
    HI_U32 roundingedgemovforcezeroresidthresh ;
    HI_U32 roundingedgemovac32sum ;
    HI_U32 roundingedgemovac16sum ;
    HI_U32 roundingedgemovlowfreqacblk32 ;
    HI_U32 roundingedgemovlowfreqacblk16 ;
    HI_U32 roundingsobelstrmechanism ;
    HI_U32 roundingsobelstrdegreethresh ;
    HI_U32 roundingsobelstrforcezeroresidthresh ;
    HI_U32 roundingsobelstrac32sum ;
    HI_U32 roundingsobelstrac16sum ;
    HI_U32 roundingsobelstrlowfreqacblk32 ;
    HI_U32 roundingsobelstrlowfreqacblk16 ;
    HI_U32 roundingsobelweakmechanism ;
    HI_U32 roundingsobelweakdegreethresh ;
    HI_U32 roundingsobelweakforcezeroresidthresh ;
    HI_U32 roundingsobelweakac32sum ;
    HI_U32 roundingsobelweakac16sum ;
    HI_U32 roundingsobelweaklowfreqacblk32 ;
    HI_U32 roundingsobelweaklowfreqacblk16 ;

    HI_U32 roundingoffset16x16 ;
    HI_U32 roundingoffset32x32 ;
    HI_U32 roundingskinoffset16x16 ;
    HI_U32 roundingskinoffset32x32 ;
    HI_U32 roundingstilloffset16x16 ;
    HI_U32 roundingstilloffset32x32 ;
    HI_U32 roundingedgeoffset16x16 ;
    HI_U32 roundingedgeoffset32x32 ;
    HI_U32 roundingedgemovoffset16x16 ;
    HI_U32 roundingedgemovoffset32x32 ;
    HI_U32 roundingsobelstroffset16x16 ;
    HI_U32 roundingsobelstroffset32x32 ;
    HI_U32 roundingsobelweakoffset16x16 ;
    HI_U32 roundingsobelweakoffset32x32 ;
    HI_U32 edgemov32_coeff_protect_num ;
    HI_U32 edgemov32_tr1_denois_max_num ;
    HI_U32 edgemov16_coeff_protect_num ;
    HI_U32 edgemov16_tr1_denois_max_num ;
    HI_U32 sobelstr32_coeff_protect_num ;
    HI_U32 sobelstr32_tr1_denois_max_num ;
    HI_U32 sobelstr16_coeff_protect_num ;
    HI_U32 sobelstr16_tr1_denois_max_num ;
    HI_U32 sobelweak32_coeff_protect_num ;
    HI_U32 sobelweak32_tr1_denois_max_num ;
    HI_U32 sobelweak16_coeff_protect_num ;
    HI_U32 sobelweak16_tr1_denois_max_num ;

    HI_U32 norm_isolate_ac_enable  ;
    HI_U32 norm_force_zero_cnt  ;
    HI_U32 norm_engsum_32  ;
    HI_U32 norm_engcnt_32  ;
    HI_U32 norm_engsum_16  ;
    HI_U32 norm_engcnt_16  ;
    HI_U32 skin_isolate_ac_enable  ;
    HI_U32 skin_force_zero_cnt  ;
    HI_U32 skin_engsum_32  ;
    HI_U32 skin_engcnt_32  ;
    HI_U32 skin_engsum_16  ;
    HI_U32 skin_engcnt_16  ;
    HI_U32 still_isolate_ac_enable  ;
    HI_U32 still_force_zero_cnt  ;
    HI_U32 still_engsum_32  ;
    HI_U32 still_engcnt_32  ;
    HI_U32 still_engsum_16  ;
    HI_U32 still_engcnt_16  ;
    HI_U32 stredge_isolate_ac_enable  ;
    HI_U32 stredge_force_zero_cnt  ;
    HI_U32 stredge_engsum_32  ;
    HI_U32 stredge_engcnt_32  ;
    HI_U32 stredge_engsum_16  ;
    HI_U32 stredge_engcnt_16  ;
    HI_U32 edgemov_isolate_ac_enable  ;
    HI_U32 edgemov_force_zero_cnt  ;
    HI_U32 edgemov_engsum_32  ;
    HI_U32 edgemov_engcnt_32  ;
    HI_U32 edgemov_engsum_16  ;
    HI_U32 edgemov_engcnt_16  ;
    HI_U32 sobelstr_isolate_ac_enable  ;
    HI_U32 sobelstr_force_zero_cnt  ;
    HI_U32 sobelstr_engsum_32  ;
    HI_U32 sobelstr_engcnt_32  ;
    HI_U32 sobelstr_engsum_16  ;
    HI_U32 sobelstr_engcnt_16  ;
    HI_U32 sobelwk_isolate_ac_enable  ;
    HI_U32 sobelwk_force_zero_cnt  ;
    HI_U32 sobelwk_engsum_32  ;
    HI_U32 sobelwk_engcnt_32  ;
    HI_U32 sobelwk_engsum_16  ;
    HI_U32 sobelwk_engcnt_16  ;

    HI_U32  roundingMechanism     ;
    HI_U32  roundingDegreeThresh  ;
    HI_U32  roundingForceZeroResidThresh  ;
    HI_U32  roundingAC32sum       ;
    HI_U32  roundingAC16sum        ;
    HI_U32  roundingLowFreqACBlk32   ;
    HI_U32  roundingLowFreqACBlk16   ;

    HI_U32  roundingSkinMechanism     ;
    HI_U32  roundingSkinDegreeThresh  ;
    HI_U32  roundingSkinForceZeroResidThresh  ;
    HI_U32  roundingSkinAC32sum       ;
    HI_U32  roundingSkinAC16sum        ;
    HI_U32  roundingSkinLowFreqACBlk32   ;
    HI_U32  roundingSkinLowFreqACBlk16  ;

    HI_U32  roundingStillMechanism     ;
    HI_U32  roundingStillDegreeThresh  ;
    HI_U32  roundingStillForceZeroResidThresh  ;
    HI_U32  roundingStillAC32sum       ;
    HI_U32  roundingStillAC16sum        ;
    HI_U32  roundingStillLowFreqACBlk32   ;
    HI_U32  roundingStillLowFreqACBlk16  ;

    HI_U32  roundingEdgeMechanism     ;
    HI_U32  roundingEdgeDegreeThresh  ;
    HI_U32  roundingEdgeForceZeroResidThresh  ;
    HI_U32  roundingEdgeAC32sum       ;
    HI_U32  roundingEdgeAC16sum        ;
    HI_U32  roundingEdgeLowFreqACBlk32   ;
    HI_U32  roundingEdgeLowFreqACBlk16  ;

    HI_U32 norm_sel_cu8_rd_offset;
    HI_U32 skin_sel_cu8_rd_offset;
    HI_U32 hedge_sel_cu8_rd_offset;
    HI_U32 strmov_sel_cu8_rd_offset;
    HI_U32 sobelstr_sel_cu8_rd_offset;
    HI_U32 sobeltex_sel_cu8_rd_offset;

    HI_U32 skin_inter_cu_rdcost_offset;
    HI_U32 hedge_inter_cu_rdcost_offset;
    HI_U32 skin_layer_rdcost_offset;

    HI_U32 sobelstr_inter_cu_rdcost_offset;
    HI_U32 sobeltex_inter_cu_rdcost_offset;
    HI_U32 hedge_layer_rdcost_offset;

    HI_U32 strmov_inter_cu_rdcost_offset;
    HI_U32 norm_inter_cu_rdcost_offset;
    HI_U32 strmov_layer_rdcost_offset;

    HI_U32 sobelstr_layer_rdcost_offset;
    HI_U32 sobeltex_layer_rdcost_offset;
    HI_U32 norm_layer_rdcost_offset;

    HI_U32 sel_intra4_8_abs_offset;
    HI_U32 sel_intra16_abs_offset;
    HI_U32 sel_intra32_abs_offset;
    HI_U32 sel_inter8_16_abs_offset;
    HI_U32 sel_inter32_abs_offset;
    HI_U32 sel_inter64_abs_offset;
    HI_U32 sel_layer32_abs_offset;
    HI_U32 sel_layer64_abs_offset;

    HI_U32 sel_offset_strength   ;
    HI_U32 sel_cu32_dc_ac_th_offset  ;
    HI_U32 sel_cu32_qp0_th       ;
    HI_U32 sel_cu32_qp1_th       ;
    HI_U32 sel_res16_luma_dc_th  ;
    HI_U32 sel_res16_chroma_dc_th  ;
    HI_U32 sel_res16_luma_ac_th  ;
    HI_U32 sel_res16_chroma_ac_th  ;
    HI_U32 sel_res32_luma_dc_th  ;
    HI_U32 sel_res32_chroma_dc_th  ;
    HI_U32 sel_res32_luma_ac_th  ;
    HI_U32 sel_res32_chroma_ac_th  ;

} VeduEfl_ImgImproveAttr_S;

typedef struct
{
    HI_U32 cu_qp_delta_thresh[16];
    HI_U32 qp_delta_level[16];
    HI_U32 qp_madi_switch_thr;

    HI_U32  h264_lowluma_qp_delta ;
    HI_U32 h264_lowluma_max_qp  ;

    HI_U32 bfg_roi_qp_delta;
    HI_U32 large_move_qp_delta;
    HI_U32 strong_edge_qp_delta;
    HI_U32 strong_edge_move_qp_delta;
    HI_U32 skin_qp_delta;
    HI_U32 intra_det_qp_delta;

    HI_U32 bfg_roi_max_qp     ;
    HI_U32  large_move_max_qp ;
    HI_U32  strong_edge_max_qp ;
    HI_U32 move_edge_max_qp;
    HI_U32  skin_max_qp	;
    HI_U32 intra_det_max_qp;


    HI_U32  h264_smooth_qp_delta ;
    HI_U32  h264_smooth_qp_delta1 ;
    HI_U32  h264_smooth_max_qp ;
    HI_U32 cu32_delta_low;
    HI_U32 cu32_delta_high;

    HI_U32 qp_delta;
    HI_U32 lambda[80];
    HI_U32 ave_lcu_bits;
    //HI_U32 row_lcu_bits;
    HI_U32 qpg_line_qp[72] ;
    HI_U32 qpg_line_byte[72];

    HI_U32 qp_restrain_madi_thr ;
    HI_U32 qp_restrain_mode ;
    HI_U32 qp_restrain_en ;
    HI_U32 qp_restrain_delta_blk32 ;
    HI_U32 lambda_qp_offset;

    HI_U32 post_cu_high_switch_thr  ;
    HI_U32 post_cu_low_switch_thr;
    HI_U32 post_cu_high_madi_thresh;
    HI_U32 post_cu_low_madi_thresh  ;
    HI_U32 post_qp_high_level ;
    HI_U32 post_qp_low_level  ;
    HI_U32 post_qp_low_thrsh[8];
    HI_U32  post_qp_high_thrsh[8];


    HI_U32 low_min_sad_en;
    HI_U32 high_min_sad_en;

    HI_U32 rc_h264_smooth_mb_en ;
    HI_U32 rc_low_luma_en ;
    HI_U32 rc_cu_qp_en;
    HI_U32 rc_row_qp_en;
    HI_U32 rc_line_mode_en;
    HI_U32 rc_line_qp_delta;

    HI_U32 bfg_roi_qp_en ; //not used
    HI_U32 rc_cu_madi_en;
    HI_U32 rc_qp_restrain_en;
    HI_U32 move_scene_en;
    HI_U32 vcpi_bfg_roi_qp_en;
    HI_U32 strong_edge_move_en;
    HI_U32 intra_det_qp_en;
    HI_U32 flat_region_en;
    HI_U32 post_rc_cu_en;    //post
    HI_U32 post_cu_skin_en;      //post
    HI_U32 qp_restrain_large_sad;
    HI_U32 min_sad_thresh_low;
    HI_U32 min_sad_thresh_high;

    HI_U32 min_sad_level;
    HI_U32 low_min_sad_mode;
    HI_U32 high_min_sad_mode;
    HI_U32 qp_restrain_delta_blk16;
    HI_U32 min_sad_madi_en;
    HI_U32 min_sad_qp_restrain_en;
    HI_U32 rdo_lambda_choose_mode;
    HI_U32 lambda_inter_stredge_en;

    HI_U32 rd_smooth_mb_en;
    HI_U32 rd_min_sad_flag_en;
    HI_U32 wr_min_sad_flag_en;
    HI_U32  prev_min_sad_en;
    HI_U32  qpgld_en;
    HI_U32   map_roikeep_en;
    HI_U32  qp_detlta_size_cu64;
    HI_U32  smart_get_cu64_qp_mode;
    HI_U32  smart_get_cu32_qp_mode;
    HI_U32  smart_cu_level_qp_mode;
    HI_U32  rc_smart_abs_qp_mode;
    HI_U32  skin_min_qp;
    HI_U32  bfg_roi_min_qp;
    HI_U32  stredge_move_min_qp;
    HI_U32  intra_det_min_qp;
    HI_U32  large_move_min_qp;
    HI_U32  stredge_min_qp;
    HI_U32  smooth_min_qp;
    HI_U32  row_target_bits;

    HI_U32  lowluma_max_qp;
    HI_U32  lowluma_qp_delta;
    HI_U32  lowluma_min_qp;
	HI_U32  move_sad_en;
} VeduEfl_QpgAttr_S;

typedef struct
{
    HI_U32  prdo_en;
    HI_U32 new_cost_en;
    HI_U32 l0_psw_adapt_en;

    HI_U32 l0_psw_thr0;
    HI_U32 l0_psw_thr1;
    HI_U32 l0_psw_thr2;

    HI_U32 tr_weightx_2;
    HI_U32 tr_weightx_1;
    HI_U32 tr_weightx_0;
    HI_U32 tr_weighty_2;
    HI_U32 tr_weighty_1;
    HI_U32 tr_weighty_0;
    HI_U32 sr_weight_2;
    HI_U32 sr_weight_1;
    HI_U32 sr_weight_0;
    HI_U32 pme_pskip_strongedge_madi_times;
    HI_U32 pme_pskip_strongedge_madi_thr;

    HI_U32 skipblk_pre_en ;
    HI_U32 skipblk_pre_cost_thr;

    HI_U32 skin_num;
    HI_U32 skin_v_min_thr;
    HI_U32 skin_v_max_thr;
    HI_U32 skin_u_min_thr;
    HI_U32 skin_u_max_thr;
    HI_U32 pme_flat_u_thr_low;
    HI_U32 pme_flat_u_thr_high;
    HI_U32 pme_flat_v_thr_low;
    HI_U32 pme_flat_v_thr_high;

    HI_U32 pme_flat_high_luma_thr;
    HI_U32 pme_flat_low_luma_thr;
    HI_U32 pme_flat_luma_madi_thr;
    HI_U32 pme_flat_pmemv_thr;

    HI_U32 pme_flat_madi_times;
    HI_U32 pme_flat_region_cnt;
    HI_U32 pme_flat_icount_thr;
    HI_U32 pme_flat_pmesad_thr;



    HI_U32 pme_intra16_madi_thr;
    HI_U32 pme_intra32_madi_thr;

    HI_U32 pme_intra_lowpow_en                      ;
    HI_U32 pme_iblk_pre_cost_thr_h264              ;
    HI_U32 pme_intrablk_det_cost_thr1               ;
    HI_U32 still_scene_thr;
    HI_U32 high_edge_cnt;
    HI_U32 high_edge_thr;

    HI_U32 prdo_f1[64];
    HI_U32 prdo_f2[64];
    HI_U32 fg_detect_thr ; ;
    HI_U32 fg_detectcnt_thr ;
    HI_U32 move_sad_thr ;
    HI_U32 move_scene_thr ;
    HI_U32 interstrongedge_madi_thr ;
    HI_U32 interdiff_max_min_madi_times ;
    HI_U32 interdiff_max_min_madi_abs ;
    HI_U32 cost_lamda_en ;
    HI_U32 mvp3median_en ;
    HI_U32 cost_lamda2 ;
    HI_U32 cost_lamda1 ;
    HI_U32 cost_lamda0 ;

    HI_U32 l0_win0_width;
    HI_U32 l0_win0_height;
    HI_U32 l0_win1_width;
    HI_U32 l0_win1_height;
    HI_U32 l0_win2_width;
    HI_U32 l0_win2_height;
    HI_U32 l0_win3_width;
    HI_U32 l0_win3_height;

    HI_U32 l1_win0_width;
    HI_U32 l1_win0_height;
    HI_U32 l1_win1_width;
    HI_U32 l1_win1_height;
    HI_U32 l1_win2_width;
    HI_U32 l1_win2_height;
    HI_U32 l1_win3_width;
    HI_U32 l1_win3_height;

    HI_U32 l0_cost_offset ;
    HI_U32 pme_pskip_mvy_consistency_thr   ;
    HI_U32 pme_pskip_mvx_consistency_thr   ;

    HI_U32 pme_intrablk_det_cost_thr0   ;
    HI_U32 pme_intrablk_det_mvx_thr     ;
    HI_U32 pme_intrablk_det_mvy_thr     ;
    HI_U32 pme_intrablk_det_mv_dif_thr0 ;
    HI_U32 pme_intrablk_det_mv_dif_thr1 ;
    //HI_U32 move_sad_en ;

    HI_U32 pme_safe_line                            	;
    HI_U32 pme_safe_line_val                        	;

    HI_U32 pme_iblk_refresh_start_num               ;
    HI_U32 pme_iblk_refresh_num                   ;
    HI_U32 pme_high_luma_thr;
    HI_U32 smooth_madi_thr;
    HI_U32 pme_inter_first;
    HI_U32 low_luma_thr     ;
    HI_U32 low_luma_madi_thr  ;
    HI_U32 madi_dif_thr      ;
    HI_U32 cur_madi_dif_thr  ;
    HI_U32 min_sad_thr_gain  ;
    HI_U32 min_sad_thr_offset;
    HI_U32 pme_min_sad_thr_offset_cur  ;
    HI_U32 pme_min_sad_thr_gain_cur;

    HI_U32 pme_pblk_pre_mv_dif_thr1;
    HI_U32 pme_pblk_pre_mv_dif_thr0  ;
    HI_U32 pme_pblk_pre_mv_dif_cost_thr;

} VeduEfl_PmeAttr_S;

typedef struct
{
    HI_U32 vcpi_high3pre_en;
    HI_U32 vcpi_ime_lowpow;
    HI_U32 vcpi_force_intra_lowpwr_en;
    HI_U32 vcpi_fme_lowpow;
    HI_U32 vcpi_intra_lowpow;
    HI_U32 flat_region_force_low3layer;

    HI_U32 vcpi_lowpow_fme_thr1;
    HI_U32 vcpi_lowpow_fme_thr0;

    HI_U32 vcpi_clkgate_en;
    HI_U32 vcpi_ddr_cross_en;
    HI_U32 fme_gtck_en;
    HI_U32 mrg_gtck_en;
    HI_U32 tqitq_gtck_en;
    HI_U32 vcpi_mem_clkgate_en;
    HI_U32 vcpi_ddr_cross_idx;
} VeduEfl_LowPowerAttr_S;

typedef struct
{

    HI_U32 deadzone_intra_slice  ;
    HI_U32 deadzone_inter_slice  ;
} VeduEfl_QscalingAttr_S;

typedef struct
{
    HI_U8  SlcSplitMod;       /* 0 or 1, byte or mb line ,just select 1*/
    VENC_BUFFER_S DdrRegCfgBuf;
    HI_U32  RegConfigMode;

    VENC_BUFFER_S SliceBuf;

    HI_U32* pRegBase;
    /*para*/
    HI_U32 Protocol;
    HI_U16 SlcSplitEn;
    HI_U32 SplitSize;
    HI_U32 StrmBufAddr;
    HI_U32 StrmBufRpAddr; /* phy addr for hardware */
    HI_U32 StrmBufWpAddr;
    HI_U32 StrmBufSize;
	/*for 96mv200 slice buf*/
    HI_U32 SliceBufAddr;    //add by c346155
    HI_U32 SliceBufSize;
    /* frame buffer parameter */
    HI_U32 SStrideY;
    HI_U32 SStrideC;
    HI_U32 YuvStoreType;           /* 0, semiplannar; 1, package; 2,planer */
    HI_U32 PackageSel;

    HI_U32 SrcYAddr;
    HI_U32 SrcCAddr;
    HI_U32 SrcVAddr;                  //just for input of planner

    HI_U32 RcnYAddr[2];
    HI_U32 RcnCAddr[2];
    HI_U32 RcnYAddr_head[2];
    HI_U32 RcnCAddr_head[2];
    HI_U32 TmvAddr[2];
    HI_U32 PmeAddr[2];
    HI_U32 PmeInfoAddr[3];

    HI_U32 SlcHdrBits;         /* 8bit_0 | mark | reorder | slchdr */
    HI_U32 SlcHdrBits_i;//not use
    HI_U32 SlcHdrStream_i [4];
    HI_U32 ReorderStream_i[2];
    HI_U32 MarkingStream_i[2];

    HI_U32 CABAC_SLCHDR_PART2_SEG[8];
    HI_U32 CABAC_SLCHDR_PART2_SEG_I[8];//nt
    HI_U32 slchdr_part1;
    HI_U32 slchdr_part1_i;//nt
    HI_U32 slchdr_size_part1;
    HI_U32 slchdr_size_part1_i; //nt
    HI_U32 slchdr_size_part2;
    HI_U32 slchdr_size_part2_i; //nt

    HI_U32  PTS0;
    HI_U32  PTS1;

#if 1

    HI_U32  RStrideY;
    HI_U32  RStrideC;
    HI_U32  RHStrideY;
    HI_U32  RHStrideC;
#endif

    HI_U32 SlcHdrStream [4];
    HI_U32 ReorderStream[2];
    HI_U32 MarkingStream[2];

    HI_S32 vcpi_srcy_bypass;
    HI_S32 vcpi_srcv_bypass;
    HI_S32 vcpi_refy_bypass;
    HI_S32 vcpi_refc_bypass;
    HI_S32 vcpi_strm_bypass;

#ifdef   VENC_96MV200_CONFIG 
    HI_S32 vcpi_srcu_bypass;           //read reg
    HI_S32 vcpi_pmeinfold1_bypass;
    HI_S32 vcpi_pmeinfold0_bypass;
    HI_S32 vcpi_refch_bypass;
    HI_S32 vcpi_refyh_bypass;
    HI_S32 vcpi_pmeld_bypass;
    HI_S32 vcpi_nbild_bypass;

    HI_S32 vcpi_pmeinfost_bypass;   //write reg
    HI_S32 vcpi_recc_bypass;
    HI_S32 vcpi_recy_bypass;
    HI_S32 vcpi_recch_bypass;
    HI_S32 vcpi_recyh_bypass;
    HI_S32 vcpi_pmest_bypass;
    HI_S32 vcpi_nbist_bypass;
#endif
    HI_S32 glb_bypass;
    //for smmu
    HI_S32 int_en;
    HI_U32 tunlReadIntvl;
    HI_U32 tunlcellAddr;
    HI_S32  ClkGateEn;
    HI_S32  MemClkGateEn;
    HI_S32  TimeOutEn;
    HI_S32  PtBitsEn;
    HI_U32  TimeOut;
    HI_S32  PtBits;

    //add for 98cv200
    HI_S32  wOutStdNum;
    HI_S32  rOutStdNum;
    //add end

    VeduEfl_RoiAttr_S RoiCfg;

    VeduEfl_ImgImproveAttr_S    ImgImproveCfg;
    VeduEfl_QpgAttr_S           QpgCfg;
    VeduEfl_BaseAttr_S          BaseCfg;
    VeduEfl_PmeAttr_S           PmeCfg;

	VeduEfl_LowPowerAttr_S LowPowerCfg;
	VeduEfl_QscalingAttr_S QscalingCfg;

#ifdef HI_SMMU_SUPPORT
    HI_U32 u32SmmuPageBaseAddr;
    HI_U32 u32SmmuErrWriteAddr;
    HI_U32 u32SmmuErrReadAddr;
#endif

    HI_U32 VencEndOfPic;
    HI_U32 VencBufFull;
    HI_U32 VencPbitOverflow;
    HI_U32 MeanQP;

    HI_S32 ints_tlbmiss_stat;          //°2è??D??×′ì?
    HI_S32 ints_ptw_trans_stat;
    HI_S32 ints_tlbinvalid_rd_stat;
    HI_S32 ints_tlbinvalid_wr_stat;

    HI_S32 intns_tlbmiss_stat;       //·?°2è??D??×′ì?
    HI_S32 intns_ptw_trans_stat;
    HI_S32 intns_tlbinvalid_rd_stat;
    HI_S32 intns_tlbinvalid_wr_stat;

    HI_S32 ints_tlbmiss_msk;           //°2è??′?D???á±?
    HI_S32 ints_ptw_trans_msk;
    HI_S32 ints_tlbinvalid_msk;

    HI_S32 ints_tlbmiss_raw;            //°2è??′?D??
    HI_S32 ints_ptw_trans_raw;
    HI_S32 ints_tlbinvalid_raw;

    HI_S32 ints_tlbmiss_clr;           //°2è?2à???D??
    HI_S32 ints_ptw_trans_clr;
    HI_S32 ints_tlbinvalid_clr;

    HI_S32 intns_tlbmiss_msk     ;      //·?°2è??′?D???á±?
    HI_S32 intns_ptw_trans_msk   ;
    HI_S32 intns_tlbinvalid_msk  ;

    HI_S32 intns_tlbmiss_raw     ;      //·? °2è??′?D??
    HI_S32 intns_ptw_trans_raw   ;
    HI_S32 intns_tlbinvalid_raw  ;

    HI_S32 intns_tlbmiss_clr     ;        //·? °2è?2à???D??
    HI_S32 intns_ptw_trans_clr   ;
    HI_S32 intns_tlbinvalid_clr  ;

    HI_S32 fault_index_id        ;
    HI_S32 fault_strm_id         ;
    HI_S32 fault_index_id_wr     ;
    HI_S32 fault_str_id_wr       ;
    HI_S32 fault_index_id_rd     ;
    HI_S32 fault_str_id_rd       ;
    HI_S32 fault_tlbmiss_err     ;
    HI_S32 fault_tlbinvalid_err  ;
    HI_S32 fault_ptw             ;
    HI_S32 fault_tbu             ;
    HI_S32 fault_ptw_num         ;
    HI_S32 fault_tbu_num         ;

    /*add for safe mode*/
    HI_U32   VEDU_SLICE_LENGTH[16]; //16片码流真正长度
    HI_U32   VEDU_SLICE_IS_END[16]; //16片码流是否end标志
    HI_U32   VEDU_STRM_ADDR[16];// 16片码流地址
    HI_U32   VEDU_STRM_BUFLEN[16]; // 16片码流最大长度
    HI_U32   VEDU_PPS_ADDR;
	
    HI_U32 VCPI_PMEINFO_LD0_ADDR;
    HI_U32 VCPI_PMEINFO_LD1_ADDR;
    HI_U32 VCPI_PMEINFO_ST_ADDR;

    HI_U32   vlcst_para_set_en;
    HI_U32   vlcst_para_set_len;
	HI_U32   para_sprat_en;
	HI_U32   HeaderRealLength;

	HI_U32   VEDU_HEADER[48];
} Vedu_Hal_S;

#define PARA_ADAPT_ENCODER  1
#if PARA_ADAPT_ENCODER
typedef struct
{
    VeduEfl_ImgImproveAttr_S    ImgImproveCfg[5];
    VeduEfl_QpgAttr_S           QpgCfg[5];
    VeduEfl_PmeAttr_S           PmeCfg[5];
}Vedu_EncPara_Table_S;
#endif 
typedef unsigned long VEDU_LOCK_FLAG;

HI_VOID VENC_HAL_ClrAllInt(S_VEDU_REGS_TYPE *pVeduReg );
HI_VOID VENC_HAL_DisableAllInt(S_VEDU_REGS_TYPE *pVeduReg );
HI_VOID VENC_HAL_ReadReg(Vedu_Hal_S *pstHal, VeduEfl_Rc_S *pstRc, VeduEfl_StatInfo_S *pstStat);
HI_VOID VENC_HAL_CfgReg(Vedu_Hal_S *pstHal, VeduEfl_Rc_S *pstRc);
HI_VOID VENC_HAL_ReadReg_Smmu(Vedu_Hal_S *pstHal);
HI_VOID VENC_HAL_DDRCfgReg(Vedu_Hal_S *pstHal, VeduEfl_Rc_S *pstRc);

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif

#endif //__HAL_VENC_H__

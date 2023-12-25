
        
        
    

    

    merge into `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stojou` as DBT_INTERNAL_DEST
        using (
           












































































































































 

SELECT   `updtick_0`,  `warehouse`,  `updcod_0`,  `x3_sku`,  `journal_date`,  `mvtseq_0`,  `mvtind_0`,  `cstdat_0`,  `csttim_0`,  `cstcou_0`,  `owner_0`,  `lot_0`,  `slo_0`,  `bpslot_0`,  `location`,  `wrh_0`,  `serial_number`,  `trstyp_0`,  `trsfam_0`,  `mvtdes_0`,  `pjt_0`,  `bprnum_0`,  `document_type_code`,  `document_id`,  `document_line`,  `vcrtypori_0`,  `vcrnumori_0`,  `vcrlinori_0`,  `vcrseqori_0`,  `vcrtypreg_0`,  `vcrnumreg_0`,  `vcrlinreg_0`,  `usrfld1_0`,  `usrfld2_0`,  `usrfld3_0`,  `usrfld4_0`,  `x3_size_code`,  `qtypcu_0`,  `pcustucoe_0`,  `qtystu_0`,  `stu_0`,  `pcuori_0`,  `pcustuori_0`,  `amtord_0`,  `amtval_0`,  `varord_0`,  `varval_0`,  `priord_0`,  `prival_0`,  `prinat_0`,  `amtval2_0`,  `varval2_0`,  `prival2_0`,  `prinat2_0`,  `priregflg_0`,  `amtdev_0`,  `amtdev2_0`,  `shldat_0`,  `stock_status`,  `pot_0`,  `act_0`,  `actqty_0`,  `qlyctldem_0`,  `prnflg_0`,  `regflg_0`,  `lbefmt_0`,  `lbenbr_0`,  `die_0`,  `die_1`,  `die_2`,  `die_3`,  `die_4`,  `die_5`,  `die_6`,  `die_7`,  `die_8`,  `die_9`,  `die_10`,  `die_11`,  `die_12`,  `die_13`,  `die_14`,  `die_15`,  `die_16`,  `die_17`,  `die_18`,  `die_19`,  `cce_0`,  `cce_1`,  `cce_2`,  `cce_3`,  `cce_4`,  `cce_5`,  `cce_6`,  `cce_7`,  `cce_8`,  `cce_9`,  `cce_10`,  `cce_11`,  `cce_12`,  `cce_13`,  `cce_14`,  `cce_15`,  `cce_16`,  `cce_17`,  `cce_18`,  `cce_19`,  `entcod_0`,  `finrspfcy_0`,  `aggifaflg_0`,  `gte_0`,  `numvcr_0`,  `palnum_0`,  `ctrnum_0`,  `betcpy_0`,  `dludat_0`,  `newltidat_0`,  `cremvtdat_0`,  `cremvttim_0`,  `cremvtseq_0`,  `expnum_0`,  `pronum_0`,  `credat_0`,  `cretim_0`,  `creation_user_id`,  `upddat_0`,  `updusr_0`,  `created_at`,  `upddattim_0`,  `auuid_0`,  `accdat_0`,  `zoriserial_0`,  `row_id`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `warehouse`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updcod_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`iptdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`iptdat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `journal_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mvtseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mvtseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `mvtseq_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mvtind_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mvtind_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `mvtind_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cstdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cstdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `cstdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`csttim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`csttim_0` AS string)), '') AS string) END as string)
 AS `csttim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cstcou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cstcou_0` AS string)), '') AS string) END as numeric)
 AS `cstcou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`owner_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`owner_0` AS string)), '') AS string) END as string)
 AS `owner_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) END as string)
 AS `lot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) END as string)
 AS `slo_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpslot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpslot_0` AS string)), '') AS string) END as string)
 AS `bpslot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) END as string)
 AS `location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) END as string)
 AS `wrh_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trstyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trstyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `trstyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trsfam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trsfam_0` AS string)), '') AS string) END as string)
 AS `trsfam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mvtdes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mvtdes_0` AS string)), '') AS string) END as string)
 AS `mvtdes_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) END as string)
 AS `pjt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprnum_0` AS string)), '') AS string) END as string)
 AS `bprnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `document_type_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) END as string)
 AS `document_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `document_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrtypori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrtypori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrtypori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrnumori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrnumori_0` AS string)), '') AS string) END as string)
 AS `vcrnumori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrlinori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrlinori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrlinori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrseqori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrseqori_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrseqori_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrtypreg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrtypreg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrtypreg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrnumreg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrnumreg_0` AS string)), '') AS string) END as string)
 AS `vcrnumreg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrlinreg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrlinreg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrlinreg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrfld1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrfld1_0` AS string)), '') AS string) END as string)
 AS `usrfld1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrfld2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrfld2_0` AS string)), '') AS string) END as string)
 AS `usrfld2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrfld3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrfld3_0` AS string)), '') AS string) END as numeric)
 AS `usrfld3_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usrfld4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usrfld4_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `usrfld4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) END as string)
 AS `x3_size_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtypcu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtypcu_0` AS string)), '') AS string) END as numeric)
 AS `qtypcu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcustucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcustucoe_0` AS string)), '') AS string) END as numeric)
 AS `pcustucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) END as string)
 AS `stu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcuori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcuori_0` AS string)), '') AS string) END as string)
 AS `pcuori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcustuori_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcustuori_0` AS string)), '') AS string) END as numeric)
 AS `pcustuori_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtord_0` AS string)), '') AS string) END as numeric)
 AS `amtord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtval_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtval_0` AS string)), '') AS string) END as numeric)
 AS `amtval_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`varord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`varord_0` AS string)), '') AS string) END as numeric)
 AS `varord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`varval_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`varval_0` AS string)), '') AS string) END as numeric)
 AS `varval_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`priord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`priord_0` AS string)), '') AS string) END as numeric)
 AS `priord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prival_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prival_0` AS string)), '') AS string) END as numeric)
 AS `prival_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prinat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prinat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prinat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtval2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtval2_0` AS string)), '') AS string) END as numeric)
 AS `amtval2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`varval2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`varval2_0` AS string)), '') AS string) END as numeric)
 AS `varval2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prival2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prival2_0` AS string)), '') AS string) END as numeric)
 AS `prival2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prinat2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prinat2_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prinat2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`priregflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`priregflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `priregflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtdev_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtdev_0` AS string)), '') AS string) END as numeric)
 AS `amtdev_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amtdev2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amtdev2_0` AS string)), '') AS string) END as numeric)
 AS `amtdev2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shldat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shldat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `shldat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as string)
 AS `stock_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pot_0` AS string)), '') AS string) END as numeric)
 AS `pot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`act_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`act_0` AS string)), '') AS string) END as numeric)
 AS `act_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`actqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`actqty_0` AS string)), '') AS string) END as numeric)
 AS `actqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qlyctldem_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qlyctldem_0` AS string)), '') AS string) END as string)
 AS `qlyctldem_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prnflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prnflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prnflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`regflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`regflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `regflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lbefmt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lbefmt_0` AS string)), '') AS string) END as string)
 AS `lbefmt_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lbenbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lbenbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lbenbr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_0` AS string)), '') AS string) END as string)
 AS `die_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_1` AS string)), '') AS string) END as string)
 AS `die_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_2` AS string)), '') AS string) END as string)
 AS `die_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_3` AS string)), '') AS string) END as string)
 AS `die_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_4` AS string)), '') AS string) END as string)
 AS `die_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_5` AS string)), '') AS string) END as string)
 AS `die_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_6` AS string)), '') AS string) END as string)
 AS `die_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_7` AS string)), '') AS string) END as string)
 AS `die_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_8` AS string)), '') AS string) END as string)
 AS `die_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_9` AS string)), '') AS string) END as string)
 AS `die_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_10` AS string)), '') AS string) END as string)
 AS `die_10`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_11` AS string)), '') AS string) END as string)
 AS `die_11`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_12` AS string)), '') AS string) END as string)
 AS `die_12`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_13` AS string)), '') AS string) END as string)
 AS `die_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_14` AS string)), '') AS string) END as string)
 AS `die_14`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_15` AS string)), '') AS string) END as string)
 AS `die_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_16` AS string)), '') AS string) END as string)
 AS `die_16`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_17` AS string)), '') AS string) END as string)
 AS `die_17`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_18` AS string)), '') AS string) END as string)
 AS `die_18`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`die_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`die_19` AS string)), '') AS string) END as string)
 AS `die_19`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_0` AS string)), '') AS string) END as string)
 AS `cce_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_1` AS string)), '') AS string) END as string)
 AS `cce_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_2` AS string)), '') AS string) END as string)
 AS `cce_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_3` AS string)), '') AS string) END as string)
 AS `cce_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_4` AS string)), '') AS string) END as string)
 AS `cce_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_5` AS string)), '') AS string) END as string)
 AS `cce_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_6` AS string)), '') AS string) END as string)
 AS `cce_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_7` AS string)), '') AS string) END as string)
 AS `cce_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_8` AS string)), '') AS string) END as string)
 AS `cce_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_9` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_9` AS string)), '') AS string) END as string)
 AS `cce_9`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_10` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_10` AS string)), '') AS string) END as string)
 AS `cce_10`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_11` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_11` AS string)), '') AS string) END as string)
 AS `cce_11`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_12` AS string)), '') AS string) END as string)
 AS `cce_12`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_13` AS string)), '') AS string) END as string)
 AS `cce_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_14` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_14` AS string)), '') AS string) END as string)
 AS `cce_14`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_15` AS string)), '') AS string) END as string)
 AS `cce_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_16` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_16` AS string)), '') AS string) END as string)
 AS `cce_16`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_17` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_17` AS string)), '') AS string) END as string)
 AS `cce_17`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_18` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_18` AS string)), '') AS string) END as string)
 AS `cce_18`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cce_19` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cce_19` AS string)), '') AS string) END as string)
 AS `cce_19`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entcod_0` AS string)), '') AS string) END as string)
 AS `entcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`finrspfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`finrspfcy_0` AS string)), '') AS string) END as string)
 AS `finrspfcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`aggifaflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`aggifaflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `aggifaflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gte_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gte_0` AS string)), '') AS string) END as string)
 AS `gte_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`numvcr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`numvcr_0` AS string)), '') AS string) END as string)
 AS `numvcr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`palnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`palnum_0` AS string)), '') AS string) END as string)
 AS `palnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ctrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ctrnum_0` AS string)), '') AS string) END as string)
 AS `ctrnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`betcpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`betcpy_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `betcpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dludat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dludat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `dludat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`newltidat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`newltidat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `newltidat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cremvtdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cremvtdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `cremvtdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cremvttim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cremvttim_0` AS string)), '') AS string) END as string)
 AS `cremvttim_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cremvtseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cremvtseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `cremvtseq_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pronum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pronum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pronum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cretim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cretim_0` AS string)), '') AS string) END as string)
 AS `cretim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creation_user_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddattim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auuid_0` AS string)), '') AS string) END as string)
 AS `auuid_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `accdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zoriserial_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zoriserial_0` AS string)), '') AS string) END as string)
 AS `zoriserial_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `row_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`live`.`stojou` AS source_table

WHERE 
    safe_cast(_synched_from_source_at as timestamp)
 > (SELECT max(_synched_from_source_at) FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stojou` )


 ) AS un_ordered


         ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.row_id = DBT_INTERNAL_DEST.row_id
        

    
    when matched then update set
        `updtick_0` = DBT_INTERNAL_SOURCE.`updtick_0`,`warehouse` = DBT_INTERNAL_SOURCE.`warehouse`,`updcod_0` = DBT_INTERNAL_SOURCE.`updcod_0`,`x3_sku` = DBT_INTERNAL_SOURCE.`x3_sku`,`journal_date` = DBT_INTERNAL_SOURCE.`journal_date`,`mvtseq_0` = DBT_INTERNAL_SOURCE.`mvtseq_0`,`mvtind_0` = DBT_INTERNAL_SOURCE.`mvtind_0`,`cstdat_0` = DBT_INTERNAL_SOURCE.`cstdat_0`,`csttim_0` = DBT_INTERNAL_SOURCE.`csttim_0`,`cstcou_0` = DBT_INTERNAL_SOURCE.`cstcou_0`,`owner_0` = DBT_INTERNAL_SOURCE.`owner_0`,`lot_0` = DBT_INTERNAL_SOURCE.`lot_0`,`slo_0` = DBT_INTERNAL_SOURCE.`slo_0`,`bpslot_0` = DBT_INTERNAL_SOURCE.`bpslot_0`,`location` = DBT_INTERNAL_SOURCE.`location`,`wrh_0` = DBT_INTERNAL_SOURCE.`wrh_0`,`serial_number` = DBT_INTERNAL_SOURCE.`serial_number`,`trstyp_0` = DBT_INTERNAL_SOURCE.`trstyp_0`,`trsfam_0` = DBT_INTERNAL_SOURCE.`trsfam_0`,`mvtdes_0` = DBT_INTERNAL_SOURCE.`mvtdes_0`,`pjt_0` = DBT_INTERNAL_SOURCE.`pjt_0`,`bprnum_0` = DBT_INTERNAL_SOURCE.`bprnum_0`,`document_type_code` = DBT_INTERNAL_SOURCE.`document_type_code`,`document_id` = DBT_INTERNAL_SOURCE.`document_id`,`document_line` = DBT_INTERNAL_SOURCE.`document_line`,`vcrtypori_0` = DBT_INTERNAL_SOURCE.`vcrtypori_0`,`vcrnumori_0` = DBT_INTERNAL_SOURCE.`vcrnumori_0`,`vcrlinori_0` = DBT_INTERNAL_SOURCE.`vcrlinori_0`,`vcrseqori_0` = DBT_INTERNAL_SOURCE.`vcrseqori_0`,`vcrtypreg_0` = DBT_INTERNAL_SOURCE.`vcrtypreg_0`,`vcrnumreg_0` = DBT_INTERNAL_SOURCE.`vcrnumreg_0`,`vcrlinreg_0` = DBT_INTERNAL_SOURCE.`vcrlinreg_0`,`usrfld1_0` = DBT_INTERNAL_SOURCE.`usrfld1_0`,`usrfld2_0` = DBT_INTERNAL_SOURCE.`usrfld2_0`,`usrfld3_0` = DBT_INTERNAL_SOURCE.`usrfld3_0`,`usrfld4_0` = DBT_INTERNAL_SOURCE.`usrfld4_0`,`x3_size_code` = DBT_INTERNAL_SOURCE.`x3_size_code`,`qtypcu_0` = DBT_INTERNAL_SOURCE.`qtypcu_0`,`pcustucoe_0` = DBT_INTERNAL_SOURCE.`pcustucoe_0`,`qtystu_0` = DBT_INTERNAL_SOURCE.`qtystu_0`,`stu_0` = DBT_INTERNAL_SOURCE.`stu_0`,`pcuori_0` = DBT_INTERNAL_SOURCE.`pcuori_0`,`pcustuori_0` = DBT_INTERNAL_SOURCE.`pcustuori_0`,`amtord_0` = DBT_INTERNAL_SOURCE.`amtord_0`,`amtval_0` = DBT_INTERNAL_SOURCE.`amtval_0`,`varord_0` = DBT_INTERNAL_SOURCE.`varord_0`,`varval_0` = DBT_INTERNAL_SOURCE.`varval_0`,`priord_0` = DBT_INTERNAL_SOURCE.`priord_0`,`prival_0` = DBT_INTERNAL_SOURCE.`prival_0`,`prinat_0` = DBT_INTERNAL_SOURCE.`prinat_0`,`amtval2_0` = DBT_INTERNAL_SOURCE.`amtval2_0`,`varval2_0` = DBT_INTERNAL_SOURCE.`varval2_0`,`prival2_0` = DBT_INTERNAL_SOURCE.`prival2_0`,`prinat2_0` = DBT_INTERNAL_SOURCE.`prinat2_0`,`priregflg_0` = DBT_INTERNAL_SOURCE.`priregflg_0`,`amtdev_0` = DBT_INTERNAL_SOURCE.`amtdev_0`,`amtdev2_0` = DBT_INTERNAL_SOURCE.`amtdev2_0`,`shldat_0` = DBT_INTERNAL_SOURCE.`shldat_0`,`stock_status` = DBT_INTERNAL_SOURCE.`stock_status`,`pot_0` = DBT_INTERNAL_SOURCE.`pot_0`,`act_0` = DBT_INTERNAL_SOURCE.`act_0`,`actqty_0` = DBT_INTERNAL_SOURCE.`actqty_0`,`qlyctldem_0` = DBT_INTERNAL_SOURCE.`qlyctldem_0`,`prnflg_0` = DBT_INTERNAL_SOURCE.`prnflg_0`,`regflg_0` = DBT_INTERNAL_SOURCE.`regflg_0`,`lbefmt_0` = DBT_INTERNAL_SOURCE.`lbefmt_0`,`lbenbr_0` = DBT_INTERNAL_SOURCE.`lbenbr_0`,`die_0` = DBT_INTERNAL_SOURCE.`die_0`,`die_1` = DBT_INTERNAL_SOURCE.`die_1`,`die_2` = DBT_INTERNAL_SOURCE.`die_2`,`die_3` = DBT_INTERNAL_SOURCE.`die_3`,`die_4` = DBT_INTERNAL_SOURCE.`die_4`,`die_5` = DBT_INTERNAL_SOURCE.`die_5`,`die_6` = DBT_INTERNAL_SOURCE.`die_6`,`die_7` = DBT_INTERNAL_SOURCE.`die_7`,`die_8` = DBT_INTERNAL_SOURCE.`die_8`,`die_9` = DBT_INTERNAL_SOURCE.`die_9`,`die_10` = DBT_INTERNAL_SOURCE.`die_10`,`die_11` = DBT_INTERNAL_SOURCE.`die_11`,`die_12` = DBT_INTERNAL_SOURCE.`die_12`,`die_13` = DBT_INTERNAL_SOURCE.`die_13`,`die_14` = DBT_INTERNAL_SOURCE.`die_14`,`die_15` = DBT_INTERNAL_SOURCE.`die_15`,`die_16` = DBT_INTERNAL_SOURCE.`die_16`,`die_17` = DBT_INTERNAL_SOURCE.`die_17`,`die_18` = DBT_INTERNAL_SOURCE.`die_18`,`die_19` = DBT_INTERNAL_SOURCE.`die_19`,`cce_0` = DBT_INTERNAL_SOURCE.`cce_0`,`cce_1` = DBT_INTERNAL_SOURCE.`cce_1`,`cce_2` = DBT_INTERNAL_SOURCE.`cce_2`,`cce_3` = DBT_INTERNAL_SOURCE.`cce_3`,`cce_4` = DBT_INTERNAL_SOURCE.`cce_4`,`cce_5` = DBT_INTERNAL_SOURCE.`cce_5`,`cce_6` = DBT_INTERNAL_SOURCE.`cce_6`,`cce_7` = DBT_INTERNAL_SOURCE.`cce_7`,`cce_8` = DBT_INTERNAL_SOURCE.`cce_8`,`cce_9` = DBT_INTERNAL_SOURCE.`cce_9`,`cce_10` = DBT_INTERNAL_SOURCE.`cce_10`,`cce_11` = DBT_INTERNAL_SOURCE.`cce_11`,`cce_12` = DBT_INTERNAL_SOURCE.`cce_12`,`cce_13` = DBT_INTERNAL_SOURCE.`cce_13`,`cce_14` = DBT_INTERNAL_SOURCE.`cce_14`,`cce_15` = DBT_INTERNAL_SOURCE.`cce_15`,`cce_16` = DBT_INTERNAL_SOURCE.`cce_16`,`cce_17` = DBT_INTERNAL_SOURCE.`cce_17`,`cce_18` = DBT_INTERNAL_SOURCE.`cce_18`,`cce_19` = DBT_INTERNAL_SOURCE.`cce_19`,`entcod_0` = DBT_INTERNAL_SOURCE.`entcod_0`,`finrspfcy_0` = DBT_INTERNAL_SOURCE.`finrspfcy_0`,`aggifaflg_0` = DBT_INTERNAL_SOURCE.`aggifaflg_0`,`gte_0` = DBT_INTERNAL_SOURCE.`gte_0`,`numvcr_0` = DBT_INTERNAL_SOURCE.`numvcr_0`,`palnum_0` = DBT_INTERNAL_SOURCE.`palnum_0`,`ctrnum_0` = DBT_INTERNAL_SOURCE.`ctrnum_0`,`betcpy_0` = DBT_INTERNAL_SOURCE.`betcpy_0`,`dludat_0` = DBT_INTERNAL_SOURCE.`dludat_0`,`newltidat_0` = DBT_INTERNAL_SOURCE.`newltidat_0`,`cremvtdat_0` = DBT_INTERNAL_SOURCE.`cremvtdat_0`,`cremvttim_0` = DBT_INTERNAL_SOURCE.`cremvttim_0`,`cremvtseq_0` = DBT_INTERNAL_SOURCE.`cremvtseq_0`,`expnum_0` = DBT_INTERNAL_SOURCE.`expnum_0`,`pronum_0` = DBT_INTERNAL_SOURCE.`pronum_0`,`credat_0` = DBT_INTERNAL_SOURCE.`credat_0`,`cretim_0` = DBT_INTERNAL_SOURCE.`cretim_0`,`creation_user_id` = DBT_INTERNAL_SOURCE.`creation_user_id`,`upddat_0` = DBT_INTERNAL_SOURCE.`upddat_0`,`updusr_0` = DBT_INTERNAL_SOURCE.`updusr_0`,`created_at` = DBT_INTERNAL_SOURCE.`created_at`,`upddattim_0` = DBT_INTERNAL_SOURCE.`upddattim_0`,`auuid_0` = DBT_INTERNAL_SOURCE.`auuid_0`,`accdat_0` = DBT_INTERNAL_SOURCE.`accdat_0`,`zoriserial_0` = DBT_INTERNAL_SOURCE.`zoriserial_0`,`row_id` = DBT_INTERNAL_SOURCE.`row_id`,`_synched_from_source_at` = DBT_INTERNAL_SOURCE.`_synched_from_source_at`
    

    when not matched then insert
        (`updtick_0`, `warehouse`, `updcod_0`, `x3_sku`, `journal_date`, `mvtseq_0`, `mvtind_0`, `cstdat_0`, `csttim_0`, `cstcou_0`, `owner_0`, `lot_0`, `slo_0`, `bpslot_0`, `location`, `wrh_0`, `serial_number`, `trstyp_0`, `trsfam_0`, `mvtdes_0`, `pjt_0`, `bprnum_0`, `document_type_code`, `document_id`, `document_line`, `vcrtypori_0`, `vcrnumori_0`, `vcrlinori_0`, `vcrseqori_0`, `vcrtypreg_0`, `vcrnumreg_0`, `vcrlinreg_0`, `usrfld1_0`, `usrfld2_0`, `usrfld3_0`, `usrfld4_0`, `x3_size_code`, `qtypcu_0`, `pcustucoe_0`, `qtystu_0`, `stu_0`, `pcuori_0`, `pcustuori_0`, `amtord_0`, `amtval_0`, `varord_0`, `varval_0`, `priord_0`, `prival_0`, `prinat_0`, `amtval2_0`, `varval2_0`, `prival2_0`, `prinat2_0`, `priregflg_0`, `amtdev_0`, `amtdev2_0`, `shldat_0`, `stock_status`, `pot_0`, `act_0`, `actqty_0`, `qlyctldem_0`, `prnflg_0`, `regflg_0`, `lbefmt_0`, `lbenbr_0`, `die_0`, `die_1`, `die_2`, `die_3`, `die_4`, `die_5`, `die_6`, `die_7`, `die_8`, `die_9`, `die_10`, `die_11`, `die_12`, `die_13`, `die_14`, `die_15`, `die_16`, `die_17`, `die_18`, `die_19`, `cce_0`, `cce_1`, `cce_2`, `cce_3`, `cce_4`, `cce_5`, `cce_6`, `cce_7`, `cce_8`, `cce_9`, `cce_10`, `cce_11`, `cce_12`, `cce_13`, `cce_14`, `cce_15`, `cce_16`, `cce_17`, `cce_18`, `cce_19`, `entcod_0`, `finrspfcy_0`, `aggifaflg_0`, `gte_0`, `numvcr_0`, `palnum_0`, `ctrnum_0`, `betcpy_0`, `dludat_0`, `newltidat_0`, `cremvtdat_0`, `cremvttim_0`, `cremvtseq_0`, `expnum_0`, `pronum_0`, `credat_0`, `cretim_0`, `creation_user_id`, `upddat_0`, `updusr_0`, `created_at`, `upddattim_0`, `auuid_0`, `accdat_0`, `zoriserial_0`, `row_id`, `_synched_from_source_at`)
    values
        (`updtick_0`, `warehouse`, `updcod_0`, `x3_sku`, `journal_date`, `mvtseq_0`, `mvtind_0`, `cstdat_0`, `csttim_0`, `cstcou_0`, `owner_0`, `lot_0`, `slo_0`, `bpslot_0`, `location`, `wrh_0`, `serial_number`, `trstyp_0`, `trsfam_0`, `mvtdes_0`, `pjt_0`, `bprnum_0`, `document_type_code`, `document_id`, `document_line`, `vcrtypori_0`, `vcrnumori_0`, `vcrlinori_0`, `vcrseqori_0`, `vcrtypreg_0`, `vcrnumreg_0`, `vcrlinreg_0`, `usrfld1_0`, `usrfld2_0`, `usrfld3_0`, `usrfld4_0`, `x3_size_code`, `qtypcu_0`, `pcustucoe_0`, `qtystu_0`, `stu_0`, `pcuori_0`, `pcustuori_0`, `amtord_0`, `amtval_0`, `varord_0`, `varval_0`, `priord_0`, `prival_0`, `prinat_0`, `amtval2_0`, `varval2_0`, `prival2_0`, `prinat2_0`, `priregflg_0`, `amtdev_0`, `amtdev2_0`, `shldat_0`, `stock_status`, `pot_0`, `act_0`, `actqty_0`, `qlyctldem_0`, `prnflg_0`, `regflg_0`, `lbefmt_0`, `lbenbr_0`, `die_0`, `die_1`, `die_2`, `die_3`, `die_4`, `die_5`, `die_6`, `die_7`, `die_8`, `die_9`, `die_10`, `die_11`, `die_12`, `die_13`, `die_14`, `die_15`, `die_16`, `die_17`, `die_18`, `die_19`, `cce_0`, `cce_1`, `cce_2`, `cce_3`, `cce_4`, `cce_5`, `cce_6`, `cce_7`, `cce_8`, `cce_9`, `cce_10`, `cce_11`, `cce_12`, `cce_13`, `cce_14`, `cce_15`, `cce_16`, `cce_17`, `cce_18`, `cce_19`, `entcod_0`, `finrspfcy_0`, `aggifaflg_0`, `gte_0`, `numvcr_0`, `palnum_0`, `ctrnum_0`, `betcpy_0`, `dludat_0`, `newltidat_0`, `cremvtdat_0`, `cremvttim_0`, `cremvtseq_0`, `expnum_0`, `pronum_0`, `credat_0`, `cretim_0`, `creation_user_id`, `upddat_0`, `updusr_0`, `created_at`, `upddattim_0`, `auuid_0`, `accdat_0`, `zoriserial_0`, `row_id`, `_synched_from_source_at`)


  
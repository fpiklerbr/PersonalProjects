

  














































































































































 

SELECT   `updtick_0`,  `delivery_id`,  `delivery_line`,  `cpy_0`,  `sohcat_0`,  `x3_order_id`,  `x3_order_line`,  `soqseq_0`,  `prhnum_0`,  `prelin_0`,  `bpcord_0`,  `bpaadd_0`,  `itmref_0`,  `itmdes1_0`,  `itmdes_0`,  `vacitm_0`,  `vacitm_1`,  `vacitm_2`,  `stofcy_0`,  `useplc_0`,  `shidat_0`,  `rep1_0`,  `rep2_0`,  `reprat1_0`,  `reprat2_0`,  `repcoe_0`,  `gropri_0`,  `priren_0`,  `netpri_0`,  `netprinot_0`,  `netpriati_0`,  `pfm_0`,  `cprpri_0`,  `discrgval1_0`,  `discrgval2_0`,  `discrgval3_0`,  `discrgval4_0`,  `discrgval5_0`,  `discrgval6_0`,  `discrgval7_0`,  `discrgval8_0`,  `discrgval9_0`,  `discrgren1_0`,  `discrgren2_0`,  `discrgren3_0`,  `discrgren4_0`,  `discrgren5_0`,  `discrgren6_0`,  `discrgren7_0`,  `discrgren8_0`,  `discrgren9_0`,  `vat_0`,  `vat_1`,  `vat_2`,  `clcamt1_0`,  `clcamt2_0`,  `dsplinflg_0`,  `ddtanum_0`,  `ddtanum_1`,  `ddtanum_2`,  `ddtanum_3`,  `ddtanum_4`,  `ddtanum_5`,  `ddtanum_6`,  `ddtanum_7`,  `ddtanum_8`,  `ddtanot_0`,  `ddtanot_1`,  `ddtanot_2`,  `ddtanot_3`,  `ddtanot_4`,  `ddtanot_5`,  `ddtanot_6`,  `ddtanot_7`,  `ddtanot_8`,  `qty_0`,  `qtystu_0`,  `rtnqty_0`,  `rtnqtystu_0`,  `wrtqty_0`,  `wrtqtystu_0`,  `oalqtystu_0`,  `pacqtystu_0`,  `sau_0`,  `stu_0`,  `saustucoe_0`,  `tsicod_0`,  `tsicod_1`,  `tsicod_2`,  `tsicod_3`,  `tsicod_4`,  `pck_0`,  `pckcap_0`,  `lintyp_0`,  `focflg_0`,  `orilin_0`,  `stomgtcod_0`,  `lot_0`,  `sta_0`,  `loc_0`,  `weu_0`,  `untwei_0`,  `sddtex_0`,  `prptex_0`,  `geocod_0`,  `insctyflg_0`,  `vts_0`,  `vtc_0`,  `taxgeoflg_0`,  `taxflg_0`,  `taxregflg_0`,  `rattaxlin_0`,  `bastaxlin_0`,  `ndeprnbom_0`,  `invprnbom_0`,  `rcpflg_0`,  `rcpqtystu_0`,  `vcrtypori_0`,  `vcrnumori_0`,  `vcrlinori_0`,  `vcrseqori_0`,  `dsplinwei_0`,  `dsplinvol_0`,  `dspweu_0`,  `dspvou_0`,  `wrh_0`,  `expnum_0`,  `impnumlig_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `sdhcat_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `xa_pcksts_0`,  `xa_pckqty_0`,  `xa_expqty_0`,  `xb_bolnum_0`,  `zsaudes_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) END as string)
 AS `delivery_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sohcat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) END as string)
 AS `x3_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `x3_order_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soqseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soqseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `soqseq_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prhnum_0` AS string)), '') AS string) END as string)
 AS `prhnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prelin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prelin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prelin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) END as string)
 AS `bpcord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `itmref_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) END as string)
 AS `itmdes1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes_0` AS string)), '') AS string) END as string)
 AS `itmdes_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vacitm_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vacitm_0` AS string)), '') AS string) END as string)
 AS `vacitm_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vacitm_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vacitm_1` AS string)), '') AS string) END as string)
 AS `vacitm_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vacitm_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vacitm_2` AS string)), '') AS string) END as string)
 AS `vacitm_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `stofcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`useplc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`useplc_0` AS string)), '') AS string) END as string)
 AS `useplc_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `shidat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rep1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rep1_0` AS string)), '') AS string) END as string)
 AS `rep1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rep2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rep2_0` AS string)), '') AS string) END as string)
 AS `rep2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reprat1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reprat1_0` AS string)), '') AS string) END as numeric)
 AS `reprat1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reprat2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reprat2_0` AS string)), '') AS string) END as numeric)
 AS `reprat2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`repcoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`repcoe_0` AS string)), '') AS string) END as numeric)
 AS `repcoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) END as numeric)
 AS `gropri_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `priren_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) END as numeric)
 AS `netpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netprinot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netprinot_0` AS string)), '') AS string) END as numeric)
 AS `netprinot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpriati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpriati_0` AS string)), '') AS string) END as numeric)
 AS `netpriati_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pfm_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pfm_0` AS string)), '') AS string) END as numeric)
 AS `pfm_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) END as numeric)
 AS `cprpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval1_0` AS string)), '') AS string) END as numeric)
 AS `discrgval1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval2_0` AS string)), '') AS string) END as numeric)
 AS `discrgval2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval3_0` AS string)), '') AS string) END as numeric)
 AS `discrgval3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval4_0` AS string)), '') AS string) END as numeric)
 AS `discrgval4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval5_0` AS string)), '') AS string) END as numeric)
 AS `discrgval5_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval6_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval6_0` AS string)), '') AS string) END as numeric)
 AS `discrgval6_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval7_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval7_0` AS string)), '') AS string) END as numeric)
 AS `discrgval7_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval8_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval8_0` AS string)), '') AS string) END as numeric)
 AS `discrgval8_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval9_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval9_0` AS string)), '') AS string) END as numeric)
 AS `discrgval9_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren1_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren1_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren2_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren3_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren3_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren4_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren4_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren5_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren5_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren6_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren6_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren6_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren7_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren7_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren7_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren8_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren8_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren8_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgren9_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgren9_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `discrgren9_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_0` AS string)), '') AS string) END as string)
 AS `vat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_1` AS string)), '') AS string) END as string)
 AS `vat_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_2` AS string)), '') AS string) END as string)
 AS `vat_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt1_0` AS string)), '') AS string) END as numeric)
 AS `clcamt1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`clcamt2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`clcamt2_0` AS string)), '') AS string) END as numeric)
 AS `clcamt2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsplinflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsplinflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `dsplinflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_1` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_2` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_3` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_4` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_5` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_5`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_6` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_6`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_7` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_7`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanum_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanum_8` AS string)), '') AS string) END as float64)
 as int64)
 AS `ddtanum_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_0` AS string)), '') AS string) END as numeric)
 AS `ddtanot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_1` AS string)), '') AS string) END as numeric)
 AS `ddtanot_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_2` AS string)), '') AS string) END as numeric)
 AS `ddtanot_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_3` AS string)), '') AS string) END as numeric)
 AS `ddtanot_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_4` AS string)), '') AS string) END as numeric)
 AS `ddtanot_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_5` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_5` AS string)), '') AS string) END as numeric)
 AS `ddtanot_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_6` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_6` AS string)), '') AS string) END as numeric)
 AS `ddtanot_6`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_7` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_7` AS string)), '') AS string) END as numeric)
 AS `ddtanot_7`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ddtanot_8` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ddtanot_8` AS string)), '') AS string) END as numeric)
 AS `ddtanot_8`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) END as numeric)
 AS `qty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtnqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtnqty_0` AS string)), '') AS string) END as numeric)
 AS `rtnqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rtnqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rtnqtystu_0` AS string)), '') AS string) END as numeric)
 AS `rtnqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrtqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrtqty_0` AS string)), '') AS string) END as numeric)
 AS `wrtqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrtqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrtqtystu_0` AS string)), '') AS string) END as numeric)
 AS `wrtqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oalqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oalqtystu_0` AS string)), '') AS string) END as numeric)
 AS `oalqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pacqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pacqtystu_0` AS string)), '') AS string) END as numeric)
 AS `pacqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) END as string)
 AS `sau_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stu_0` AS string)), '') AS string) END as string)
 AS `stu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`saustucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`saustucoe_0` AS string)), '') AS string) END as numeric)
 AS `saustucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_0` AS string)), '') AS string) END as string)
 AS `tsicod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_1` AS string)), '') AS string) END as string)
 AS `tsicod_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_2` AS string)), '') AS string) END as string)
 AS `tsicod_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_3` AS string)), '') AS string) END as string)
 AS `tsicod_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tsicod_4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tsicod_4` AS string)), '') AS string) END as string)
 AS `tsicod_4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pck_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pck_0` AS string)), '') AS string) END as string)
 AS `pck_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pckcap_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pckcap_0` AS string)), '') AS string) END as numeric)
 AS `pckcap_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lintyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `lintyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`focflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`focflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `focflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orilin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orilin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `orilin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stomgtcod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stomgtcod_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `stomgtcod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) END as string)
 AS `lot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as string)
 AS `sta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) END as string)
 AS `loc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) END as string)
 AS `weu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`untwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`untwei_0` AS string)), '') AS string) END as numeric)
 AS `untwei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sddtex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sddtex_0` AS string)), '') AS string) END as string)
 AS `sddtex_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prptex_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prptex_0` AS string)), '') AS string) END as string)
 AS `prptex_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`geocod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`geocod_0` AS string)), '') AS string) END as string)
 AS `geocod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`insctyflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`insctyflg_0` AS string)), '') AS string) END as string)
 AS `insctyflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vts_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vts_0` AS string)), '') AS string) END as string)
 AS `vts_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vtc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vtc_0` AS string)), '') AS string) END as string)
 AS `vtc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxgeoflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxgeoflg_0` AS string)), '') AS string) END as string)
 AS `taxgeoflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `taxflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxregflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxregflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `taxregflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rattaxlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rattaxlin_0` AS string)), '') AS string) END as numeric)
 AS `rattaxlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bastaxlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bastaxlin_0` AS string)), '') AS string) END as numeric)
 AS `bastaxlin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ndeprnbom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ndeprnbom_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `ndeprnbom_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invprnbom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invprnbom_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `invprnbom_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `rcpflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpqtystu_0` AS string)), '') AS string) END as numeric)
 AS `rcpqtystu_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsplinwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsplinwei_0` AS string)), '') AS string) END as numeric)
 AS `dsplinwei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsplinvol_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsplinvol_0` AS string)), '') AS string) END as numeric)
 AS `dsplinvol_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspweu_0` AS string)), '') AS string) END as string)
 AS `dspweu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dspvou_0` AS string)), '') AS string) END as string)
 AS `dspvou_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) END as string)
 AS `wrh_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`impnumlig_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`impnumlig_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `impnumlig_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhcat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhcat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sdhcat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credattim_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credattim_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xa_pcksts_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xa_pcksts_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `xa_pcksts_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xa_pckqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xa_pckqty_0` AS string)), '') AS string) END as numeric)
 AS `xa_pckqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xa_expqty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xa_expqty_0` AS string)), '') AS string) END as numeric)
 AS `xa_expqty_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_bolnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_bolnum_0` AS string)), '') AS string) END as string)
 AS `xb_bolnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zsaudes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zsaudes_0` AS string)), '') AS string) END as string)
 AS `zsaudes_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`sdeliveryd` AS source_table

 ) AS un_ordered


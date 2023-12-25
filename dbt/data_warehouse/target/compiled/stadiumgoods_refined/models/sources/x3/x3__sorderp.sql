




  


















































































 

SELECT   `updtick_0`,  `x3_order_id`,  `x3_order_line`,  `sequence_number`,  `cpy_0`,  `sohcat_0`,  `strdat_0`,  `enddat_0`,  `bpcord_0`,  `bpaadd_0`,  `cndnam_0`,  `bpcinv_0`,  `order_warehouse`,  `salfcy_0`,  `x3_sku`,  `itmdes1_0`,  `itmdes_0`,  `itmrefbpc_0`,  `vacitm_0`,  `vacitm_1`,  `vacitm_2`,  `rep1_0`,  `rep2_0`,  `reprat1_0`,  `reprat2_0`,  `repcoe_0`,  `price`,  `priren_0`,  `netpri_0`,  `price_excluding_tax`,  `price_including_tax`,  `pfm_0`,  `cprpri_0`,  `discount`,  `gift_card`,  `shipping`,  `tax`,  `discrgval5_0`,  `discrgval6_0`,  `discrgval7_0`,  `discrgval8_0`,  `discrgval9_0`,  `discrgren1_0`,  `discrgren2_0`,  `discrgren3_0`,  `discrgren4_0`,  `discrgren5_0`,  `discrgren6_0`,  `discrgren7_0`,  `discrgren8_0`,  `discrgren9_0`,  `vat_0`,  `vat_1`,  `vat_2`,  `clcamt1_0`,  `clcamt2_0`,  `x3_size_code`,  `stu_0`,  `saustucoe_0`,  `tsicod_0`,  `tsicod_1`,  `tsicod_2`,  `tsicod_3`,  `tsicod_4`,  `soqsta_0`,  `lintyp_0`,  `focflg_0`,  `orilin_0`,  `sqhnum_0`,  `connum_0`,  `sqdlin_0`,  `linrevnum_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `zsoplin_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohnum_0` AS string)), '') AS string) END as string)
 AS `x3_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soplin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `x3_order_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sopseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sopseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sequence_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sohcat_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sohcat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`strdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`strdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `strdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`enddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`enddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `enddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) END as string)
 AS `bpcord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cndnam_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cndnam_0` AS string)), '') AS string) END as string)
 AS `cndnam_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcinv_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcinv_0` AS string)), '') AS string) END as string)
 AS `bpcinv_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `order_warehouse`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`salfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`salfcy_0` AS string)), '') AS string) END as string)
 AS `salfcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) END as string)
 AS `itmdes1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes_0` AS string)), '') AS string) END as string)
 AS `itmdes_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmrefbpc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmrefbpc_0` AS string)), '') AS string) END as string)
 AS `itmrefbpc_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) END as float64)
 AS `price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `priren_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) END as numeric)
 AS `netpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netprinot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netprinot_0` AS string)), '') AS string) END as float64)
 AS `price_excluding_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpriati_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpriati_0` AS string)), '') AS string) END as float64)
 AS `price_including_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pfm_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pfm_0` AS string)), '') AS string) END as numeric)
 AS `pfm_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cprpri_0` AS string)), '') AS string) END as numeric)
 AS `cprpri_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval1_0` AS string)), '') AS string) END as float64)
 AS `discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval2_0` AS string)), '') AS string) END as float64)
 AS `gift_card`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval3_0` AS string)), '') AS string) END as float64)
 AS `shipping`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discrgval4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discrgval4_0` AS string)), '') AS string) END as float64)
 AS `tax`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) END as string)
 AS `x3_size_code`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`soqsta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`soqsta_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `soqsta_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sqhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sqhnum_0` AS string)), '') AS string) END as string)
 AS `sqhnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`connum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`connum_0` AS string)), '') AS string) END as string)
 AS `connum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sqdlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sqdlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `sqdlin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linrevnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linrevnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linrevnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zsoplin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zsoplin_0` AS string)), '') AS string) END as string)
 AS `zsoplin_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`sorderp` AS source_table

 ) AS un_ordered




  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__porderp`
  OPTIONS()
  as 

  
































































 

SELECT   `updtick_0`,  `purchase_id`,  `purchase_line`,  `popseq_0`,  `popdat_0`,  `strdat_0`,  `cpy_0`,  `pohtyp_0`,  `linrevnum_0`,  `itmref_0`,  `itmdes1_0`,  `itmdes_0`,  `gross_price`,  `yprice1_0`,  `priren_0`,  `discrgval1_0`,  `discrgval2_0`,  `discrgval3_0`,  `discrgval4_0`,  `discrgval5_0`,  `discrgval6_0`,  `discrgval7_0`,  `discrgval8_0`,  `discrgval9_0`,  `discrgren1_0`,  `discrgren2_0`,  `discrgren3_0`,  `discrgren4_0`,  `discrgren5_0`,  `discrgren6_0`,  `discrgren7_0`,  `discrgren8_0`,  `discrgren9_0`,  `net_price`,  `linbuy_0`,  `prhfcy_0`,  `fcyadd_0`,  `pjt_0`,  `eecincrat_0`,  `oricry_0`,  `tsicod_0`,  `tsicod_1`,  `tsicod_2`,  `tsicod_3`,  `tsicod_4`,  `quaflg_0`,  `vat_0`,  `vat_1`,  `vat_2`,  `taxrcp_0`,  `taxiss_0`,  `taxoth1_0`,  `taxoth2_0`,  `popcreflg_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `mattol_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohnum_0` AS string)), '') AS string) END as string)
 AS `purchase_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`poplin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`poplin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `purchase_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`popseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`popseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `popseq_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`popdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`popdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `popdat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`strdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`strdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `strdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pohtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pohtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pohtyp_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linrevnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linrevnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `linrevnum_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gropri_0` AS string)), '') AS string) END as float64)
 AS `gross_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yprice1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yprice1_0` AS string)), '') AS string) END as numeric)
 AS `yprice1_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`priren_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `priren_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netpri_0` AS string)), '') AS string) END as float64)
 AS `net_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`linbuy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`linbuy_0` AS string)), '') AS string) END as string)
 AS `linbuy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prhfcy_0` AS string)), '') AS string) END as string)
 AS `prhfcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fcyadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fcyadd_0` AS string)), '') AS string) END as string)
 AS `fcyadd_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pjt_0` AS string)), '') AS string) END as string)
 AS `pjt_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eecincrat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eecincrat_0` AS string)), '') AS string) END as numeric)
 AS `eecincrat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oricry_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oricry_0` AS string)), '') AS string) END as string)
 AS `oricry_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quaflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quaflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `quaflg_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxrcp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxrcp_0` AS string)), '') AS string) END as string)
 AS `taxrcp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxiss_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxiss_0` AS string)), '') AS string) END as string)
 AS `taxiss_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxoth1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxoth1_0` AS string)), '') AS string) END as string)
 AS `taxoth1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taxoth2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taxoth2_0` AS string)), '') AS string) END as string)
 AS `taxoth2_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`popcreflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`popcreflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `popcreflg_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mattol_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mattol_0` AS string)), '') AS string) END as string)
 AS `mattol_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`porderp` AS source_table

 ) AS un_ordered

;


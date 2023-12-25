

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__spackd`
  OPTIONS()
  as 

  


















































 

SELECT   `updtick_0`,  `stofcy_0`,  `cpy_0`,  `vcrtyp_0`,  `delivery_id`,  `delivery_line`,  `vcrseq_0`,  `pacseq_0`,  `pacnum_0`,  `pacind_0`,  `pck_0`,  `itmref_0`,  `itmdes1_0`,  `quantity`,  `sau_0`,  `qtypcu_0`,  `pcu_0`,  `pcustucoe_0`,  `lot_0`,  `slo_0`,  `sernum_0`,  `palnum_0`,  `ctrnum_0`,  `netwei_0`,  `weu_0`,  `itmwei_0`,  `wstocou_0`,  `pckstkflg_0`,  `expnum_0`,  `credat_0`,  `creusr_0`,  `upddat_0`,  `updusr_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `tracking_number`,  `xb_pickid_0`,  `xb_packid_0`,  `xb_growei_0`,  `xb_freight_0`,  `xb_upload_0`,  `xb_picked_0`,  `xb_pcktim_0`,  `xb_pckdat_0`,  `xb_pcklen_0`,  `xb_pckwid_0`,  `xb_pckhei_0`,  `xb_diu_0`,  `rowid`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `stofcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) END as string)
 AS `delivery_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrseq_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pacseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pacseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pacseq_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pacnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pacnum_0` AS string)), '') AS string) END as string)
 AS `pacnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pacind_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pacind_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pacind_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pck_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pck_0` AS string)), '') AS string) END as string)
 AS `pck_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `itmref_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmdes1_0` AS string)), '') AS string) END as string)
 AS `itmdes1_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sau_0` AS string)), '') AS string) END as string)
 AS `sau_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtypcu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtypcu_0` AS string)), '') AS string) END as numeric)
 AS `qtypcu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) END as string)
 AS `pcu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcustucoe_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcustucoe_0` AS string)), '') AS string) END as numeric)
 AS `pcustucoe_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) END as string)
 AS `lot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) END as string)
 AS `slo_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) END as string)
 AS `sernum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`palnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`palnum_0` AS string)), '') AS string) END as string)
 AS `palnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ctrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ctrnum_0` AS string)), '') AS string) END as string)
 AS `ctrnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netwei_0` AS string)), '') AS string) END as numeric)
 AS `netwei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) END as string)
 AS `weu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmwei_0` AS string)), '') AS string) END as numeric)
 AS `itmwei_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wstocou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wstocou_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `wstocou_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pckstkflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pckstkflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pckstkflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `credat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `upddat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_trknum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_trknum_0` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_pickid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_pickid_0` AS string)), '') AS string) END as string)
 AS `xb_pickid_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_packid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_packid_0` AS string)), '') AS string) END as string)
 AS `xb_packid_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_growei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_growei_0` AS string)), '') AS string) END as numeric)
 AS `xb_growei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_freight_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_freight_0` AS string)), '') AS string) END as numeric)
 AS `xb_freight_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_upload_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_upload_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `xb_upload_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_picked_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_picked_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `xb_picked_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_pcktim_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_pcktim_0` AS string)), '') AS string) END as string)
 AS `xb_pcktim_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_pckdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_pckdat_0` AS string)), '') AS string) END as string)
 AS `xb_pckdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_pcklen_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_pcklen_0` AS string)), '') AS string) END as numeric)
 AS `xb_pcklen_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_pckwid_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_pckwid_0` AS string)), '') AS string) END as numeric)
 AS `xb_pckwid_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_pckhei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_pckhei_0` AS string)), '') AS string) END as numeric)
 AS `xb_pckhei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`xb_diu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`xb_diu_0` AS string)), '') AS string) END as string)
 AS `xb_diu_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`spackd` AS source_table

 ) AS un_ordered

;


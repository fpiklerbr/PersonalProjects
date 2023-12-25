

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stoall`
  OPTIONS()
  as 

  










































 

SELECT   `updtick_0`,  `warehouse`,  `x3_sku`,  `chronological_stock`,  `alldat_0`,  `seq_0`,  `alltyp_0`,  `document_type_code`,  `document_id`,  `document_line`,  `vcrseq_0`,  `qtystu_0`,  `qtystuact_0`,  `wrh_0`,  `loc_0`,  `lot_0`,  `slo_0`,  `sta_0`,  `sernum_0`,  `srgloc_0`,  `defwrh_0`,  `defloc_0`,  `defloctyp_0`,  `srgqtystu_0`,  `srgnum_0`,  `srglin_0`,  `prenum_0`,  `besdat_0`,  `mvtdes_0`,  `bprnum_0`,  `bpaadd_0`,  `scoflg_0`,  `precod_0`,  `expnum_0`,  `creation_date`,  `creusr_0`,  `upddat_0`,  `updusr_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `rowid`
    , `_raw__synched_from_source_at`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stocou_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stocou_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `chronological_stock`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`alldat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`alldat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `alldat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `seq_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`alltyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`alltyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `alltyp_0`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrseq_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrseq_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrseq_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystu_0` AS string)), '') AS string) END as numeric)
 AS `qtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtystuact_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtystuact_0` AS string)), '') AS string) END as numeric)
 AS `qtystuact_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wrh_0` AS string)), '') AS string) END as string)
 AS `wrh_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loc_0` AS string)), '') AS string) END as string)
 AS `loc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lot_0` AS string)), '') AS string) END as string)
 AS `lot_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`slo_0` AS string)), '') AS string) END as string)
 AS `slo_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sta_0` AS string)), '') AS string) END as string)
 AS `sta_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) END as string)
 AS `sernum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srgloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srgloc_0` AS string)), '') AS string) END as string)
 AS `srgloc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`defwrh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`defwrh_0` AS string)), '') AS string) END as string)
 AS `defwrh_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`defloc_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`defloc_0` AS string)), '') AS string) END as string)
 AS `defloc_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`defloctyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`defloctyp_0` AS string)), '') AS string) END as string)
 AS `defloctyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srgqtystu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srgqtystu_0` AS string)), '') AS string) END as numeric)
 AS `srgqtystu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srgnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srgnum_0` AS string)), '') AS string) END as string)
 AS `srgnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`srglin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`srglin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `srglin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prenum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prenum_0` AS string)), '') AS string) END as string)
 AS `prenum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`besdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`besdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `besdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mvtdes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mvtdes_0` AS string)), '') AS string) END as string)
 AS `mvtdes_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bprnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bprnum_0` AS string)), '') AS string) END as string)
 AS `bprnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scoflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scoflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `scoflg_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`precod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`precod_0` AS string)), '') AS string) END as string)
 AS `precod_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expnum_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `expnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `creation_date`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`stoall` AS source_table

 ) AS un_ordered

;


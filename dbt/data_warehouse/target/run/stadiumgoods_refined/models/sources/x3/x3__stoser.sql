

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stoser`
  OPTIONS()
  as 

  





























 

SELECT   `updtick_0`,  `x3_sku`,  `serial_number`,  `warehouse`,  `document_type_code`,  `document_id`,  `document_line`,  `receipt_date`,  `rcpfcy_0`,  `receipt_document_type_code`,  `receipt_document_id`,  `receipt_document_line`,  `bpcnum_0`,  `bpaadd_0`,  `issue_document_type_code`,  `issue_document_id`,  `issue_document_line`,  `issue_date`,  `guaenddat_0`,  `expnum_0`,  `creation_date`,  `creusr_0`,  `upddat_0`,  `updusr_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `rowid`
    , `_raw_zoriserial_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sernum_0` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `warehouse`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpdat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `receipt_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpfcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpfcy_0` AS string)), '') AS string) END as string)
 AS `rcpfcy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpvcrtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpvcrtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `receipt_document_type_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpvcrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpvcrnum_0` AS string)), '') AS string) END as string)
 AS `receipt_document_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rcpvcrlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rcpvcrlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `receipt_document_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcnum_0` AS string)), '') AS string) END as string)
 AS `bpcnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhtyp_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `issue_document_type_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) END as string)
 AS `issue_document_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sddlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `issue_document_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issdat_0` AS string)), '') AS string) END as timestamp)
 as date)
 AS `issue_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`guaenddat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`guaenddat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `guaenddat_0`

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


  , `zoriserial_0` AS `_raw_zoriserial_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`stoser` AS source_table

 ) AS un_ordered

;




  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stopreh`
  OPTIONS()
  as 

  





































 

SELECT   `updtick_0`,  `pick_id`,  `stofcy_0`,  `cpy_0`,  `oriprh_0`,  `prlnum_0`,  `sdhnum_0`,  `sdhtyp_0`,  `bpcord_0`,  `bpaadd_0`,  `shidat_0`,  `dlvdat_0`,  `bptnum_0`,  `drn_0`,  `precod_0`,  `delivery_flag_code`,  `delivery_flag`,  `pacflg_0`,  `pacnbr_0`,  `prnnpr_0`,  `trscod_0`,  `weu_0`,  `growei_0`,  `netwei_0`,  `prptex1_0`,  `prptex2_0`,  `preusr_0`,  `expnum_0`,  `creusr_0`,  `credat_0`,  `updusr_0`,  `upddat_0`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `rowid`
    , `_raw_zautdlvprh_0`
    , `_raw_zpronum_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , CASE delivery_flag_code
WHEN 0 THEN cast( 'None' AS string)
WHEN 1 THEN cast( 'In process' AS string)
WHEN 2 THEN cast( 'Deliverable' AS string)
WHEN 3 THEN cast( 'Delivered' AS string)
WHEN 4 THEN cast( 'Cancelled' AS string)
ELSE cast(delivery_flag_code AS string)
END AS `delivery_flag` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prhnum_0` AS string)), '') AS string) END as string)
 AS `pick_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stofcy_0` AS string)), '') AS string) END as string)
 AS `stofcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cpy_0` AS string)), '') AS string) END as string)
 AS `cpy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`oriprh_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`oriprh_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `oriprh_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prlnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prlnum_0` AS string)), '') AS string) END as string)
 AS `prlnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhnum_0` AS string)), '') AS string) END as string)
 AS `sdhnum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sdhtyp_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sdhtyp_0` AS string)), '') AS string) END as string)
 AS `sdhtyp_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpcord_0` AS string)), '') AS string) END as string)
 AS `bpcord_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bpaadd_0` AS string)), '') AS string) END as string)
 AS `bpaadd_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shidat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `shidat_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvdat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvdat_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `dlvdat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bptnum_0` AS string)), '') AS string) END as string)
 AS `bptnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`drn_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`drn_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `drn_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`precod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`precod_0` AS string)), '') AS string) END as string)
 AS `precod_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dlvflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dlvflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_flag_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pacflg_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pacflg_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pacflg_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pacnbr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pacnbr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `pacnbr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prnnpr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prnnpr_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `prnnpr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trscod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trscod_0` AS string)), '') AS string) END as string)
 AS `trscod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weu_0` AS string)), '') AS string) END as string)
 AS `weu_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`growei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`growei_0` AS string)), '') AS string) END as numeric)
 AS `growei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`netwei_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`netwei_0` AS string)), '') AS string) END as numeric)
 AS `netwei_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prptex1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prptex1_0` AS string)), '') AS string) END as string)
 AS `prptex1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prptex2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prptex2_0` AS string)), '') AS string) END as string)
 AS `prptex2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`preusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`preusr_0` AS string)), '') AS string) END as string)
 AS `preusr_0`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `rowid`


  , `zautdlvprh_0` AS `_raw_zautdlvprh_0`

  , `zpronum_0` AS `_raw_zpronum_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`stopreh` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;





  



























 

SELECT   `updtick_0`,  `yysinum_0`,  `ystofcy_0`,  `x3_sku`,  `yitmsiz_0`,  `serial_number`,  `consignor_id`,  `ycomrat_0`,  `commission_rate`,  `price`,  `ycurncy_0`,  `serial_condition_code_1`,  `serial_condition_code_2`,  `serial_condition_code_3`,  `serial_condition_code_4`,  `serial_condition_code_5`,  `note`,  `credattim_0`,  `upddattim_0`,  `auuid_0`,  `creusr_0`,  `updusr_0`,  `lmod_0`,  `vcrnum_0`,  `vcrlin_0`,  `original_serial`,  `row_id`
    , `_raw_zgropri_0`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , 
    safe_cast((ycomrat_0 / 100) as float64)
 AS `commission_rate` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updtick_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `updtick_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yysinum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yysinum_0` AS string)), '') AS string) END as string)
 AS `yysinum_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ystofcy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ystofcy_0` AS string)), '') AS string) END as string)
 AS `ystofcy_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yitmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yitmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yitmsiz_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yitmsiz_0` AS string)), '') AS string) END as string)
 AS `yitmsiz_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yserial_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yserial_0` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycnsgnr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycnsgnr_0` AS string)), '') AS string) END as string)
 AS `consignor_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycomrat_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycomrat_0` AS string)), '') AS string) END as float64)
 AS `ycomrat_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`yprice1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`yprice1_0` AS string)), '') AS string) END as float64)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycurncy_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycurncy_0` AS string)), '') AS string) END as string)
 AS `ycurncy_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycdtcd1_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycdtcd1_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `serial_condition_code_1`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycdtcd2_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycdtcd2_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `serial_condition_code_2`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycdtcd3_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycdtcd3_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `serial_condition_code_3`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycdtcd4_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycdtcd4_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `serial_condition_code_4`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ycdtcd5_0` AS string)), '') AS string) IN ('0','0.0','0.000','0.0000','0.00000','0.00000000','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ycdtcd5_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `serial_condition_code_5`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ynotes_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ynotes_0` AS string)), '') AS string) END as string)
 AS `note`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creusr_0` AS string)), '') AS string) END as string)
 AS `creusr_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updusr_0` AS string)), '') AS string) END as string)
 AS `updusr_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lmod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lmod_0` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `lmod_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrnum_0` AS string)), '') AS string) END as string)
 AS `vcrnum_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vcrlin_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vcrlin_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `vcrlin_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zoriserial_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zoriserial_0` AS string)), '') AS string) END as string)
 AS `original_serial`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rowid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rowid` AS string)), '') AS string) END as float64)
 as int64)
 AS `row_id`


  , `zgropri_0` AS `_raw_zgropri_0`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`yserinf` AS source_table

 ) AS source_select_statement

 ) AS un_ordered


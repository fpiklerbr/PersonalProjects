

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmsize`
  OPTIONS()
  as 

  





 

SELECT   `x3_sku`,  `uom_0`,  `x3_size_code`,  `description_0`,  `x3_size`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`itmref_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uom_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uom_0` AS string)), '') AS string) END as string)
 AS `uom_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pcu_0` AS string)), '') AS string) END as string)
 AS `x3_size_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description_0` AS string)), '') AS string) END as string)
 AS `description_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_0` AS string)), '') AS string) END as string)
 AS `x3_size`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`yitmsize` AS source_table

 ) AS un_ordered

;


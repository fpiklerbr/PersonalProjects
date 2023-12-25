

  






















 

SELECT   `x3_sku`,  `serial_number`,  `simple_sku`,  `manusku`,  `magsize`,  `warehouse_0`,  `is_available`,  `x3order_0`,  `mageorder_0`,  `price_0`,  `comment_0`,  `concod1_0`,  `concod2_0`,  `concod3_0`,  `concod4_0`,  `concod5_0`,  `contex1_0`,  `contex2_0`,  `contex3_0`,  `contex4_0`,  `contex5_0`,  `last_modified_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_0` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_0` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku_0` AS string)), '') AS string) END as string)
 AS `simple_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manusku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manusku` AS string)), '') AS string) END as string)
 AS `manusku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magsize` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magsize` AS string)), '') AS string) END as string)
 AS `magsize`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_0` AS string)), '') AS string) END as string)
 AS `warehouse_0`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`available_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`available_0` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_available`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`x3order_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`x3order_0` AS string)), '') AS string) END as string)
 AS `x3order_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mageorder_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mageorder_0` AS string)), '') AS string) END as string)
 AS `mageorder_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_0` AS string)), '') AS string) END as numeric)
 AS `price_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comment_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comment_0` AS string)), '') AS string) END as string)
 AS `comment_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod1_0` AS string)), '') AS string) END as string)
 AS `concod1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod2_0` AS string)), '') AS string) END as string)
 AS `concod2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod3_0` AS string)), '') AS string) END as string)
 AS `concod3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod4_0` AS string)), '') AS string) END as string)
 AS `concod4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`concod5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`concod5_0` AS string)), '') AS string) END as string)
 AS `concod5_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex1_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex1_0` AS string)), '') AS string) END as string)
 AS `contex1_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex2_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex2_0` AS string)), '') AS string) END as string)
 AS `contex2_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex3_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex3_0` AS string)), '') AS string) END as string)
 AS `contex3_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex4_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex4_0` AS string)), '') AS string) END as string)
 AS `contex4_0`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contex5_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contex5_0` AS string)), '') AS string) END as string)
 AS `contex5_0`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lmod_0` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lmod_0` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_modified_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`live`.`zserialupd` AS source_table

 ) AS un_ordered


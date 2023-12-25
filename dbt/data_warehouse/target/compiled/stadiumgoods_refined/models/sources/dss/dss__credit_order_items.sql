

  











 

SELECT   `credit_order_item_id`,  `credit_order_id`,  `third_party_id`,  `variant_id`,  `mpn`,  `quantity`,  `price`,  `submitted`,  `created_at`,  `updated_at`,  `paid_out_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `credit_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `credit_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `variant_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mpn` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mpn` AS string)), '') AS string) END as string)
 AS `mpn`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as string)
 AS `price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted` AS string)), '') AS string) END as float64)
 as int64)
 AS `submitted`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paid_out_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_out_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `paid_out_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`credit_order_items` AS source_table

 ) AS un_ordered


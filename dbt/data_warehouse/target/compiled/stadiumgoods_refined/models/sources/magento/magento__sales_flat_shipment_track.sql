


 











 

SELECT   `sales_flat_shipment_track_id`,  `sales_flat_shipment_id`,  `weight`,  `qty`,  `sales_flat_order_id`,  `track_number`,  `description`,  `title`,  `carrier_code`,  `created_at`,  `updated_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_shipment_track_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_shipment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight` AS string)), '') AS string) END as float64)
 AS `weight`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`track_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`track_number` AS string)), '') AS string) END as string)
 AS `track_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier_code` AS string)), '') AS string) END as string)
 AS `carrier_code`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_track` AS source_table

 ) AS un_ordered


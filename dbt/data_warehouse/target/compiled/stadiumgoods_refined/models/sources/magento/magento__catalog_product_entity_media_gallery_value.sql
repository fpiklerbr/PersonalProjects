

  





 

SELECT   `catalog_product_entity_media_gallery_id`,  `store_id`,  `image_label`,  `image_position`,  `image_is_disabled`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`value_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`value_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `catalog_product_entity_media_gallery_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label` AS string)), '') AS string) END as string)
 AS `image_label`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`position` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`position` AS string)), '') AS string) END as float64)
 as int64)
 AS `image_position`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`disabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`disabled` AS string)), '') AS string) END as float64)
 as int64)
 AS `image_is_disabled`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery_value` AS source_table

 ) AS un_ordered


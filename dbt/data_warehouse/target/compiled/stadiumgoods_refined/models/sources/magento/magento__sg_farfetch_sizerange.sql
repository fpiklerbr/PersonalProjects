

  

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_sizerange_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `category_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_size_scale_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizes` AS string)), '') AS string) END as string)
 AS `sizes`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ownership` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ownership` AS string)), '') AS string) END as string)
 AS `ownership`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `created_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizerange`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_sizerange_id` AS `sg_farfetch_sizerange_id`
  , `category_id` AS `category_id`
  , `fps_size_scale_id` AS `fps_size_scale_id`
  , `sizes` AS `sizes`
  , `ownership` AS `ownership`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
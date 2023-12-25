

  

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_sizescale_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizescale_guid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizescale_guid` AS string)), '') AS string) END as string)
 AS `sizescale_guid`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_size_scale_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizescale_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizescale_name` AS string)), '') AS string) END as string)
 AS `sizescale_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`friendly_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`friendly_name` AS string)), '') AS string) END as string)
 AS `friendly_name`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizescale`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_sizescale_id` AS `sg_farfetch_sizescale_id`
  , `sizescale_guid` AS `sizescale_guid`
  , `fps_size_scale_id` AS `fps_size_scale_id`
  , `sizescale_name` AS `sizescale_name`
  , `friendly_name` AS `friendly_name`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
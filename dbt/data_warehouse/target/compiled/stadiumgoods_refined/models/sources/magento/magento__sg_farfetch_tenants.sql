



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_tenant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant_name` AS string)), '') AS string) END as string)
 AS `fps_tenant_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) END as string)
 AS `fps_tenant_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_channel_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_channel_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `price_channel_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_order_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_order_channel` AS string)), '') AS string) END as string)
 AS `sg_order_channel`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`endpoint_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`endpoint_url` AS string)), '') AS string) END as string)
 AS `endpoint_url`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`client_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`client_id` AS string)), '') AS string) END as string)
 AS `client_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`client_secret` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`client_secret` AS string)), '') AS string) END as string)
 AS `client_secret`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`username` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`username` AS string)), '') AS string) END as string)
 AS `username`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`password` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`password` AS string)), '') AS string) END as string)
 AS `password`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grant_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grant_type` AS string)), '') AS string) END as string)
 AS `grant_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_tenants`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_tenant_id` AS `sg_farfetch_tenant_id`
  , `fps_tenant_name` AS `fps_tenant_name`
  , `fps_tenant_id` AS `fps_tenant_id`
  , `price_channel_id` AS `price_channel_id`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `sg_order_channel` AS `sg_order_channel`
  , `endpoint_url` AS `endpoint_url`
  , `client_id` AS `client_id`
  , `client_secret` AS `client_secret`
  , `username` AS `username`
  , `password` AS `password`
  , `grant_type` AS `grant_type`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
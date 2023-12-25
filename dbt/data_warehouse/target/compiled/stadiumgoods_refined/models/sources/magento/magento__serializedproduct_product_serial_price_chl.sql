



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `serializedproduct_product_serial_price_channel_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `channel_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`slug` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`slug` AS string)), '') AS string) END as string)
 AS `slug`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`conditional_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`conditional_status` AS string)), '') AS string) END as string)
 AS `conditional_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) END as string)
 AS `order_channel`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS `created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`flat_upcharge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`flat_upcharge` AS string)), '') AS string) END as numeric)
 AS `upcharge_flat`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`percentage_upcharge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`percentage_upcharge` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `upcharge_percentage`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`min_qty_to_push_threshold` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`min_qty_to_push_threshold` AS string)), '') AS string) END as float64)
 as int64)
 AS `min_qty_to_push_threshold`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_cap_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_cap_type` AS string)), '') AS string) END as string)
 AS `qty_cap_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_cap` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_cap` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_cap`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allotted_reservation_time_in_minutes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allotted_reservation_time_in_minutes` AS string)), '') AS string) END as float64)
 as int64)
 AS `allotted_reservation_time_in_minutes`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel_type` AS string)), '') AS string) END as string)
 AS `channel_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_price_channel`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `serializedproduct_product_serial_price_channel_id` AS `serializedproduct_product_serial_price_channel_id`
  , `channel_name` AS `channel_name`
  , `slug` AS `slug`
  , `conditional_status` AS `conditional_status`
  , `order_channel` AS `order_channel`
  , `created_at` AS `created_at`
  , `upcharge_flat` AS `upcharge_flat`
  , `upcharge_percentage` AS `upcharge_percentage`
  , `min_qty_to_push_threshold` AS `min_qty_to_push_threshold`
  , `qty_cap_type` AS `qty_cap_type`
  , `qty_cap` AS `qty_cap`
  , `allotted_reservation_time_in_minutes` AS `allotted_reservation_time_in_minutes`
  , `channel_type` AS `channel_type`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
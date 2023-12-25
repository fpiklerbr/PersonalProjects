



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_consignment_shipment_box_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipment_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`print_label_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`print_label_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `print_label_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizes` AS string)), '') AS string) END as string)
 AS `sizes`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`free` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`free` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`free` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`free` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_free`
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
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_shipment_boxes`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_consignment_shipment_box_id` AS `ether_consignment_shipment_box_id`
  , `shipment_id` AS `shipment_id`
  , `print_label_id` AS `print_label_id`
  , `sizes` AS `sizes`
  , `is_free` AS `is_free`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
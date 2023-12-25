



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `print_label_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response` AS string)), '') AS string) END as string)
 AS `response`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ticket_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `shipped_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivered_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivered_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `delivered_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box_name` AS string)), '') AS string) END as string)
 AS `box_name`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`received` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`received` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`received` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`received` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_received`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`estimated_delivery_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`estimated_delivery_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `estimated_delivery_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `print_label_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipment_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_url` AS string)), '') AS string) END as string)
 AS `label_url`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_url_provider` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_url_provider` AS string)), '') AS string) END as string)
 AS `tracking_url_provider`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attachment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attachment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `attachment_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier_token` AS string)), '') AS string) END as string)
 AS `carrier_token`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `received_at` AS `_raw_received_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`print_labels`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `print_label_id` AS `print_label_id`
  , `response` AS `response`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `ticket_id` AS `ticket_id`
  , `shipped_at` AS `shipped_at`
  , `delivered_at` AS `delivered_at`
  , `box_name` AS `box_name`
  , `is_received` AS `is_received`
  , `is_free` AS `is_free`
  , `estimated_delivery_at` AS `estimated_delivery_at`
  , `print_label_status` AS `print_label_status`
  , `tracking_number` AS `tracking_number`
  , `shipment_id` AS `shipment_id`
  , `label_url` AS `label_url`
  , `tracking_url_provider` AS `tracking_url_provider`
  , `attachment_id` AS `attachment_id`
  , `carrier_token` AS `carrier_token`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_received_at` AS `_raw_received_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
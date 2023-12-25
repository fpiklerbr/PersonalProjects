

  

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_intake_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_profile_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_profile_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_profile_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial` AS string)), '') AS string) END as string)
 AS `serial_number`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'received' AS string)
WHEN 1 THEN cast( 'rejected' AS string)
WHEN 2 THEN cast( 'pending' AS string)
WHEN 3 THEN cast( 'serialized' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`intake_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_status` AS string)), '') AS string) END AS string)
END AS `intake_status`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receipt_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receipt_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_intake_receipt_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rejection_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rejection_reason` AS string)), '') AS string) END as string)
 AS `rejection_reason`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bin_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bin_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_bin_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rejected_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rejected_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `rejected_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ticket_item_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ticket_item_token` AS string)), '') AS string) END as string)
 AS `ticket_item_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_product_variant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) END as string)
 AS `cost_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `cost`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`returned_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`returned_serial_number` AS string)), '') AS string) END as string)
 AS `returned_serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`conditions` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`conditions` AS string)), '') AS string) END as string)
 AS `conditions`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_intaken` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_intaken` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_intaken` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_intaken` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_intaken`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`items`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_wms_intake_item_id` AS `ether_wms_intake_item_id`
  , `product_profile_id` AS `product_profile_id`
  , `serial_number` AS `serial_number`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `intake_status` AS `intake_status`
  , `ether_wms_intake_receipt_id` AS `ether_wms_intake_receipt_id`
  , `rejection_reason` AS `rejection_reason`
  , `ether_wms_warehouse_bin_id` AS `ether_wms_warehouse_bin_id`
  , `lock_version` AS `lock_version`
  , `rejected_at` AS `rejected_at`
  , `ticket_item_number` AS `ticket_item_number`
  , `ether_wms_product_variant_id` AS `ether_wms_product_variant_id`
  , `base_currency` AS `base_currency`
  , `price_base_amount` AS `price_base_amount`
  , `cost` AS `cost`
  , `returned_serial_number` AS `returned_serial_number`
  , `conditions` AS `conditions`
  , `is_intaken` AS `is_intaken`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
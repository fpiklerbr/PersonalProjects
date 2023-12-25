



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_profile_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ticket_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `variant_size`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`condition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`condition` AS string)), '') AS string) END as string)
 AS `condition`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `original_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) END as string)
 AS `cost_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `cost_base_amount`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'modified' AS string)
WHEN 2 THEN cast( 'approved' AS string)
WHEN 3 THEN cast( 'rejected' AS string)
WHEN 4 THEN cast( 'expired' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `product_profile_status`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`content_matches` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`content_matches` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`content_matches` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`content_matches` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `content_matches`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `original_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_size` AS string)), '') AS string) END as string)
 AS `original_variant_size`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_condition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_condition` AS string)), '') AS string) END as string)
 AS `original_condition`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`returned_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`returned_serial_number` AS string)), '') AS string) END as string)
 AS `returned_serial_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_by_employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_by_employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `created_by_employee_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipment_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approved_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `approved_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `status_updated_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reintaken_from_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reintaken_from_serial_number` AS string)), '') AS string) END as string)
 AS `reintaken_from_serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `expires_at` AS `_raw_expires_at`
  , `expired_at` AS `_raw_expired_at`
  , `modified_by_id` AS `_raw_modified_by_id`
  , `modified_at` AS `_raw_modified_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_profiles`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `product_profile_id` AS `product_profile_id`
  , `ticket_id` AS `ticket_id`
  , `product_id` AS `product_id`
  , `quantity` AS `quantity`
  , `variant_size` AS `variant_size`
  , `condition` AS `condition`
  , `base_currency` AS `base_currency`
  , `price_base_amount` AS `price_base_amount`
  , `original_price_base_amount` AS `original_price_base_amount`
  , `cost_base_amount` AS `cost_base_amount`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `product_profile_status` AS `product_profile_status`
  , `content_matches` AS `content_matches`
  , `original_quantity` AS `original_quantity`
  , `original_variant_size` AS `original_variant_size`
  , `original_condition` AS `original_condition`
  , `returned_serial_number` AS `returned_serial_number`
  , `created_by_employee_id` AS `created_by_employee_id`
  , `shipment_id` AS `shipment_id`
  , `approved_at` AS `approved_at`
  , `status_updated_at` AS `status_updated_at`
  , `lock_version` AS `lock_version`
  , `reintaken_from_serial_number` AS `reintaken_from_serial_number`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_expires_at` AS `_raw_expires_at`
  , `_raw_expired_at` AS `_raw_expired_at`
  , `_raw_modified_by_id` AS `_raw_modified_by_id`
  , `_raw_modified_at` AS `_raw_modified_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
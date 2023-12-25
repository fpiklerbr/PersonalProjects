



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_bundle_payment_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bundle_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bundle_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_bundle_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stripe_payment_intent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stripe_payment_intent_id` AS string)), '') AS string) END as string)
 AS `stripe_payment_intent_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stripe_charge_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stripe_charge_id` AS string)), '') AS string) END as string)
 AS `stripe_charge_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stripe_compensation_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stripe_compensation_id` AS string)), '') AS string) END as string)
 AS `stripe_compensation_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stripe_refund_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stripe_refund_id` AS string)), '') AS string) END as string)
 AS `stripe_refund_id`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `payment_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`captured_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`captured_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `captured_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `refund_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stipend_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stipend_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `stipend_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refunded_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refunded_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `refunded_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`compensated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`compensated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `compensated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `source_bundle_payment_id` AS `source_bundle_payment_id`
  , `source_bundle_id` AS `source_bundle_id`
  , `stripe_payment_intent_id` AS `stripe_payment_intent_id`
  , `stripe_charge_id` AS `stripe_charge_id`
  , `stripe_compensation_id` AS `stripe_compensation_id`
  , `stripe_refund_id` AS `stripe_refund_id`
  , `payment_base_amount` AS `payment_base_amount`
  , `captured_at` AS `captured_at`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `refund_base_amount` AS `refund_base_amount`
  , `stipend_base_amount` AS `stipend_base_amount`
  , `refunded_at` AS `refunded_at`
  , `compensated_at` AS `compensated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
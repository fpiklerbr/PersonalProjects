



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_bundle_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `source_bundle_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `source_bundle_name`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `seller_user_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `source_bundle_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sold_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sold_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sold_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `buyer_user_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`review_sla_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`review_sla_deadline` AS string)), '') AS string) END as timestamp)
 as date)
 AS `review_sla_deadline`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_sla_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_sla_deadline` AS string)), '') AS string) END as timestamp)
 as date)
 AS `fulfillment_sla_deadline`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 AS `price_cents`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sold_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sold_price_cents` AS string)), '') AS string) END as numeric)
 AS `sold_price_cents`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approved_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `approved_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approved_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approved_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `approved_by_employee_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rejected_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rejected_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `rejected_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rejected_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rejected_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `rejected_by_employee_id`
  , CAST(NULL AS string) AS `rejected_reason`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_penalty_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_penalty_cents` AS string)), '') AS string) END as numeric)
 AS `seller_penalty_cents`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_penalized_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_penalized_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `seller_penalized_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`accepts_offers` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accepts_offers` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`accepts_offers` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`accepts_offers` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `offer_is_accepted`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_dtc_prices_sla_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_dtc_prices_sla_deadline` AS string)), '') AS string) END as timestamp)
 as date)
 AS `buyer_dtc_prices_sla_deadline`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_dtc_prices_confirmed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_dtc_prices_confirmed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `buyer_dtc_prices_confirmed_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`drop_off_sla_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`drop_off_sla_deadline` AS string)), '') AS string) END as timestamp)
 as date)
 AS `drop_off_sla_deadline`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `submitted_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancelled_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancelled_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `cancelled_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancelled_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancelled_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `cancelled_by_employee_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `allocated_at` AS `_raw_allocated_at`
  , `reserved_at` AS `_raw_reserved_at`
  , `fulfilled_at` AS `_raw_fulfilled_at`
  , `suggestion_sla_deadline` AS `_raw_suggestion_sla_deadline`
  , `rejection_reason` AS `_raw_rejection_reason`
  , `expires_at` AS `_raw_expires_at`
  , `lists_at` AS `_raw_lists_at`
  , `seller_commission_rate` AS `_raw_seller_commission_rate`
  , `buyer_commission_rate` AS `_raw_buyer_commission_rate`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundles`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(price_cents / 100 as numeric)
 AS `price`
  , 
    safe_cast(sold_price_cents / 100 as numeric)
 AS `sold_price`
  , 
    safe_cast(seller_penalty_cents / 100 as numeric)
 AS `seller_penalty`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `source_bundle_id` AS `source_bundle_id`
  , `source_bundle_number` AS `source_bundle_number`
  , `source_bundle_name` AS `source_bundle_name`
  , `seller_user_id` AS `seller_user_id`
  , `source_bundle_status` AS `source_bundle_status`
  , `sold_at` AS `sold_at`
  , `buyer_user_id` AS `buyer_user_id`
  , `review_sla_deadline` AS `review_sla_deadline`
  , `fulfillment_sla_deadline` AS `fulfillment_sla_deadline`
  , `price` AS `price`
  , `sold_price` AS `sold_price`
  , `approved_at` AS `approved_at`
  , `approved_by_employee_id` AS `approved_by_employee_id`
  , `rejected_at` AS `rejected_at`
  , `rejected_by_employee_id` AS `rejected_by_employee_id`
  , `rejected_reason` AS `rejected_reason`
  , `lock_version` AS `lock_version`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `seller_penalty` AS `seller_penalty`
  , `seller_penalized_at` AS `seller_penalized_at`
  , `offer_is_accepted` AS `offer_is_accepted`
  , `buyer_dtc_prices_sla_deadline` AS `buyer_dtc_prices_sla_deadline`
  , `buyer_dtc_prices_confirmed_at` AS `buyer_dtc_prices_confirmed_at`
  , `drop_off_sla_deadline` AS `drop_off_sla_deadline`
  , `submitted_at` AS `submitted_at`
  , `cancelled_at` AS `cancelled_at`
  , `cancelled_by_employee_id` AS `cancelled_by_employee_id`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_allocated_at` AS `_raw_allocated_at`
  , `_raw_reserved_at` AS `_raw_reserved_at`
  , `_raw_fulfilled_at` AS `_raw_fulfilled_at`
  , `_raw_suggestion_sla_deadline` AS `_raw_suggestion_sla_deadline`
  , `_raw_rejection_reason` AS `_raw_rejection_reason`
  , `_raw_expires_at` AS `_raw_expires_at`
  , `_raw_lists_at` AS `_raw_lists_at`
  , `_raw_seller_commission_rate` AS `_raw_seller_commission_rate`
  , `_raw_buyer_commission_rate` AS `_raw_buyer_commission_rate`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 
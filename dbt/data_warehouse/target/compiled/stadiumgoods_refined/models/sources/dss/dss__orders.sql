

  





























 

SELECT   `order_id`,  `third_party_id`,  `third_party_order_id`,  `third_party_order_number`,  `mag_order_id`,  `order_type`,  `sales_channel`,  `commission_amount`,  `payout_amount`,  to_hex(md5(cast(`metadata` as 
    string
))) AS `metadata`,  `fulfillment_status`,  `is_cancelled`,  `is_paid_out`,  `crossdock`,  `placed_at`,  `fulfilled_at`,  `created_at`,  `updated_at`,  `penalty_type`,  `penalty_rate`,  `commission_rate`,  `custom_commission_rate`,  `expected_fulfilled_at`,  `shipping_amount`,  `shipping_method`,  `sale_promotion_id`
    , `_raw_returned`
    , `_raw_cancellation_note`
    , `_raw_canceled_by_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_order_id` AS string)), '') AS string) END as string)
 AS `third_party_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_order_number` AS string)), '') AS string) END as string)
 AS `third_party_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`direct_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`direct_order_number` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_type` AS string)), '') AS string) END as string)
 AS `order_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) END as string)
 AS `sales_channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_amount` AS string)), '') AS string) END as numeric)
 AS `commission_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payout_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payout_amount` AS string)), '') AS string) END as numeric)
 AS `payout_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`metadata` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`metadata` AS string)), '') AS string) END as string)
 AS `metadata`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_status` AS string)), '') AS string) END as string)
 AS `fulfillment_status`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`cancelled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancelled` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`cancelled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancelled` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_cancelled`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`paid_out` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_out` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`paid_out` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_out` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_paid_out`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crossdock` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crossdock` AS string)), '') AS string) END as float64)
 as int64)
 AS `crossdock`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`placed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`placed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `placed_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfilled_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfilled_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `fulfilled_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`penalty_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`penalty_type` AS string)), '') AS string) END as string)
 AS `penalty_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`penalty_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`penalty_rate` AS string)), '') AS string) END as numeric)
 AS `penalty_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_rate` AS string)), '') AS string) END as numeric)
 AS `commission_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`custom_commission_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`custom_commission_rate` AS string)), '') AS string) END as numeric)
 AS `custom_commission_rate`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expected_fulfilled_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expected_fulfilled_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `expected_fulfilled_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as float64)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) END as string)
 AS `shipping_method`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sale_promotion_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sale_promotion_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sale_promotion_id`


  , `returned` AS `_raw_returned`

  , `cancellation_note` AS `_raw_cancellation_note`

  , `canceled_by_id` AS `_raw_canceled_by_id`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`orders` AS source_table

 ) AS un_ordered


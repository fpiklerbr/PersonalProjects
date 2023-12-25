

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_amazon_order`
  OPTIONS()
  as 


  























 

SELECT   `m2epro_order_id`,  `amazon_order_id`,  `seller_order_id`,  `is_afn_channel`,  `is_prime`,  `is_business`,  `status`,  `buyer_name`,  `buyer_email`,  `shipping_service`,  `shipping_address`,  `shipping_price`,  `shipping_dates`,  `paid_amount`,  `tax_details`,  `discount_details`,  `qty_shipped`,  `qty_unshipped`,  `currency`,  `updated_at`,  `created_at`,  `merchant_fulfillment_data`,  `merchant_fulfillment_label`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m2epro_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_order_id` AS string)), '') AS string) END as string)
 AS `amazon_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_order_id` AS string)), '') AS string) END as string)
 AS `seller_order_id`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_afn_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_afn_channel` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_afn_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_afn_channel` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_afn_channel`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_prime` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_prime` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_prime` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_prime` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_prime`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_business` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_business` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_business` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_business` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_business`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_name` AS string)), '') AS string) END as string)
 AS `buyer_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_email` AS string)), '') AS string) END as string)
 AS `buyer_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_service` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_service` AS string)), '') AS string) END as string)
 AS `shipping_service`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) END as string)
 AS `shipping_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_price` AS string)), '') AS string) END as float64)
 AS `shipping_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_dates` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_dates` AS string)), '') AS string) END as string)
 AS `shipping_dates`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paid_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_amount` AS string)), '') AS string) END as float64)
 AS `paid_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) END as string)
 AS `tax_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_details` AS string)), '') AS string) END as string)
 AS `discount_details`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_shipped` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_shipped` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_shipped`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_unshipped` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_unshipped` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_unshipped`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_update_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_update_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_create_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_fulfillment_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_fulfillment_data` AS string)), '') AS string) END as string)
 AS `merchant_fulfillment_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_fulfillment_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_fulfillment_label` AS string)), '') AS string) END as string)
 AS `merchant_fulfillment_label`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order` AS source_table

 ) AS un_ordered

;


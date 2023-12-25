

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_ebay_order`
  OPTIONS()
  as 

  



















 

SELECT   `m2epro_order_id`,  `ebay_order_id`,  `selling_manager_id`,  `buyer_name`,  `buyer_email`,  `buyer_user_id`,  `buyer_message`,  `buyer_tax_id`,  `paid_amount`,  `saved_amount`,  `currency`,  `checkout_status`,  `shipping_status`,  `payment_status`,  `shipping_details`,  `payment_details`,  `tax_details`,  `updated_at`,  `created_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m2epro_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ebay_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ebay_order_id` AS string)), '') AS string) END as string)
 AS `ebay_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`selling_manager_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`selling_manager_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `selling_manager_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_name` AS string)), '') AS string) END as string)
 AS `buyer_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_email` AS string)), '') AS string) END as string)
 AS `buyer_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_user_id` AS string)), '') AS string) END as string)
 AS `buyer_user_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_message` AS string)), '') AS string) END as string)
 AS `buyer_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_tax_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_tax_id` AS string)), '') AS string) END as string)
 AS `buyer_tax_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paid_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_amount` AS string)), '') AS string) END as numeric)
 AS `paid_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`saved_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`saved_amount` AS string)), '') AS string) END as numeric)
 AS `saved_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`checkout_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`checkout_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `checkout_status`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipping_status`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `payment_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_details` AS string)), '') AS string) END as string)
 AS `shipping_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_details` AS string)), '') AS string) END as string)
 AS `payment_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) END as string)
 AS `tax_details`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_update_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_update_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_create_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order` AS source_table

 ) AS un_ordered

;


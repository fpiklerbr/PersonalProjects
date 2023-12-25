

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_amazon_order_item`
  OPTIONS()
  as 

  














 

SELECT   `order_item_id`,  `amazon_order_item_id`,  `title`,  `sku`,  `general_id`,  `is_isbn_general_id`,  `price`,  `gift_price`,  `gift_message`,  `gift_type`,  `tax_details`,  `discount_details`,  `currency`,  `qty_purchased`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_order_item_id` AS string)), '') AS string) END as string)
 AS `amazon_order_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`general_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`general_id` AS string)), '') AS string) END as string)
 AS `general_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_isbn_general_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_isbn_general_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_isbn_general_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as numeric)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_price` AS string)), '') AS string) END as numeric)
 AS `gift_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) END as string)
 AS `gift_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_type` AS string)), '') AS string) END as string)
 AS `gift_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) END as string)
 AS `tax_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_details` AS string)), '') AS string) END as string)
 AS `discount_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_purchased` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_purchased` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_purchased`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order_item` AS source_table

 ) AS un_ordered

;


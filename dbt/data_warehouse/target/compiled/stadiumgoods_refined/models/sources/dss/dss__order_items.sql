

  
























 

SELECT   `order_item_id`,  `order_id`,  `product_id`,  `variant_id`,  `third_party_id`,  `third_party_line_item_id`,  `third_party_product_id`,  `third_party_variant_id`,  `serial_price`,  `quantity`,  `fulfillable_quantity`,  `order_item_state`,  `fulfilled_at`,  `created_at`,  `updated_at`,  `commission_amount`,  `payout_amount`,  `adjusted_sold_price`,  `paid_out_at`
    , `_raw_commission_rate`
    , `_raw_suggested_shipment_location_id`
    , `_raw_custom_commission_rate`
    , `_raw_sale_promotion_id`
    , `_raw_serial_number`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `variant_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_line_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_line_item_id` AS string)), '') AS string) END as string)
 AS `third_party_line_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_product_id` AS string)), '') AS string) END as string)
 AS `third_party_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_variant_id` AS string)), '') AS string) END as string)
 AS `third_party_variant_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sold_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sold_price` AS string)), '') AS string) END as float64)
 AS `serial_price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillable_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillable_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `fulfillable_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `order_item_state`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_amount` AS string)), '') AS string) END as float64)
 AS `commission_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payout_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payout_amount` AS string)), '') AS string) END as float64)
 AS `payout_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_sold_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_sold_price` AS string)), '') AS string) END as numeric)
 AS `adjusted_sold_price`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paid_out_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_out_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `paid_out_at`


  , `commission_rate` AS `_raw_commission_rate`

  , `suggested_shipment_location_id` AS `_raw_suggested_shipment_location_id`

  , `custom_commission_rate` AS `_raw_custom_commission_rate`

  , `sale_promotion_id` AS `_raw_sale_promotion_id`

  , `serial_number` AS `_raw_serial_number`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`order_items` AS source_table

 ) AS un_ordered


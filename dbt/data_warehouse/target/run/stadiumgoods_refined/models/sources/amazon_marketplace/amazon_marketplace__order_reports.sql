

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__order_reports`
  OPTIONS()
  as 


  














































 

SELECT   `transaction_id`,  `merchant_order_id`,  `payment_processed_at`,  `last_updated_date`,  `order_status`,  `fulfillment_channel`,  `is_fba`,  `marketplace_name`,  `order_channel`,  `url`,  `ship_service_level`,  `product_name`,  `sku`,  `asin`,  `item_status`,  `quantity`,  `base_currency`,  `_raw_item_price`,  `_raw_item_tax`,  `_raw_shipping_price`,  `_raw_shipping_tax`,  `_raw_gift_wrap_price`,  `_raw_gift_wrap_tax`,  `_raw_item_discount`,  `_raw_shipping_discount`,  `shipping_city`,  `shipping_state`,  `shipping_postal_code`,  `shipping_country`,  `promotion_ids`,  `item_extensions_data`,  `purchase_order_number`,  `customized_url`,  `customized_page`,  `is_replacement_order`,  `original_order_id_`,  `file_name`,  `file_time`,  `promotion_ids_`,  `order_date`,  `is_approved`,  `base_item_price`,  `base_item_discount`,  `base_item_tax_collected`,  `base_shipping_price`,  `base_shipping_discount`,  `base_shipping_tax_collected`
    , `_raw_original_order_id`
    , `_raw_is_buyer_requested_cancellation_`
    , `_raw_payment_method_details`
    , `_raw_is_business_order`
    , `_raw_price_designation`
    , `_raw_is_buyer_requested_cancellation`
    , `_raw_buyer_requested_cancel_reason_`
    , `_raw_buyer_requested_cancel_reason`
    , `_raw_signature_confirmation_recommended_`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN is_approved THEN coalesce(_raw_item_price, 0) + coalesce(_raw_gift_wrap_price, 0) ELSE 0 END as float64)
 AS `base_item_price`
  , 
    safe_cast(CASE WHEN is_approved THEN coalesce(_raw_item_discount, 0) ELSE 0 END as float64)
 AS `base_item_discount`
  , 
    safe_cast(CASE WHEN is_approved THEN coalesce(_raw_item_tax, 0) + coalesce(_raw_gift_wrap_tax, 0) ELSE 0 END as float64)
 AS `base_item_tax_collected`
  , 
    safe_cast(CASE WHEN is_approved THEN coalesce(_raw_shipping_price, 0) ELSE 0 END as float64)
 AS `base_shipping_price`
  , 
    safe_cast(CASE WHEN is_approved THEN coalesce(_raw_shipping_discount, 0) ELSE 0 END as float64)
 AS `base_shipping_discount`
  , 
    safe_cast(CASE WHEN is_approved THEN coalesce(_raw_shipping_tax, 0) ELSE 0 END as float64)
 AS `base_shipping_tax_collected` 

 

FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(payment_processed_at AS timestamp), 'America/New_York') AS date) AS `order_date` 
FROM ( 

SELECT
    *

  , 
    safe_cast(fulfillment_channel = 'Amazon' as boolean)
 AS `is_fba`
  , 
    safe_cast(item_status IS NOT NULL as boolean)
 AS `is_approved` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_order_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_order_id` AS string)), '') AS string) END as string)
 AS `merchant_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_date` AS string)), '') AS string) END as timestamp)
 AS `payment_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_updated_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_updated_date` AS string)), '') AS string) END as timestamp)
 AS `last_updated_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_status` AS string)), '') AS string) END as string)
 AS `order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_channel` AS string)), '') AS string) END as string)
 AS `fulfillment_channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) END as string)
 AS `marketplace_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_channel` AS string)), '') AS string) END as string)
 AS `order_channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`url` AS string)), '') AS string) END as string)
 AS `url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_service_level` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_service_level` AS string)), '') AS string) END as string)
 AS `ship_service_level`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_name` AS string)), '') AS string) END as string)
 AS `product_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`asin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`asin` AS string)), '') AS string) END as string)
 AS `asin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_status` AS string)), '') AS string) END as string)
 AS `item_status`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_price` AS string)), '') AS string) END as float64)
 AS `_raw_item_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_tax` AS string)), '') AS string) END as float64)
 AS `_raw_item_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_price` AS string)), '') AS string) END as float64)
 AS `_raw_shipping_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tax` AS string)), '') AS string) END as float64)
 AS `_raw_shipping_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_wrap_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_wrap_price` AS string)), '') AS string) END as float64)
 AS `_raw_gift_wrap_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_wrap_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_wrap_tax` AS string)), '') AS string) END as float64)
 AS `_raw_gift_wrap_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_promotion_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_promotion_discount` AS string)), '') AS string) END as float64)
 AS `_raw_item_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_promotion_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_promotion_discount` AS string)), '') AS string) END as float64)
 AS `_raw_shipping_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) END as string)
 AS `shipping_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_state` AS string)), '') AS string) END as string)
 AS `shipping_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_postal_code` AS string)), '') AS string) END as string)
 AS `shipping_postal_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_country` AS string)), '') AS string) END as string)
 AS `shipping_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promotion_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promotion_ids` AS string)), '') AS string) END as string)
 AS `promotion_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_extensions_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_extensions_data` AS string)), '') AS string) END as string)
 AS `item_extensions_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_order_number` AS string)), '') AS string) END as string)
 AS `purchase_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customized_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customized_url` AS string)), '') AS string) END as string)
 AS `customized_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customized_page` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customized_page` AS string)), '') AS string) END as string)
 AS `customized_page`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_replacement_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_replacement_order` AS string)), '') AS string) END as string)
 AS `is_replacement_order`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_order_id_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_order_id_` AS string)), '') AS string) END as string)
 AS `original_order_id_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promotion_ids_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promotion_ids_` AS string)), '') AS string) END as string)
 AS `promotion_ids_`


  , `original_order_id` AS `_raw_original_order_id`

  , `is_buyer_requested_cancellation_` AS `_raw_is_buyer_requested_cancellation_`

  , `payment_method_details` AS `_raw_payment_method_details`

  , `is_business_order` AS `_raw_is_business_order`

  , `price_designation` AS `_raw_price_designation`

  , `is_buyer_requested_cancellation` AS `_raw_is_buyer_requested_cancellation`

  , `buyer_requested_cancel_reason_` AS `_raw_buyer_requested_cancel_reason_`

  , `buyer_requested_cancel_reason` AS `_raw_buyer_requested_cancel_reason`

  , `signature_confirmation_recommended_` AS `_raw_signature_confirmation_recommended_`


FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

;


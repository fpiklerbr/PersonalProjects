

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_ebay_listing_product`
  OPTIONS()
  as 

  


















































 

SELECT   `listing_product_id`,  `template_category_id`,  `template_other_category_id`,  `ebay_item_id`,  `item_uuid`,  `is_duplicate`,  `online_is_variation`,  `online_is_auction_type`,  `online_sku`,  `online_title`,  `online_sub_title`,  `online_description`,  `online_images`,  `online_duration`,  `online_current_price`,  `online_start_price`,  `online_reserve_price`,  `online_buyitnow_price`,  `online_qty`,  `online_qty_sold`,  `online_bids`,  `online_main_category`,  `online_categories_data`,  `online_shipping_data`,  `online_payment_data`,  `online_return_data`,  `online_other_data`,  `translation_status`,  `translation_service`,  `translated_date`,  `start_date`,  `end_date`,  `template_payment_mode`,  `template_payment_id`,  `template_payment_custom_id`,  `template_shipping_mode`,  `template_shipping_id`,  `template_shipping_custom_id`,  `template_return_mode`,  `template_return_id`,  `template_return_custom_id`,  `template_description_mode`,  `template_description_id`,  `template_description_custom_id`,  `template_selling_format_mode`,  `template_selling_format_id`,  `template_selling_format_custom_id`,  `template_synchronization_mode`,  `template_synchronization_id`,  `template_synchronization_custom_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`listing_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`listing_product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `listing_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_category_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_other_category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_other_category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_other_category_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ebay_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ebay_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ebay_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_uuid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_uuid` AS string)), '') AS string) END as string)
 AS `item_uuid`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_duplicate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_duplicate` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_duplicate`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_is_variation` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_is_variation` AS string)), '') AS string) END as float64)
 as int64)
 AS `online_is_variation`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_is_auction_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_is_auction_type` AS string)), '') AS string) END as float64)
 as int64)
 AS `online_is_auction_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_sku` AS string)), '') AS string) END as string)
 AS `online_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_title` AS string)), '') AS string) END as string)
 AS `online_title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_sub_title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_sub_title` AS string)), '') AS string) END as string)
 AS `online_sub_title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_description` AS string)), '') AS string) END as string)
 AS `online_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_images` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_images` AS string)), '') AS string) END as string)
 AS `online_images`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_duration` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_duration` AS string)), '') AS string) END as float64)
 as int64)
 AS `online_duration`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_current_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_current_price` AS string)), '') AS string) END as numeric)
 AS `online_current_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_start_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_start_price` AS string)), '') AS string) END as numeric)
 AS `online_start_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_reserve_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_reserve_price` AS string)), '') AS string) END as numeric)
 AS `online_reserve_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_buyitnow_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_buyitnow_price` AS string)), '') AS string) END as numeric)
 AS `online_buyitnow_price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `online_qty`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_qty_sold` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_qty_sold` AS string)), '') AS string) END as float64)
 as int64)
 AS `online_qty_sold`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_bids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_bids` AS string)), '') AS string) END as float64)
 as int64)
 AS `online_bids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_main_category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_main_category` AS string)), '') AS string) END as string)
 AS `online_main_category`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_categories_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_categories_data` AS string)), '') AS string) END as string)
 AS `online_categories_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_shipping_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_shipping_data` AS string)), '') AS string) END as string)
 AS `online_shipping_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_payment_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_payment_data` AS string)), '') AS string) END as string)
 AS `online_payment_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_return_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_return_data` AS string)), '') AS string) END as string)
 AS `online_return_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_other_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_other_data` AS string)), '') AS string) END as string)
 AS `online_other_data`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`translation_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`translation_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `translation_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`translation_service` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`translation_service` AS string)), '') AS string) END as string)
 AS `translation_service`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`translated_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`translated_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `translated_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`start_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`start_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `start_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`end_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`end_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `end_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_payment_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_payment_mode` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_payment_mode`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_payment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_payment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_payment_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_payment_custom_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_payment_custom_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_payment_custom_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_shipping_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_shipping_mode` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_shipping_mode`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_shipping_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_shipping_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_shipping_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_shipping_custom_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_shipping_custom_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_shipping_custom_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_return_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_return_mode` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_return_mode`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_return_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_return_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_return_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_return_custom_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_return_custom_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_return_custom_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_description_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_description_mode` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_description_mode`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_description_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_description_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_description_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_description_custom_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_description_custom_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_description_custom_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_selling_format_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_selling_format_mode` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_selling_format_mode`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_selling_format_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_selling_format_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_selling_format_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_selling_format_custom_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_selling_format_custom_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_selling_format_custom_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_synchronization_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_synchronization_mode` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_synchronization_mode`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_synchronization_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_synchronization_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_synchronization_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`template_synchronization_custom_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`template_synchronization_custom_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `template_synchronization_custom_id`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product` AS source_table

 ) AS un_ordered

;


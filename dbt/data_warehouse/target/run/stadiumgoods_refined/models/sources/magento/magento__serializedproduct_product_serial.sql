

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial`
  OPTIONS()
  as 




 





























 

SELECT   `serializedproduct_product_serial_id`,  `simple_sku`,  `serial_number`,  `price`,  `mag_order_id`,  `created_at`,  `updated_at`,  `warehouse_id`,  `configurable_product_id`,  `qty`,  `textcomment`,  `status_id`,  `ebay_price`,  `ebay_strikethrough_price`,  `reserved_external_order`,  `reserved_quote_item_id`,  `reserved_quote_item_date`,  `allow_pushing_to_goat`,  `allow_pushing_to_tmall`,  `source_id`,  `manufacturer_sku`,  `size`,  `location`,  `reserved_price_channel`,  `reserved_at`,  `allow_pushing_to_farfetch`,  `dropshipper_item_id`,  `supplier_acronym`,  `_synched_from_source_at`
    , `_raw_label_number`
    , `_raw_currency_code`
    , `_raw_supply_channel`
  FROM ( 

SELECT
    *

  , CAST(regexp_extract(serial_number, 
  r'-[A-z]{2}-([0-9]+)-'
) AS string) AS `dropshipper_item_id`
  , CAST(regexp_extract(serial_number, 
  r'-([A-z]{2})-'
) AS string) AS `supplier_acronym` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `serializedproduct_product_serial_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `simple_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_increment_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `warehouse_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `configurable_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as numeric)
 AS `qty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`textcomment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`textcomment` AS string)), '') AS string) END as string)
 AS `textcomment`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `status_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ebay_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ebay_price` AS string)), '') AS string) END as numeric)
 AS `ebay_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ebay_strikethrough_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ebay_strikethrough_price` AS string)), '') AS string) END as numeric)
 AS `ebay_strikethrough_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_external_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_external_order` AS string)), '') AS string) END as string)
 AS `reserved_external_order`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_quote_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_quote_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `reserved_quote_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_quote_item_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_quote_item_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `reserved_quote_item_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allow_pushing_to_goat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allow_pushing_to_goat` AS string)), '') AS string) END as float64)
 as int64)
 AS `allow_pushing_to_goat`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allow_pushing_to_tmall` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allow_pushing_to_tmall` AS string)), '') AS string) END as float64)
 as int64)
 AS `allow_pushing_to_tmall`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `manufacturer_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`location` AS string)), '') AS string) END as string)
 AS `location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_price_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_price_channel` AS string)), '') AS string) END as string)
 AS `reserved_price_channel`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `reserved_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allow_pushing_to_farfetch` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allow_pushing_to_farfetch` AS string)), '') AS string) END as float64)
 as int64)
 AS `allow_pushing_to_farfetch`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `label_number` AS `_raw_label_number`

  , `currency_code` AS `_raw_currency_code`

  , `supply_channel` AS `_raw_supply_channel`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;


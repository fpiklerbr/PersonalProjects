

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_ebay_listing_product_variation`
  OPTIONS()
  as 

  








 

SELECT   `listing_product_variation_id`,  `add`,  `delete`,  `online_sku`,  `online_price`,  `online_qty`,  `online_qty_sold`,  `status`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`listing_product_variation_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`listing_product_variation_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `listing_product_variation_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`add` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`add` AS string)), '') AS string) END as float64)
 as int64)
 AS `add`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delete` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delete` AS string)), '') AS string) END as float64)
 as int64)
 AS `delete`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_sku` AS string)), '') AS string) END as string)
 AS `online_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`online_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`online_price` AS string)), '') AS string) END as numeric)
 AS `online_price`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)
 AS `status`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product_variation` AS source_table

 ) AS un_ordered

;


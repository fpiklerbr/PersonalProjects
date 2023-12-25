

  
























 

SELECT   `entity_id`,  `dsco_supplier_id`,  `dsco_item_id`,  `manufacturer_sku_internal`,  `manufacturer_sku_supplier`,  `name`,  `size`,  `gender`,  `colors`,  `upc`,  `gtin`,  `country_of_origin`,  `quantity`,  `price`,  `colorway`,  `status`,  `category_ids`,  `brand`,  `product_id`,  `created_at`,  `updated_at`,  `description`,  `short_description`,  `serial_status`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_supplier_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_supplier_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `dsco_supplier_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) END as string)
 AS `dsco_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku_internal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku_internal` AS string)), '') AS string) END as string)
 AS `manufacturer_sku_internal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku_supplier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku_supplier` AS string)), '') AS string) END as string)
 AS `manufacturer_sku_supplier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender` AS string)), '') AS string) END as string)
 AS `gender`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`colors` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`colors` AS string)), '') AS string) END as string)
 AS `colors`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`upc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`upc` AS string)), '') AS string) END as string)
 AS `upc`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gtin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gtin` AS string)), '') AS string) END as string)
 AS `gtin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_of_origin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_of_origin` AS string)), '') AS string) END as string)
 AS `country_of_origin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as string)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as numeric)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`colorway` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`colorway` AS string)), '') AS string) END as string)
 AS `colorway`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_ids` AS string)), '') AS string) END as string)
 AS `category_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand` AS string)), '') AS string) END as string)
 AS `brand`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`short_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`short_description` AS string)), '') AS string) END as string)
 AS `short_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_status` AS string)), '') AS string) END as string)
 AS `serial_status`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier_product` AS source_table

 ) AS un_ordered


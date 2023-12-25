





























 

SELECT   `row_order`,  `id`,  `style`,  `store_barcode`,  `size_range_type`,  `size`,  `season_id`,  `season`,  `sku`,  `quantity`,  `name`,  `item_id`,  `group`,  `gender_id`,  `gender`,  `full_price`,  `discount_price`,  `department`,  `brand`,  `barcode`,  `file_name`,  `file_time`,  `fps_stock_point_id`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_order` AS string)), '') AS string) END as string)
 AS `row_order`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as string)
 AS `id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`style` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`style` AS string)), '') AS string) END as string)
 AS `style`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_barcode` AS string)), '') AS string) END as string)
 AS `store_barcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_range_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_range_type` AS string)), '') AS string) END as string)
 AS `size_range_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`season_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`season_id` AS string)), '') AS string) END as string)
 AS `season_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`season` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`season` AS string)), '') AS string) END as string)
 AS `season`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as string)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as string)
 AS `item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`group` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`group` AS string)), '') AS string) END as string)
 AS `group`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender_id` AS string)), '') AS string) END as string)
 AS `gender_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender` AS string)), '') AS string) END as string)
 AS `gender`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`full_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`full_price` AS string)), '') AS string) END as string)
 AS `full_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_price` AS string)), '') AS string) END as string)
 AS `discount_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`department` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`department` AS string)), '') AS string) END as string)
 AS `department`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand` AS string)), '') AS string) END as string)
 AS `brand`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`barcode` AS string)), '') AS string) END as string)
 AS `barcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`



FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_listings` AS source_table

WHERE 
    safe_cast(file_time as timestamp)
 > (SELECT max(file_time) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_listings` )


 ) AS un_ordered


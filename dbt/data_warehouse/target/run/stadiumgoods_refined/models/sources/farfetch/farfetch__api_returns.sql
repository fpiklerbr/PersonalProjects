

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_returns`
  
  
  OPTIONS()
  as (
    







































 

SELECT   `article_id`,  `article_reference`,  `box_vol_weight`,  `ff_barcode`,  `image_url`,  `is_duplicate`,  `line_status`,  `order_from_portal`,  `farfetch_order_line_id`,  `price`,  `quantity`,  `reason`,  `reason_notes`,  `farfetch_return_id`,  `show_warning`,  `size`,  `size_position`,  `store_barcode`,  `fps_store_sku`,  `total`,  `ups`,  `farfetch_order_id`,  `barcode`,  `collect_in_store`,  `collect_point`,  `farfetch_api_return_created_at`,  `is_personal_shopper`,  `fps_order_id`,  `order_lines`,  `fps_stock_point_code`,  `fps_stock_point_id`,  `prop_invoice`,  `ship_from_address`,  `status`,  `zone_euro`,  `file_time`,  `file_name`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`article_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`article_id` AS string)), '') AS string) END as string)
 AS `article_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`article_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`article_reference` AS string)), '') AS string) END as string)
 AS `article_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box_vol_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box_vol_weight` AS string)), '') AS string) END as string)
 AS `box_vol_weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_barcode` AS string)), '') AS string) END as string)
 AS `ff_barcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`image_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`image_url` AS string)), '') AS string) END as string)
 AS `image_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_duplicate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_duplicate` AS string)), '') AS string) END as string)
 AS `is_duplicate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_status` AS string)), '') AS string) END as string)
 AS `line_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_from_portal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_from_portal` AS string)), '') AS string) END as string)
 AS `order_from_portal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_line_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_line_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_line_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as string)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as string)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason` AS string)), '') AS string) END as string)
 AS `reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_notes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_notes` AS string)), '') AS string) END as string)
 AS `reason_notes`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_order_id` AS string)), '') AS string) END as string)
 AS `farfetch_return_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`show_warning` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`show_warning` AS string)), '') AS string) END as string)
 AS `show_warning`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_position` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_position` AS string)), '') AS string) END as string)
 AS `size_position`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_barcode` AS string)), '') AS string) END as string)
 AS `store_barcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_sku` AS string)), '') AS string) END as string)
 AS `fps_store_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total` AS string)), '') AS string) END as string)
 AS `total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ups` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ups` AS string)), '') AS string) END as string)
 AS `ups`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`barcode` AS string)), '') AS string) END as string)
 AS `barcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`collect_in_store` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`collect_in_store` AS string)), '') AS string) END as string)
 AS `collect_in_store`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`collect_point` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`collect_point` AS string)), '') AS string) END as string)
 AS `collect_point`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_created` AS string)), '') AS string) END as timestamp)
 AS `farfetch_api_return_created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_personal_shopper` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_personal_shopper` AS string)), '') AS string) END as string)
 AS `is_personal_shopper`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_code` AS string)), '') AS string) END as string)
 AS `fps_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_lines` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_lines` AS string)), '') AS string) END as string)
 AS `order_lines`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`point_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`point_code` AS string)), '') AS string) END as string)
 AS `fps_stock_point_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`point_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`point_id` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prop_invoice` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prop_invoice` AS string)), '') AS string) END as string)
 AS `prop_invoice`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_address` AS string)), '') AS string) END as string)
 AS `ship_from_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zone_euro` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zone_euro` AS string)), '') AS string) END as string)
 AS `zone_euro`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`



FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_returns` AS source_table

 ) AS un_ordered


  );
    
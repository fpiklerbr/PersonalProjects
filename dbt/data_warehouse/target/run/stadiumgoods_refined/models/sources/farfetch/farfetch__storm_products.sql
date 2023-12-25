

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__storm_products`
  
  
  OPTIONS()
  as (
    


  



 

SELECT   `fps_child_product_id`,  `farfetch_date`,  `file_name`,  `mfg_sku`,  `fps_stock_point_id`
  FROM ( 

SELECT
    *

  , 
    safe_cast('11218' as string)
 AS `fps_stock_point_id` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_product_id` AS string)), '') AS string) END as string)
 AS `fps_child_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `farfetch_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mfg_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mfg_sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`



FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_products` AS source_table

 ) AS source_select_statement

 ) AS un_ordered


  );
    
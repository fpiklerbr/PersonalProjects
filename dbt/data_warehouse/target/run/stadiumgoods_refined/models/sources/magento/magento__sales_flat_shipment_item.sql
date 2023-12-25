

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_shipment_item`
  OPTIONS()
  as 

  














 

SELECT   `sales_flat_shipment_item_id`,  `sales_flat_shipment_id`,  `row_total`,  `price`,  `weight`,  `qty`,  `product_id`,  `sales_flat_order_item_id`,  `additional_data`,  `description`,  `name`,  `sku`,  `dsco_item_id`,  `dsco_po_line_number`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_shipment_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_shipment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_total` AS string)), '') AS string) END as float64)
 AS `row_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight` AS string)), '') AS string) END as float64)
 AS `weight`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) END as string)
 AS `additional_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) END as string)
 AS `dsco_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_po_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_po_line_number` AS string)), '') AS string) END as string)
 AS `dsco_po_line_number`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_shipment_item` AS source_table

 ) AS un_ordered

;


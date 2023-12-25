

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo_item`
  OPTIONS()
  as 

  



































 

SELECT   `sales_flat_creditmemo_item_id`,  `sales_flat_creditmemo_id`,  `base_price`,  `tax_amount`,  `base_row_total`,  `discount_amount`,  `row_total`,  `base_discount_amount`,  `price_incl_tax`,  `base_tax_amount`,  `base_price_incl_tax`,  `qty`,  `base_cost`,  `price`,  `base_row_total_incl_tax`,  `row_total_incl_tax`,  `product_id`,  `sales_flat_order_item_id`,  `additional_data`,  `description`,  `sku`,  `name`,  `hidden_tax_amount`,  `base_hidden_tax_amount`,  `weee_tax_disposition`,  `weee_tax_row_disposition`,  `base_weee_tax_disposition`,  `base_weee_tax_row_disposition`,  `weee_tax_applied`,  `base_weee_tax_applied_amount`,  `base_weee_tax_applied_row_amnt`,  `weee_tax_applied_amount`,  `weee_tax_applied_row_amount`,  `dsco_item_id`,  `dsco_po_line_number`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_creditmemo_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_creditmemo_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_price` AS string)), '') AS string) END as float64)
 AS `base_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) END as float64)
 AS `tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_row_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_row_total` AS string)), '') AS string) END as float64)
 AS `base_row_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) END as float64)
 AS `discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_total` AS string)), '') AS string) END as float64)
 AS `row_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) END as float64)
 AS `base_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_incl_tax` AS string)), '') AS string) END as float64)
 AS `price_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_price_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_price_incl_tax` AS string)), '') AS string) END as float64)
 AS `base_price_incl_tax`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_cost` AS string)), '') AS string) END as float64)
 AS `base_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_row_total_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_row_total_incl_tax` AS string)), '') AS string) END as float64)
 AS `base_row_total_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_total_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_total_incl_tax` AS string)), '') AS string) END as float64)
 AS `row_total_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as string)
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) END as float64)
 AS `hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_disposition` AS string)), '') AS string) END as string)
 AS `weee_tax_disposition`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_row_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_row_disposition` AS string)), '') AS string) END as string)
 AS `weee_tax_row_disposition`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_disposition` AS string)), '') AS string) END as string)
 AS `base_weee_tax_disposition`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_row_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_row_disposition` AS string)), '') AS string) END as string)
 AS `base_weee_tax_row_disposition`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_applied` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_applied` AS string)), '') AS string) END as string)
 AS `weee_tax_applied`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_applied_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_applied_amount` AS string)), '') AS string) END as float64)
 AS `base_weee_tax_applied_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_applied_row_amnt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_applied_row_amnt` AS string)), '') AS string) END as float64)
 AS `base_weee_tax_applied_row_amnt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_applied_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_applied_amount` AS string)), '') AS string) END as float64)
 AS `weee_tax_applied_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_applied_row_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_applied_row_amount` AS string)), '') AS string) END as float64)
 AS `weee_tax_applied_row_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) END as string)
 AS `dsco_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_po_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_po_line_number` AS string)), '') AS string) END as string)
 AS `dsco_po_line_number`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo_item` AS source_table

 ) AS un_ordered

;


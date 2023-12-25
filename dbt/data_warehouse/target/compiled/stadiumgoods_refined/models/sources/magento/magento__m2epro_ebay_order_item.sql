

  














 

SELECT   `order_item_id`,  `transaction_id`,  `selling_manager_id`,  `item_id`,  `title`,  `sku`,  `price`,  `qty_purchased`,  `tax_details`,  `final_fee`,  `waste_recycling_fee`,  `variation_details`,  `tracking_details`,  `unpaid_item_process_state`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`selling_manager_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`selling_manager_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `selling_manager_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as numeric)
 AS `item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as numeric)
 AS `price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_purchased` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_purchased` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_purchased`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_details` AS string)), '') AS string) END as string)
 AS `tax_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`final_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`final_fee` AS string)), '') AS string) END as numeric)
 AS `final_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`waste_recycling_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`waste_recycling_fee` AS string)), '') AS string) END as numeric)
 AS `waste_recycling_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variation_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variation_details` AS string)), '') AS string) END as string)
 AS `variation_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_details` AS string)), '') AS string) END as string)
 AS `tracking_details`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unpaid_item_process_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unpaid_item_process_state` AS string)), '') AS string) END as float64)
 as int64)
 AS `unpaid_item_process_state`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_item` AS source_table

 ) AS un_ordered


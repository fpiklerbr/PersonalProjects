

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_items`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_bundle_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bundle_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bundle_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_bundle_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unit_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unit_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `unit_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sold_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sold_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `sold_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_commission_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_commission_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `seller_commission_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_commission_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_commission_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `buyer_commission_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `total_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dtc_unit_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dtc_unit_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `dtc_unit_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`market_unit_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`market_unit_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `market_unit_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`max_unit_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`max_unit_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `max_unit_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`max_dtc_unit_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`max_dtc_unit_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `max_dtc_unit_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `rejected_at` AS `_raw_rejected_at`
  , `suggested_unit_price_cents` AS `_raw_suggested_unit_price_cents`
  , `rejection_reason` AS `_raw_rejection_reason`
  , `drop_off_quantity` AS `_raw_drop_off_quantity`
  , `approved_at` AS `_raw_approved_at`
  , `approved_by_id` AS `_raw_approved_by_id`
  , `approved_quantity` AS `_raw_approved_quantity`
  , `approved_unit_price_cents` AS `_raw_approved_unit_price_cents`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_items`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `source_bundle_item_id` AS `source_bundle_item_id`
  , `source_bundle_id` AS `source_bundle_id`
  , `mfg_sku` AS `mfg_sku`
  , `size` AS `size`
  , `unit_price_base_amount` AS `unit_price_base_amount`
  , `sold_price_base_amount` AS `sold_price_base_amount`
  , `seller_commission_base_amount` AS `seller_commission_base_amount`
  , `buyer_commission_base_amount` AS `buyer_commission_base_amount`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `quantity` AS `quantity`
  , `total_price_base_amount` AS `total_price_base_amount`
  , `dtc_unit_price_base_amount` AS `dtc_unit_price_base_amount`
  , `market_unit_price_base_amount` AS `market_unit_price_base_amount`
  , `max_unit_price_base_amount` AS `max_unit_price_base_amount`
  , `max_dtc_unit_price_base_amount` AS `max_dtc_unit_price_base_amount`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_rejected_at` AS `_raw_rejected_at`
  , `_raw_suggested_unit_price_cents` AS `_raw_suggested_unit_price_cents`
  , `_raw_rejection_reason` AS `_raw_rejection_reason`
  , `_raw_drop_off_quantity` AS `_raw_drop_off_quantity`
  , `_raw_approved_at` AS `_raw_approved_at`
  , `_raw_approved_by_id` AS `_raw_approved_by_id`
  , `_raw_approved_quantity` AS `_raw_approved_quantity`
  , `_raw_approved_unit_price_cents` AS `_raw_approved_unit_price_cents`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;


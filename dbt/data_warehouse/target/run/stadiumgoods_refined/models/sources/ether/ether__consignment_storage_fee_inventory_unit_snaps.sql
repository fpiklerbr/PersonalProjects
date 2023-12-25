

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__consignment_storage_fee_inventory_unit_snaps`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_consignment_storage_fee_inventory_unit_snapshot_id`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`consignor_exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_exempt` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`consignor_exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_exempt` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `seller_is_exempt_from_storage_fee`
  , 

    CASE 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_type` AS string)), '') AS string) END as string)

WHEN '1p' THEN cast( '1p' AS string)
WHEN '3p' THEN cast( '3p' AS string)
WHEN '3pe' THEN cast( '3pe' AS string)
WHEN 'dss' THEN cast( 'dss' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`consignor_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_type` AS string)), '') AS string) END AS string)
END AS `seller_type`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exempt` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exempt` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `inventory_unit_is_exempt_from_storage_fee`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`free_eligible_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`free_eligible_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `free_eligible_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`free_eligible_price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`free_eligible_price_currency` AS string)), '') AS string) END as string)
 AS `free_eligible_price_currency`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_current` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_current` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_current` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_current` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `snapshot_is_current`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`payable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payable` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`payable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payable` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `storage_fee_is_payable`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`product_exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_exempt` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`product_exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_exempt` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `product_is_exempt_from_storage_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`storage_start_datetime` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`storage_start_datetime` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `storage_started_at`
  , 

    CASE 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`storage_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`storage_status` AS string)), '') AS string) END as string)

WHEN 'in_stock' THEN cast( 'in_stock' AS string)
WHEN 'in_stock_allocated' THEN cast( 'in_stock_allocated' AS string)
WHEN 'in_transit' THEN cast( 'in_transit' AS string)
WHEN 'requested_withdrawal' THEN cast( 'requested_withdrawal' AS string)
WHEN 'review' THEN cast( 'review' AS string)
WHEN 'sold_pos' THEN cast( 'sold_pos' AS string)
WHEN 'sold_web' THEN cast( 'sold_web' AS string)
WHEN 'withdrawn' THEN cast( 'withdrawn' AS string)
WHEN 'in_stock_allocated_transfer' THEN cast( 'in_stock_allocated_transfer' AS string)
WHEN 'quarantine' THEN cast( 'quarantine' AS string)
WHEN 'consignor_return' THEN cast( 'consignor_return' AS string)
WHEN 'rejected' THEN cast( 'rejected' AS string)
WHEN 'returned' THEN cast( 'returned' AS string)
WHEN 'draft' THEN cast( 'draft' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`storage_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`storage_status` AS string)), '') AS string) END AS string)
END AS `consignment_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `snapshot_taken_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_code` AS string)), '') AS string) END as string)
 AS `warehouse_code`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_id` AS string)), '') AS string) END as string)
 AS `consignor_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_inventory_unit_snapshots`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_consignment_storage_fee_inventory_unit_snapshot_id` AS `ether_consignment_storage_fee_inventory_unit_snapshot_id`
  , `seller_is_exempt_from_storage_fee` AS `seller_is_exempt_from_storage_fee`
  , `seller_type` AS `seller_type`
  , `inventory_unit_is_exempt_from_storage_fee` AS `inventory_unit_is_exempt_from_storage_fee`
  , `free_eligible_price_base_amount` AS `free_eligible_price_base_amount`
  , `snapshot_is_current` AS `snapshot_is_current`
  , `storage_fee_is_payable` AS `storage_fee_is_payable`
  , `price_base_amount` AS `price_base_amount`
  , `base_currency` AS `base_currency`
  , `product_is_exempt_from_storage_fee` AS `product_is_exempt_from_storage_fee`
  , `serial_number` AS `serial_number`
  , `storage_started_at` AS `storage_started_at`
  , `consignment_status` AS `consignment_status`
  , `snapshot_taken_at` AS `snapshot_taken_at`
  , `warehouse_code` AS `warehouse_code`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `consignor_id` AS `consignor_id`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;


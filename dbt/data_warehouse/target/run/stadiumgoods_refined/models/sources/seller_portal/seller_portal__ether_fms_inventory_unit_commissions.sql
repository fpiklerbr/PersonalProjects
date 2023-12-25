

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_inventory_unit_commissions`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_fms_inventory_unit_commission_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_rate` AS string)), '') AS string) END as numeric)
 / 100, 4) AS `commission_rate`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `effective_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `previous_inventory_unit_historical_commission_id` AS `_raw_previous_inventory_unit_historical_commission_id`
  , `commission_type` AS `_raw_commission_type`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_inventory_unit_commissions`

WHERE 1=1
AND id NOT IN ('1999205')
                 ) , final AS ( 
                    SELECT

    `ether_fms_inventory_unit_commission_id` AS `ether_fms_inventory_unit_commission_id`
  , `serial_number` AS `serial_number`
  , `commission_rate` AS `commission_rate`
  , `effective_at` AS `effective_at`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_previous_inventory_unit_historical_commission_id` AS `_raw_previous_inventory_unit_historical_commission_id`
  , `_raw_commission_type` AS `_raw_commission_type`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;


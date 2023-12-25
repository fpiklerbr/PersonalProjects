

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_ledger_tenants`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_ledger_tenant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`owner_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`owner_type` AS string)), '') AS string) END as string)
 AS `owner_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`owner_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`owner_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `owner_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `tenant_name`
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
  , `currency` AS `_raw_currency`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_tenants`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN owner_type = 'Ether::Consignor' THEN owner_id END as int64)
 AS `user_id`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_ledger_tenant_id` AS `ether_ledger_tenant_id`
  , `owner_type` AS `owner_type`
  , `owner_id` AS `owner_id`
  , `user_id` AS `user_id`
  , `tenant_name` AS `tenant_name`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_currency` AS `_raw_currency`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;


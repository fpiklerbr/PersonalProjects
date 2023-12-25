

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_vendors`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_vendor_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vendor_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vendor_number` AS string)), '') AS string) END as string)
 AS `vendor_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `vendor_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `vendor_email`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`contact_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`contact_name` AS string)), '') AS string) END as string)
 AS `contact_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) END as string)
 AS `phone_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS `created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `third_party_vendor_code` AS `_raw_third_party_vendor_code`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendors`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_commercial_vendor_id` AS `ether_commercial_vendor_id`
  , `vendor_number` AS `vendor_number`
  , `vendor_name` AS `vendor_name`
  , `vendor_email` AS `vendor_email`
  , `contact_name` AS `contact_name`
  , `phone_number` AS `phone_number`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_third_party_vendor_code` AS `_raw_third_party_vendor_code`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;


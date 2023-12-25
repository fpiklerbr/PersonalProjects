

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__amasty_audit_log_details`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `amasty_audit_log_detail_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`log_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`log_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `amasty_audit_log_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `attribute_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_value` AS string)), '') AS string) END as string)
 AS `old_value`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_value` AS string)), '') AS string) END as string)
 AS `new_value`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`model` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`model` AS string)), '') AS string) END as string)
 AS `model`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log_details`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `amasty_audit_log_detail_id` AS `amasty_audit_log_detail_id`
  , `amasty_audit_log_id` AS `amasty_audit_log_id`
  , `attribute_name` AS `attribute_name`
  , `old_value` AS `old_value`
  , `new_value` AS `new_value`
  , `model` AS `model`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;


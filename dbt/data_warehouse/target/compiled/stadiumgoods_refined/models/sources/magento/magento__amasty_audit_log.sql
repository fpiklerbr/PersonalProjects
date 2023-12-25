



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `amasty_audit_log_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_time` AS string)), '') AS string) END as timestamp)
 AS `log_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`username` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`username` AS string)), '') AS string) END as string)
 AS `username`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `action_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category` AS string)), '') AS string) END as string)
 AS `category`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_name` AS string)), '') AS string) END as string)
 AS `category_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parametr_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parametr_name` AS string)), '') AS string) END as string)
 AS `parameter_name`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`element_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`element_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `element_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`info` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`info` AS string)), '') AS string) END as string)
 AS `info`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log`

WHERE 1=1
AND 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 > (SELECT max(_synched_from_source_at) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__amasty_audit_log`)
                 ) , final AS ( 
                    SELECT

    `amasty_audit_log_id` AS `amasty_audit_log_id`
  , `log_time` AS `log_time`
  , `username` AS `username`
  , `action_type` AS `action_type`
  , `category` AS `category`
  , `category_name` AS `category_name`
  , `parameter_name` AS `parameter_name`
  , `element_id` AS `element_id`
  , `info` AS `info`
  , `store_id` AS `store_id`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 
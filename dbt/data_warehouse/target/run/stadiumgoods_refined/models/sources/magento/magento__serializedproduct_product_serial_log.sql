
        
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_log` as DBT_INTERNAL_DEST
        using (
           

























 

SELECT   `serial_log_id`,  `serial_id`,  `serial_number`,  `user_type`,  `username`,  `message`,  `serial_data`,  `serial_orig_data`,  `channel`,  `internal_order_id`,  `external_order_id`,  `listing_id`,  `created_at`,  `updated_at`,  `ip_address`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `serial_log_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `serial_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_type` AS string)), '') AS string) END as string)
 AS `user_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`username` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`username` AS string)), '') AS string) END as string)
 AS `username`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`message` AS string)), '') AS string) END as string)
 AS `message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_data` AS string)), '') AS string) END as string)
 AS `serial_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_orig_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_orig_data` AS string)), '') AS string) END as string)
 AS `serial_orig_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`internal_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`internal_order_id` AS string)), '') AS string) END as string)
 AS `internal_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) END as string)
 AS `external_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`listing_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`listing_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `listing_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ip_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ip_address` AS string)), '') AS string) END as float64)
 as int64)
 AS `ip_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_log` AS source_table

WHERE 
    safe_cast(_synched_from_source_at as timestamp)
 > (SELECT max(_synched_from_source_at) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_log`)


 ) AS un_ordered


         ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.serial_log_id = DBT_INTERNAL_DEST.serial_log_id
        

    
    when matched then update set
        `serial_log_id` = DBT_INTERNAL_SOURCE.`serial_log_id`,`serial_id` = DBT_INTERNAL_SOURCE.`serial_id`,`serial_number` = DBT_INTERNAL_SOURCE.`serial_number`,`user_type` = DBT_INTERNAL_SOURCE.`user_type`,`username` = DBT_INTERNAL_SOURCE.`username`,`message` = DBT_INTERNAL_SOURCE.`message`,`serial_data` = DBT_INTERNAL_SOURCE.`serial_data`,`serial_orig_data` = DBT_INTERNAL_SOURCE.`serial_orig_data`,`channel` = DBT_INTERNAL_SOURCE.`channel`,`internal_order_id` = DBT_INTERNAL_SOURCE.`internal_order_id`,`external_order_id` = DBT_INTERNAL_SOURCE.`external_order_id`,`listing_id` = DBT_INTERNAL_SOURCE.`listing_id`,`created_at` = DBT_INTERNAL_SOURCE.`created_at`,`updated_at` = DBT_INTERNAL_SOURCE.`updated_at`,`ip_address` = DBT_INTERNAL_SOURCE.`ip_address`,`_synched_from_source_at` = DBT_INTERNAL_SOURCE.`_synched_from_source_at`
    

    when not matched then insert
        (`serial_log_id`, `serial_id`, `serial_number`, `user_type`, `username`, `message`, `serial_data`, `serial_orig_data`, `channel`, `internal_order_id`, `external_order_id`, `listing_id`, `created_at`, `updated_at`, `ip_address`, `_synched_from_source_at`)
    values
        (`serial_log_id`, `serial_id`, `serial_number`, `user_type`, `username`, `message`, `serial_data`, `serial_orig_data`, `channel`, `internal_order_id`, `external_order_id`, `listing_id`, `created_at`, `updated_at`, `ip_address`, `_synched_from_source_at`)


  
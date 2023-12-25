

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__bank_accounts`
  OPTIONS()
  as 















 

SELECT   `bank_account_id`,  `user_id`,  `bank_name`,  `account_first_name`,  `account_last_name`,  `account_type`,  `created_at`,  `updated_at`,  `is_active`,  `encrypted_account_num`,  `encrypted_routing_num`,  `encrypted_account_num_iv`,  `encrypted_routing_num_iv`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `bank_account_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bank_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bank_name` AS string)), '') AS string) END as string)
 AS `bank_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_first_name` AS string)), '') AS string) END as string)
 AS `account_first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_last_name` AS string)), '') AS string) END as string)
 AS `account_last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_type` AS string)), '') AS string) END as string)
 AS `account_type`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`active` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`active` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_active`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`encrypted_account_num` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`encrypted_account_num` AS string)), '') AS string) END as string)
 AS `encrypted_account_num`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`encrypted_routing_num` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`encrypted_routing_num` AS string)), '') AS string) END as string)
 AS `encrypted_routing_num`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`encrypted_account_num_iv` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`encrypted_account_num_iv` AS string)), '') AS string) END as string)
 AS `encrypted_account_num_iv`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`encrypted_routing_num_iv` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`encrypted_routing_num_iv` AS string)), '') AS string) END as string)
 AS `encrypted_routing_num_iv`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`bank_accounts` AS source_table

 ) AS un_ordered

;


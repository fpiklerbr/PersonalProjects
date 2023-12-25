

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees`
  OPTIONS()
  as 





























 

SELECT   `employee_id`,  `employee_name`,  `first_name`,  `last_name`,  `email`,  `encrypted_password`,  `reset_password_token`,  `reset_password_sent_at`,  `remember_created_at`,  `sign_in_count`,  `current_sign_in_at`,  `last_sign_in_at`,  `current_sign_in_ip`,  `last_sign_in_ip`,  `created_at`,  `updated_at`,  `invitation_token`,  `invitation_created_at`,  `invitation_sent_at`,  `invitation_accepted_at`,  `invitation_limit`,  `invited_by_type`,  `invited_by_id`,  `invitations_count`,  `primary_warehouse_id`,  `new_notifications_count`,  `deactivated_at`,  `lock_version`,  `_synched_from_source_at`
  FROM ( 

SELECT
    *

  , 
    safe_cast(trim(coalesce(first_name, '') || ' ' || coalesce(last_name, '')) as string)
 AS `employee_name` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_name` AS string)), '') AS string) END as string)
 AS `first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_name` AS string)), '') AS string) END as string)
 AS `last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`encrypted_password` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`encrypted_password` AS string)), '') AS string) END as string)
 AS `encrypted_password`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reset_password_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reset_password_token` AS string)), '') AS string) END as string)
 AS `reset_password_token`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reset_password_sent_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reset_password_sent_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `reset_password_sent_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`remember_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`remember_created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `remember_created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sign_in_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sign_in_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `sign_in_count`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`current_sign_in_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`current_sign_in_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `current_sign_in_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_sign_in_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_sign_in_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_sign_in_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`current_sign_in_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`current_sign_in_ip` AS string)), '') AS string) END as string)
 AS `current_sign_in_ip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_sign_in_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_sign_in_ip` AS string)), '') AS string) END as string)
 AS `last_sign_in_ip`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_token` AS string)), '') AS string) END as string)
 AS `invitation_token`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `invitation_created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_sent_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_sent_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `invitation_sent_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_accepted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_accepted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `invitation_accepted_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitation_limit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitation_limit` AS string)), '') AS string) END as float64)
 as int64)
 AS `invitation_limit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invited_by_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invited_by_type` AS string)), '') AS string) END as string)
 AS `invited_by_type`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invited_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invited_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `invited_by_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invitations_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invitations_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `invitations_count`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`primary_warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`primary_warehouse_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `primary_warehouse_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_notifications_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_notifications_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `new_notifications_count`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deactivated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deactivated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `deactivated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`employees` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;


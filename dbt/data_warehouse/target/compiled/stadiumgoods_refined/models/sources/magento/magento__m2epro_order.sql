

  














 

SELECT   `m2epro_order_id`,  `account_id`,  `marketplace_id`,  `sales_flat_order_id`,  `magento_order_creation_is_failed`,  `magento_order_creation_fails_count`,  `magento_order_creation_latest_attempt_date`,  `store_id`,  `reservation_state`,  `reservation_start_date`,  `component_mode`,  `additional_data`,  `update_date`,  `create_date`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m2epro_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `account_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`marketplace_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`marketplace_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `marketplace_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magento_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`magento_order_creation_failure` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_order_creation_failure` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`magento_order_creation_failure` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_order_creation_failure` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `magento_order_creation_is_failed`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magento_order_creation_fails_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_order_creation_fails_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `magento_order_creation_fails_count`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magento_order_creation_latest_attempt_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_order_creation_latest_attempt_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `magento_order_creation_latest_attempt_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reservation_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reservation_state` AS string)), '') AS string) END as string)
 AS `reservation_state`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reservation_start_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reservation_start_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `reservation_start_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`component_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`component_mode` AS string)), '') AS string) END as string)
 AS `component_mode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) END as string)
 AS `additional_data`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`update_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`update_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `update_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`create_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `create_date`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order` AS source_table

 ) AS un_ordered


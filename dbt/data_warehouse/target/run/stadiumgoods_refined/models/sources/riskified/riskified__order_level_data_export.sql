

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`riskified__order_level_data_export`
  OPTIONS()
  as 



















 

SELECT   `order_id`,  `order_name`,  `customer_id`,  `created_at`,  `submitted_at`,  `decided_at`,  `review_time_ms_`,  `riskified_status`,  `order_amount_`,  `external_status`,  `decline_category`,  `decline_reason`,  `chargeback_status`,  `cancel_reason`,  `post_decline_decision`,  `file_name`,  `file_time`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_name` AS string)), '') AS string) END as string)
 AS `order_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as string)
 AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) END as string)
 AS `submitted_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`decided_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`decided_at` AS string)), '') AS string) END as string)
 AS `decided_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`review_time_ms_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`review_time_ms_` AS string)), '') AS string) END as string)
 AS `review_time_ms_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`riskified_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`riskified_status` AS string)), '') AS string) END as string)
 AS `riskified_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_amount_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_amount_` AS string)), '') AS string) END as string)
 AS `order_amount_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_status` AS string)), '') AS string) END as string)
 AS `external_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`decline_category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`decline_category` AS string)), '') AS string) END as string)
 AS `decline_category`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`decline_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`decline_reason` AS string)), '') AS string) END as string)
 AS `decline_reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chargeback_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chargeback_status` AS string)), '') AS string) END as string)
 AS `chargeback_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancel_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancel_reason` AS string)), '') AS string) END as string)
 AS `cancel_reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`post_decline_decision` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`post_decline_decision` AS string)), '') AS string) END as string)
 AS `post_decline_decision`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`riskified_order_level_data_export` AS source_table

 ) AS un_ordered

;


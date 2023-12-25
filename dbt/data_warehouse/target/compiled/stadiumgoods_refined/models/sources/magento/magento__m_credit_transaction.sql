


  









 

SELECT   `credit_transaction_id`,  `credit_balance_id`,  `balance_amount`,  `balance_delta`,  `action`,  `message`,  `is_notified`,  `created_at`,  `updated_at`,  `mag_order_id`,  `mag_creditmemo_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , CAST(regexp_extract(message, 
  r'#o\|([0-9]+)'
) AS string) AS `mag_order_id`
  , CAST(regexp_extract(message, 
  r'#m\|([0-9]+)'
) AS string) AS `mag_creditmemo_id` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `credit_transaction_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `credit_balance_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_amount` AS string)), '') AS string) END as float64)
 AS `balance_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_delta` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_delta` AS string)), '') AS string) END as float64)
 AS `balance_delta`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`action` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`action` AS string)), '') AS string) END as string)
 AS `action`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`message` AS string)), '') AS string) END as string)
 AS `message`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_notified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_notified` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_notified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_notified` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_notified`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_transaction` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered


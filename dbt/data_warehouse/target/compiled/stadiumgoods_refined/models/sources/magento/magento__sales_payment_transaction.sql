

  










 

SELECT   `sales_payment_transaction_id`,  `parent_sales_payment_transaction_id`,  `sales_flat_order_id`,  `sales_flat_order_payment_id`,  `transaction_id`,  `parent_transaction_id`,  `transaction_type`,  `is_closed`,  `additional_information`,  `created_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_payment_transaction_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `parent_sales_payment_transaction_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_payment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`txn_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`txn_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_txn_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_txn_id` AS string)), '') AS string) END as string)
 AS `parent_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`txn_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`txn_type` AS string)), '') AS string) END as string)
 AS `transaction_type`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_closed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_closed` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_closed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_closed` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_closed`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`additional_information` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`additional_information` AS string)), '') AS string) END as string)
 AS `additional_information`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_payment_transaction` AS source_table

 ) AS un_ordered




  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__settlement_data`
  OPTIONS()
  as 


  

















 

SELECT   `transaction_processed_at`,  `settlement_id`,  `transaction_id`,  `seller_reference_id`,  `transaction_type`,  `amazon_order_reference_id`,  `mag_order_id`,  `store_name`,  `currency_code`,  `transaction_description_details`,  `transaction_description`,  `transaction_amount`,  `transaction_percentage_fee`,  `transaction_fixed_fee`,  `transaction_fee`,  `net_transaction_amount`,  `unnamed_15`,  `file_time`,  `file_name`,  `settlement_date`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `refund_processed_at`,  `payment_fee`,  `refund_fee`
  FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS date) AS `settlement_date` 
FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_amount >= 0 then 'payment' WHEN transaction_amount < 0 then 'refund' END as string)
 AS `transaction_description`
  , 
    safe_cast(CASE WHEN transaction_amount >= 0 THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_amount < 0  THEN (-1 * transaction_amount) END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_amount >= 0 THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_amount < 0 THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN transaction_amount >= 0 THEN transaction_fee END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_amount < 0 THEN transaction_fee END as float64)
 AS `refund_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`transaction_posted_date` AS string)), '') AS string), 
  ' '
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`transaction_posted_date` AS string)), '') AS string), 
  ' '
, 
  ''
) END as timestamp)
 AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_id` AS string)), '') AS string) END as string)
 AS `settlement_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_reference_id` AS string)), '') AS string) END as string)
 AS `seller_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) END as string)
 AS `transaction_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) END as string)
 AS `amazon_order_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_order_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_name` AS string)), '') AS string) END as string)
 AS `store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_description` AS string)), '') AS string) END as string)
 AS `transaction_description_details`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`transaction_amount` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`transaction_amount` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`transaction_percentage_fee` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`transaction_percentage_fee` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `transaction_percentage_fee`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`transaction_fixed_fee` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`transaction_fixed_fee` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `transaction_fixed_fee`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`total_transaction_fee` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`total_transaction_fee` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `transaction_fee`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`net_transaction_amount` AS string)), '') AS string), 
  ','
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`net_transaction_amount` AS string)), '') AS string), 
  ','
, 
  ''
) END as float64)
 AS `net_transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_15` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_15` AS string)), '') AS string) END as string)
 AS `unnamed_15`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`



FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_pay_settlement_data` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;


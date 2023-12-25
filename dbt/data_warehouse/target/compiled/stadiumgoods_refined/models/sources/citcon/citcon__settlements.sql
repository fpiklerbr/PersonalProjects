

/* settlement time rule
-- todo:: if the raw data has a date, we just take the date as is
-- todo:: if it's a timestamp, we convert to America/New_York and then take the date
*/

  





















 

SELECT   `location`,  `store_name`,  `transaction_id`,  `parent_transaction_id`,  `reference`,  `transaction_processed_at`,  `transaction_description`,  `payment_method`,  `card_number`,  `vendor_reference`,  `transaction_amount`,  `sale`,  `tip`,  `discount`,  `authorization_amount`,  `net`,  `login_code`,  `transaction_tag`,  `terminal_id`,  `settlement_time`,  `file_name`,  `file_time`,  `settlement_id`,  `settlement_date`,  `payment_amount`,  `payment_processed_at`,  `payment_fee`,  `refund_amount`,  `refund_processed_at`,  `refund_fee`,  `flow_order_number`
  FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(settlement_time AS timestamp), 'America/New_York') AS date) AS `settlement_date` 
FROM ( 

SELECT
    *

  , 
    safe_cast(file_name as string)
 AS `settlement_id`
  , 
    safe_cast(CASE WHEN transaction_description = 'charge' THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'charge' THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'charge' THEN (discount + authorization_amount) END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'refund' THEN (-1 * transaction_amount) END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'refund' THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'refund' THEN (discount + authorization_amount) END as float64)
 AS `refund_fee`
  , 
    safe_cast(CASE WHEN left(reference, 4) <> 'ord-' THEN 'ord-' || reference END as string)
 AS `flow_order_number` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`location` AS string)), '') AS string) END as string)
 AS `location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_name` AS string)), '') AS string) END as string)
 AS `store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_transaction_id` AS string)), '') AS string) END as string)
 AS `parent_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference` AS string)), '') AS string) END as string)
 AS `reference`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'America/Los_Angeles') AS timestamp) AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) END as string)
 AS `payment_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_number` AS string)), '') AS string) END as string)
 AS `card_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vendor_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vendor_reference` AS string)), '') AS string) END as string)
 AS `vendor_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sale` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sale` AS string)), '') AS string) END as float64)
 AS `sale`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tip` AS string)), '') AS string) END as float64)
 AS `tip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount` AS string)), '') AS string) END as float64)
 AS `discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorization` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorization` AS string)), '') AS string) END as float64)
 AS `authorization_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net` AS string)), '') AS string) END as float64)
 AS `net`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`login_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`login_code` AS string)), '') AS string) END as string)
 AS `login_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_tag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_tag` AS string)), '') AS string) END as string)
 AS `transaction_tag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`terminal_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`terminal_id` AS string)), '') AS string) END as string)
 AS `terminal_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'America/Los_Angeles') AS timestamp) AS `settlement_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`citcon_settlements` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered


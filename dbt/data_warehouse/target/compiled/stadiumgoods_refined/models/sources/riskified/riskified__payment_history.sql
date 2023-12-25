
























 

SELECT   `order_name`,  `id`,  `order_date`,  `original_amount`,  `original_currency`,  `converted_amount`,  `uncovered_amount`,  `adjusted_amount`,  `customer_billing_name`,  `charge_amount`,  `transaction_amount`,  `transaction_id`,  `transaction_description`,  `currency`,  `charge_type`,  `fee`,  `transaction_processed_at`,  `reimbursed_order_amount`,  `reimbursed_chargeback_fee`,  `reimbursed_approval_fee`,  `reimbursed_transfer_fee`,  `chargeback_submitted_at`,  `file_name`,  `file_time`,  `submission_reason`
  FROM ( 

SELECT
    *

  , 
    safe_cast((-1 * charge_amount) as float64)
 AS `transaction_amount`
  , 
    safe_cast(coalesce(order_name, id) as string)
 AS `transaction_id`
  , 
    safe_cast(CASE WHEN charge_amount >= 0 THEN 'fee' WHEN charge_amount < 0 THEN 'reimbursement' END as string)
 AS `transaction_description` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_name` AS string)), '') AS string) END as string)
 AS `order_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as string)
 AS `id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as string)
 AS `order_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_amount` AS string)), '') AS string) END as float64)
 AS `original_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_currency` AS string)), '') AS string) END as string)
 AS `original_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`converted_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`converted_amount` AS string)), '') AS string) END as float64)
 AS `converted_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uncovered_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uncovered_amount` AS string)), '') AS string) END as float64)
 AS `uncovered_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_amount` AS string)), '') AS string) END as float64)
 AS `adjusted_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_billing_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_billing_name` AS string)), '') AS string) END as string)
 AS `customer_billing_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_amount` AS string)), '') AS string) END as float64)
 AS `charge_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_type` AS string)), '') AS string) END as string)
 AS `charge_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee` AS string)), '') AS string) END as float64)
 AS `fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charged_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charged_at` AS string)), '') AS string) END as timestamp)
 AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reimbursed_order_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reimbursed_order_amount` AS string)), '') AS string) END as float64)
 AS `reimbursed_order_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reimbursed_chargeback_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reimbursed_chargeback_fee` AS string)), '') AS string) END as float64)
 AS `reimbursed_chargeback_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reimbursed_approval_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reimbursed_approval_fee` AS string)), '') AS string) END as float64)
 AS `reimbursed_approval_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reimbursed_transfer_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reimbursed_transfer_fee` AS string)), '') AS string) END as float64)
 AS `reimbursed_transfer_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`chargeback_submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`chargeback_submitted_at` AS string)), '') AS string) END as string)
 AS `chargeback_submitted_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submission_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submission_reason` AS string)), '') AS string) END as string)
 AS `submission_reason`



FROM `ff-stadiumgoods-raw-live`.`imports`.`riskified_payment_history` AS source_table

 ) AS source_select_statement

 ) AS un_ordered


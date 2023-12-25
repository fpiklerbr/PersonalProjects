

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`flow__order_fraud_status`
  
  
  OPTIONS()
  as (
    







 

SELECT   `transaction_description`,  `order_id`,  `transaction_id`,  `file_name`,  `file_time`,  `order_discriminator`,  `is_refunded`
  FROM ( 

SELECT
    *

  , 
    safe_cast(transaction_description = 'declined' as boolean)
 AS `is_refunded` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_number` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_discriminator` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_discriminator` AS string)), '') AS string) END as string)
 AS `order_discriminator`



FROM `ff-stadiumgoods-raw-live`.`imports`.`flow_api_order_fraud_status` AS source_table

 ) AS source_select_statement

 ) AS un_ordered


  );
    


  













 

SELECT   `transaction_id`,  `authorization_reference_id`,  `amazon_order_reference_id`,  `authorization_amount`,  `currency_code`,  `seller_authorization_note`,  `authorization_status`,  `last_update_timestamp`,  `reason_code`,  `reason_description`,  `creation_timestamp`,  `expiration_timestamp`,  `file_time`,  `file_name`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_authorization_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_authorization_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorization_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorization_reference_id` AS string)), '') AS string) END as string)
 AS `authorization_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) END as string)
 AS `amazon_order_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorization_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorization_amount` AS string)), '') AS string) END as float64)
 AS `authorization_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_authorization_note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_authorization_note` AS string)), '') AS string) END as string)
 AS `seller_authorization_note`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorization_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorization_status` AS string)), '') AS string) END as string)
 AS `authorization_status`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`last_update_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`last_update_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) END as timestamp)
 AS `last_update_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_code` AS string)), '') AS string) END as string)
 AS `reason_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_description` AS string)), '') AS string) END as string)
 AS `reason_description`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`creation_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`creation_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) END as timestamp)
 AS `creation_timestamp`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`expiration_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`expiration_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) END as timestamp)
 AS `expiration_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`



FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_pay_authorization_data` AS source_table

 ) AS un_ordered


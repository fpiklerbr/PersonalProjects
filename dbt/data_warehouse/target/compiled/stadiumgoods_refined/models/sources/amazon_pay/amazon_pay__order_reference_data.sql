

  




















 

SELECT   `amazon_order_reference_id`,  `mag_order_id`,  `order_total`,  `currency_code`,  `seller_note`,  `destination_city`,  `destination_district_or_county`,  `destination_state_or_region`,  `destination_postal_code`,  `destination_country_code`,  `store_name`,  `custom_information`,  `order_reference_status`,  `last_update_timestamp`,  `reason_code`,  `reason_description`,  `creation_timestamp`,  `expiration_timestamp`,  `billing_agreement_id`,  `file_time`,  `file_name`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) END as string)
 AS `amazon_order_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_order_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_total` AS string)), '') AS string) END as string)
 AS `order_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_note` AS string)), '') AS string) END as string)
 AS `seller_note`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_city` AS string)), '') AS string) END as string)
 AS `destination_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_district_or_county` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_district_or_county` AS string)), '') AS string) END as string)
 AS `destination_district_or_county`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_state_or_region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_state_or_region` AS string)), '') AS string) END as string)
 AS `destination_state_or_region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_postal_code` AS string)), '') AS string) END as string)
 AS `destination_postal_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_country_code` AS string)), '') AS string) END as string)
 AS `destination_country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_name` AS string)), '') AS string) END as string)
 AS `store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`custom_information` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`custom_information` AS string)), '') AS string) END as string)
 AS `custom_information`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_reference_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_reference_status` AS string)), '') AS string) END as string)
 AS `order_reference_status`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_agreement_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_agreement_id` AS string)), '') AS string) END as string)
 AS `billing_agreement_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`



FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_pay_order_reference_data` AS source_table

 ) AS un_ordered


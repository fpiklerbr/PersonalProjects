

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order_address`
  OPTIONS()
  as 


  















 

SELECT   `sg_farfetch_order_address_id`,  `sg_farfetch_order_id`,  `firstname`,  `lastname`,  `customer_email`,  `region_id`,  `region`,  `postcode`,  `street`,  `city`,  `farfetch_country_code`,  `telephone`,  `address_type`,  `created_at`,  `updated_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_order_address_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`firstname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`firstname` AS string)), '') AS string) END as string)
 AS `firstname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lastname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lastname` AS string)), '') AS string) END as string)
 AS `lastname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `customer_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region_id` AS string)), '') AS string) END as string)
 AS `region_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region` AS string)), '') AS string) END as string)
 AS `region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`postcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`postcode` AS string)), '') AS string) END as string)
 AS `postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`street` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`street` AS string)), '') AS string) END as string)
 AS `street`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_id` AS string)), '') AS string) END as string)
 AS `farfetch_country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`telephone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`telephone` AS string)), '') AS string) END as string)
 AS `telephone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_type` AS string)), '') AS string) END as string)
 AS `address_type`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_address` AS source_table

 ) AS un_ordered

;


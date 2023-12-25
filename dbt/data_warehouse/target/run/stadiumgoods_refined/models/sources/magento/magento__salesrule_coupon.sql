

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__salesrule_coupon`
  OPTIONS()
  as 

  










 

SELECT   `salesrule_coupon_id`,  `salesrule_id`,  `coupon_code`,  `usage_limit`,  `usage_per_customer`,  `times_used`,  `expiration_date`,  `is_primary`,  `created_at`,  `coupon_type`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `salesrule_coupon_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rule_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rule_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `salesrule_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `coupon_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usage_limit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usage_limit` AS string)), '') AS string) END as float64)
 as int64)
 AS `usage_limit`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`usage_per_customer` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`usage_per_customer` AS string)), '') AS string) END as float64)
 as int64)
 AS `usage_per_customer`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`times_used` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`times_used` AS string)), '') AS string) END as float64)
 as int64)
 AS `times_used`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expiration_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expiration_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `expiration_date`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_primary` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_primary` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_primary` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_primary` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_primary`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `coupon_type`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule_coupon` AS source_table

 ) AS un_ordered

;




  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__dim_subscription_bis`
  
  
  OPTIONS()
  as (
    

  



















 

SELECT   `sk_subscription_bis`,  `subscription_bis_id`,  `sk_customer`,  `subscription_id`,  `tenant_id`,  `email`,  `country_code`,  `platform`,  `product_id`,  `product_variant`,  `product_scale`,  `product_size`,  `product_size_code`,  `stock_qty`,  `last_restock_date`,  `has_been_notified`,  `notification_date`,  `row_active_date`,  `row_update_date`,  `row_exclude_date`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sk_subscription_bis` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sk_subscription_bis` AS string)), '') AS string) END as string)
 AS `sk_subscription_bis`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subscription_bis_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subscription_bis_id` AS string)), '') AS string) END as string)
 AS `subscription_bis_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sk_customer` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sk_customer` AS string)), '') AS string) END as string)
 AS `sk_customer`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subscription_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subscription_id` AS string)), '') AS string) END as string)
 AS `subscription_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `tenant_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_code` AS string)), '') AS string) END as string)
 AS `country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`platform` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`platform` AS string)), '') AS string) END as string)
 AS `platform`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_variant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_variant` AS string)), '') AS string) END as string)
 AS `product_variant`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_scale` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_scale` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_scale`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_size` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_size_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_size_code` AS string)), '') AS string) END as string)
 AS `product_size_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stock_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stock_qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `stock_qty`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_restock_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_restock_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `last_restock_date`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`has_been_notified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`has_been_notified` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`has_been_notified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`has_been_notified` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `has_been_notified`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`notification_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`notification_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `notification_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_active_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_active_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `row_active_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_update_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_update_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `row_update_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_exclude_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_exclude_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `row_exclude_date`



FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_dim_subscription_bis` AS source_table

 ) AS un_ordered


  );
    
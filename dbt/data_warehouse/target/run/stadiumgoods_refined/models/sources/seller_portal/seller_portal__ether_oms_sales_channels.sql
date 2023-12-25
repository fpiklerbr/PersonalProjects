

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_sales_channels`
  OPTIONS()
  as 





















 

SELECT   `ether_oms_sales_channel_id`,  `sales_channel_code`,  `sales_channel_name`,  `sla_hours`,  `created_at`,  `updated_at`,  `reallocation_threshold_percent`,  `reallocation_max_price_difference`,  `reallocation_max_price_difference_currency`,  `delivery_strategy`,  `auto_cancel`,  `auto_reallocate`,  `is_active`,  `phone`,  `dummy`,  `description`,  `auto_cancel_after_deadline_hours`,  `client_code_suffix`,  `_synched_from_source_at`
    , `_raw_order_number_prefix`
  FROM ( 

SELECT
    *

  , 
    safe_cast(_raw_reallocation_max_price_difference_cents / 100 as numeric)
 AS `reallocation_max_price_difference` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_sales_channel_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `sales_channel_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `sales_channel_name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sla_hours` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sla_hours` AS string)), '') AS string) END as float64)
 as int64)
 AS `sla_hours`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reallocation_threshold_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocation_threshold_percent` AS string)), '') AS string) END as numeric)
 AS `reallocation_threshold_percent`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reallocation_max_price_difference_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocation_max_price_difference_cents` AS string)), '') AS string) END as numeric)
 AS `_raw_reallocation_max_price_difference_cents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reallocation_max_price_difference_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocation_max_price_difference_currency` AS string)), '') AS string) END as string)
 AS `reallocation_max_price_difference_currency`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_strategy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_strategy` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_strategy`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auto_cancel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auto_cancel` AS string)), '') AS string) END as float64)
 as int64)
 AS `auto_cancel`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auto_reallocate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auto_reallocate` AS string)), '') AS string) END as float64)
 as int64)
 AS `auto_reallocate`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_active`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`phone` AS string)), '') AS string) END as string)
 AS `phone`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dummy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dummy` AS string)), '') AS string) END as float64)
 as int64)
 AS `dummy`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auto_cancel_after_deadline_hours` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auto_cancel_after_deadline_hours` AS string)), '') AS string) END as float64)
 as int64)
 AS `auto_cancel_after_deadline_hours`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`client_code_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`client_code_suffix` AS string)), '') AS string) END as string)
 AS `client_code_suffix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `order_number_prefix` AS `_raw_order_number_prefix`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_sales_channels` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;


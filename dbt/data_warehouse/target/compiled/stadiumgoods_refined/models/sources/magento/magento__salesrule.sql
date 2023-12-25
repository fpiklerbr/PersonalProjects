


  







































 

SELECT   `salesrule_id`,  `salesrule_name`,  `salesrule_description`,  `from_date`,  `to_date`,  `uses_per_customer`,  `is_active`,  `conditions_serialized`,  `actions_serialized`,  `stop_rules_processing`,  `is_advanced`,  `product_ids`,  `sort_order`,  `simple_action`,  `discount_amount`,  `discount_qty`,  `discount_step`,  `simple_free_shipping`,  `apply_to_shipping`,  `times_used`,  `is_rss`,  `coupon_type`,  `use_auto_generation`,  `uses_per_coupon`,  `amrule_days_of_week`,  `amrule_from_time`,  `amrule_to_time`,  `amrule_use_time`,  `amrule_use_weekdays`,  `promo_sku`,  `promo_cats`,  `each_m`,  `buy_x_get_n`,  `price_selector`,  `max_discount`,  `amskip_rule`,  `api_only`,  `apply_to_us_only`
    , `_raw_final_sale`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rule_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rule_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `salesrule_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `salesrule_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `salesrule_description`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`from_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`from_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `from_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`to_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`to_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `to_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uses_per_customer` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uses_per_customer` AS string)), '') AS string) END as float64)
 as int64)
 AS `uses_per_customer`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_active`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`conditions_serialized` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`conditions_serialized` AS string)), '') AS string) END as string)
 AS `conditions_serialized`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`actions_serialized` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`actions_serialized` AS string)), '') AS string) END as string)
 AS `actions_serialized`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stop_rules_processing` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stop_rules_processing` AS string)), '') AS string) END as float64)
 as int64)
 AS `stop_rules_processing`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_advanced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_advanced` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_advanced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_ids` AS string)), '') AS string) END as string)
 AS `product_ids`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sort_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sort_order` AS string)), '') AS string) END as float64)
 as int64)
 AS `sort_order`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`simple_action` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`simple_action` AS string)), '') AS string) END as string)
 AS `simple_action`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) END as float64)
 AS `discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_qty` AS string)), '') AS string) END as numeric)
 AS `discount_qty`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_step` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_step` AS string)), '') AS string) END as float64)
 as int64)
 AS `discount_step`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`simple_free_shipping` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`simple_free_shipping` AS string)), '') AS string) END as float64)
 as int64)
 AS `simple_free_shipping`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`apply_to_shipping` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`apply_to_shipping` AS string)), '') AS string) END as float64)
 as int64)
 AS `apply_to_shipping`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`times_used` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`times_used` AS string)), '') AS string) END as float64)
 as int64)
 AS `times_used`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_rss` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_rss` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_rss`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_type` AS string)), '') AS string) END as float64)
 as int64)
 AS `coupon_type`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`use_auto_generation` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`use_auto_generation` AS string)), '') AS string) END as float64)
 as int64)
 AS `use_auto_generation`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uses_per_coupon` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uses_per_coupon` AS string)), '') AS string) END as float64)
 as int64)
 AS `uses_per_coupon`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amrule_days_of_week` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amrule_days_of_week` AS string)), '') AS string) END as string)
 AS `amrule_days_of_week`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amrule_from_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amrule_from_time` AS string)), '') AS string) END as string)
 AS `amrule_from_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amrule_to_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amrule_to_time` AS string)), '') AS string) END as string)
 AS `amrule_to_time`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amrule_use_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amrule_use_time` AS string)), '') AS string) END as float64)
 as int64)
 AS `amrule_use_time`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amrule_use_weekdays` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amrule_use_weekdays` AS string)), '') AS string) END as float64)
 as int64)
 AS `amrule_use_weekdays`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_sku` AS string)), '') AS string) END as string)
 AS `promo_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_cats` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_cats` AS string)), '') AS string) END as string)
 AS `promo_cats`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`each_m` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`each_m` AS string)), '') AS string) END as float64)
 as int64)
 AS `each_m`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buy_x_get_n` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buy_x_get_n` AS string)), '') AS string) END as float64)
 as int64)
 AS `buy_x_get_n`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_selector` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_selector` AS string)), '') AS string) END as float64)
 as int64)
 AS `price_selector`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`max_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`max_discount` AS string)), '') AS string) END as float64)
 AS `max_discount`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amskip_rule` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amskip_rule` AS string)), '') AS string) END as float64)
 as int64)
 AS `amskip_rule`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`api_only` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`api_only` AS string)), '') AS string) END as float64)
 as int64)
 AS `api_only`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`apply_to_us_only` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`apply_to_us_only` AS string)), '') AS string) END as float64)
 as int64)
 AS `apply_to_us_only`


  , `final_sale` AS `_raw_final_sale`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule` AS source_table

 ) AS un_ordered


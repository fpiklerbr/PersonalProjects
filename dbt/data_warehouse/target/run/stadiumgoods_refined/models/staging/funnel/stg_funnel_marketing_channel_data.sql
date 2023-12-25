

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_funnel_marketing_channel_data`
  
  
  OPTIONS()
  as (
    SELECT DISTINCT
  raw_funnel_io.`date_id`,
  raw_funnel_io.`connection_type_code`,
  raw_funnel_io.`connection_id`,
  raw_funnel_io.`base_currency`,
  raw_funnel_io.`clicks`,
  raw_funnel_io.`impressions`,
  raw_funnel_io.`app_installs`,
  raw_funnel_io.`campaign`,
  raw_funnel_io.`clickthrough_rate`,
  raw_funnel_io.`media_type`,
  raw_funnel_io.`traffic_type`,
  raw_funnel_io.`traffic_source`,
  raw_funnel_io.`data_origin_identifier`,
  raw_funnel_io.`data_source_id`,
  raw_funnel_io.`data_source_definition_label`,
  raw_funnel_io.`data_source_name`,
  raw_funnel_io.`data_source_type`,
  raw_funnel_io.`data_source_description`,
  raw_funnel_io.`funnel_account_id`,
  raw_funnel_io.`funnel_account_name`,
  raw_funnel_io.`row_count`,
  raw_funnel_io.`day_of_week`,
  raw_funnel_io.`month`,
  raw_funnel_io.`month_number`,
  raw_funnel_io.`week`,
  raw_funnel_io.`week_number`,
  raw_funnel_io.`week_number_iso`,
  raw_funnel_io.`year`,
  raw_funnel_io.`marketing_channel_type`,
  raw_funnel_io.`marketing_channel_name`,
  raw_funnel_io.`geography_type`,
  raw_funnel_io.`marketing_category`,
  raw_funnel_io.`spend_type`,
  raw_funnel_io.`device`
  , round(CAST(cost_base_amount * CASE WHEN raw_funnel_io.base_currency = 'USD' THEN 1.0
ELSE cast(currency_conversion.in_usd AS numeric)
END AS numeric), 2) AS cost
    , cost_base_amount
  , round(CAST(platform_revenue_base_amount * CASE WHEN raw_funnel_io.base_currency = 'USD' THEN 1.0
ELSE cast(currency_conversion.in_usd AS numeric)
END AS numeric), 2) AS platform_revenue
    , platform_revenue_base_amount
  , round(CAST(cost_per_click_base_amount * CASE WHEN raw_funnel_io.base_currency = 'USD' THEN 1.0
ELSE cast(currency_conversion.in_usd AS numeric)
END AS numeric), 2) AS cost_per_click
    , cost_per_click_base_amount
  , round(CAST(cost_per_mille_base_amount * CASE WHEN raw_funnel_io.base_currency = 'USD' THEN 1.0
ELSE cast(currency_conversion.in_usd AS numeric)
END AS numeric), 2) AS cost_per_mille
    , cost_per_mille_base_amount
  
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`funnel__all_funnel_data_view` AS raw_funnel_io
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS currency_conversion -- at most one to one
    ON  raw_funnel_io.base_currency = currency_conversion.currency
    AND raw_funnel_io.date_id = currency_conversion.transaction_date
  );
    


  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history`
  
  
  OPTIONS()
  as (
    

WITH log AS (

  SELECT
      cast('stg_channel_upcharge_history_logged_changes' AS string) AS upcharge_source
    , channel_or_gateway
    , upcharge_type
    , log_sequence
    , upcharge_value
    , coalesce(valid_from, cast('1970-01-01 00:00:00' AS timestamp)) AS valid_from
    , coalesce(valid_to, cast('2038-01-19 03:14:08' AS timestamp)) AS valid_to
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history_logged_changes`

), magento AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_serial_price_channels`

), seed AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_channel_upcharges`

), magento_flat AS (

  SELECT DISTINCT
      cast('stg_magento_serial_price_channels' AS string) AS upcharge_source
    , magento.channel_or_gateway
    , cast('flat' AS string) AS upcharge_type
    , cast(NULL AS int64) AS log_sequence
    , magento.upcharge_flat AS upcharge_value
    , cast('1970-01-01 00:00:00' AS timestamp) AS valid_from
    , cast('2038-01-19 03:14:08' AS timestamp) AS valid_to
  FROM magento
  LEFT JOIN log
    ON magento.channel_or_gateway = log.channel_or_gateway
    AND log.upcharge_type = 'flat'
  WHERE magento.upcharge_flat IS NOT NULL
    AND log.channel_or_gateway IS NULL

), magento_percentage AS (

  SELECT DISTINCT
      cast('stg_magento_serial_price_channels' AS string) AS upcharge_source
    , magento.channel_or_gateway
    , cast('percentage' AS string) AS upcharge_type
    , cast(NULL AS int64) AS log_sequence
    , magento.upcharge_percentage AS upcharge_value
    , cast('1970-01-01 00:00:00' AS timestamp) AS valid_from
    , cast('2038-01-19 03:14:08' AS timestamp) AS valid_to
  FROM magento
  LEFT JOIN log
    ON magento.channel_or_gateway = log.channel_or_gateway
    AND log.upcharge_type = 'percentage'
  WHERE magento.upcharge_percentage IS NOT NULL
    AND log.channel_or_gateway IS NULL

), seed_flat AS (

  SELECT
      cast('lookup_channel_upcharges' AS string) AS upcharge_source
    , seed.channel_or_gateway
    , cast('flat' AS string) AS upcharge_type
    , cast(NULL AS int64) AS log_sequence
    , seed.upcharge_flat AS upcharge_value
    , cast('1970-01-01 00:00:00' AS timestamp) AS valid_from
    , cast('2038-01-19 03:14:08' AS timestamp) AS valid_to
  FROM seed
  LEFT JOIN log
    ON seed.channel_or_gateway = log.channel_or_gateway
    AND log.upcharge_type = 'flat'
  LEFT JOIN magento_flat
    ON seed.channel_or_gateway = magento_flat.channel_or_gateway
  WHERE seed.upcharge_flat IS NOT NULL
    AND log.channel_or_gateway IS NULL
    AND magento_flat.channel_or_gateway IS NULL

), seed_percentage AS (

  SELECT
      cast('lookup_channel_upcharges' AS string) AS upcharge_source
    , seed.channel_or_gateway
    , cast('percentage' AS string) AS upcharge_type
    , cast(NULL AS int64) AS log_sequence
    , seed.upcharge_percentage AS upcharge_value
    , cast('1970-01-01 00:00:00' AS timestamp) AS valid_from
    , cast('2038-01-19 03:14:08' AS timestamp) AS valid_to
  FROM seed
  LEFT JOIN log
    ON seed.channel_or_gateway = log.channel_or_gateway
    AND log.upcharge_type = 'percentage'
  LEFT JOIN magento_percentage
    ON seed.channel_or_gateway = magento_percentage.channel_or_gateway
  WHERE seed.upcharge_percentage IS NOT NULL
    AND log.channel_or_gateway IS NULL
    AND magento_percentage.channel_or_gateway IS NULL

), final AS (

  SELECT * FROM log
  UNION ALL
  SELECT * FROM magento_flat
  UNION ALL
  SELECT * FROM magento_percentage
  UNION ALL
  SELECT * FROM seed_flat
  UNION ALL
  SELECT * FROM seed_percentage

)

SELECT * FROM final
  );
    
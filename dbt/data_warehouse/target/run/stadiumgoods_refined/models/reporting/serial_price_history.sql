

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history`
  
  
  OPTIONS()
  as (
    WITH magento_serials AS (

  SELECT
      price_change_events.serial_number
    , max(price_change_events.serial_row_number) AS last_serial_source_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_price_change_events` AS price_change_events
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON price_change_events.serial_number = inventory_units.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_price_history_summary` AS ether_summary
    ON inventory_units.ether_wms_inventory_unit_id = ether_summary.ether_wms_inventory_unit_id
  WHERE ether_summary.price_first_logged_at IS NULL
    OR price_change_events.log_timestamp_utc < ether_summary.price_first_logged_at
  GROUP BY 1

), magento_log AS (

  SELECT
      price_change_events.serial_number
    , cast('Magento log' AS string) AS price_change_source
    , price_change_events.log_timestamp_utc AS logged_at
    , price_change_events.serial_log_id AS log_entry_id
    , price_change_events.log_event AS log_entry_type
    , round(cast(price_change_events.old_price AS numeric), 2) AS previous_price_base_amount
    , round(cast(price_change_events.price AS numeric), 2) AS price_base_amount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_price_change_events` AS price_change_events
  INNER JOIN magento_serials
    ON price_change_events.serial_number = magento_serials.serial_number
  WHERE price_change_events.serial_row_number <= magento_serials.last_serial_source_row

), ether_log AS (

  SELECT
      inventory_units.serial_number
    , cast('Ether log' AS string) AS price_change_source
    , price_history.valid_from AS logged_at
    , price_history.ether_wms_inventory_unit_version_id AS log_entry_id
    , price_history.action_type AS log_entry_type
    , price_history.previous_price_base_amount
    , price_history.price_base_amount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_price_history` AS price_history
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON price_history.ether_wms_inventory_unit_id = inventory_units.ether_wms_inventory_unit_id
  WHERE inventory_units.serial_number IS NOT NULL
    AND (price_history.previous_price_base_amount <> 0 OR price_history.price_base_amount <> 0)

), log_union AS (

  SELECT
    *
  FROM magento_log
  UNION ALL
  SELECT
    *
  FROM ether_log

), logged_and_unlogged AS (

  SELECT
      serial_number
    , price_change_source
    , row_number() OVER (PARTITION BY serial_number ORDER BY logged_at, log_entry_id) AS serial_price_row
    , logged_at
    , log_entry_id
    , log_entry_type
    , previous_price_base_amount
    , price_base_amount
  FROM log_union
  UNION ALL
  SELECT
      inventory_units.serial_number
    , cast('Ether inventory unit' AS string) AS price_change_source
    , cast(1 AS int64) AS serial_price_row
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS numeric) AS previous_price_base_amount
    , inventory_units.price_base_amount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
  LEFT JOIN log_union
   ON inventory_units.serial_number = log_union.serial_number
  WHERE inventory_units.serial_number IS NOT NULL
  AND log_union.serial_number IS NULL

), full_history AS (

  SELECT
    *
  FROM logged_and_unlogged
  UNION ALL
  SELECT
      serial_number
    , cast('Inferred from earliest log entry' AS string) AS price_change_source
    , cast(0 AS int64) AS serial_price_row
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS numeric) AS previous_price_base_amount
    , previous_price_base_amount AS price_base_amount
  FROM logged_and_unlogged
  WHERE serial_price_row = 1
    AND previous_price_base_amount <> 0

), price_history AS (

  SELECT
      full_history.*
    , CASE
        WHEN lag(full_history.serial_number) OVER (PARTITION BY full_history.serial_number ORDER BY full_history.serial_price_row) IS NULL
        THEN cast('1970-01-01 00:00:00' AS timestamp)
        ELSE full_history.logged_at
      END AS valid_from
    , coalesce(
          
  

timestamp_add(cast( lead(full_history.logged_at) OVER (PARTITION BY full_history.serial_number ORDER BY full_history.serial_price_row) as timestamp),
        interval -1 second)



        , cast('2038-01-19 03:14:08' AS timestamp)
      ) AS valid_to
    , coalesce(inventory_units.base_currency, 'USD') AS base_currency
    , CASE
        WHEN lag(full_history.serial_number) OVER (PARTITION BY full_history.serial_number ORDER BY full_history.serial_price_row) IS NULL
        THEN coalesce(
            inventory_units.intake_date
          , safe_cast(datetime(safe_cast(nullif(
     least(
      coalesce(inventory_units.created_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(full_history.logged_at, CAST('9999-12-31 23:59:59' AS timestamp))
      
      )
     , CAST('9999-12-31 23:59:59' AS timestamp)
  ) AS timestamp), 
  r'America/New_York'
) AS date)
        )
        ELSE safe_cast(datetime(safe_cast(full_history.logged_at AS timestamp), 
  r'America/New_York'
) AS date)
      END AS currency_conversion_date
  FROM full_history
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON full_history.serial_number = inventory_units.serial_number

), final AS (

  SELECT
      price_history.*
    , CASE
  WHEN price_history.base_currency = 'USD'
  THEN 1.0000
  ELSE round(cast(exchange_rates.in_usd AS numeric), 4)
END AS currency_conversion_rate
    , round(CASE
  WHEN price_history.base_currency = 'USD'
  THEN 1.0000
  ELSE round(cast(exchange_rates.in_usd AS numeric), 4)
END * price_history.previous_price_base_amount, 2) AS previous_price
    , round(CASE
  WHEN price_history.base_currency = 'USD'
  THEN 1.0000
  ELSE round(cast(exchange_rates.in_usd AS numeric), 4)
END * price_history.price_base_amount, 2) AS price
    , (
        price_history.valid_from <> cast('1970-01-01 00:00:00' AS timestamp)
        AND coalesce(price_history.previous_price_base_amount, 0) <> 0
      ) AS is_price_change
  FROM price_history
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS exchange_rates
    ON price_history.base_currency = exchange_rates.currency
    AND price_history.currency_conversion_date = exchange_rates.transaction_date

)

SELECT * FROM final
  );
    
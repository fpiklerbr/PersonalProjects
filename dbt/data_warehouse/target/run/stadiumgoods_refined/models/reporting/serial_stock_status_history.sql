

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_stock_status_history`
  
  
  OPTIONS()
  as (
    



WITH x3_serials_before AS (

-- WHERE ether_summary.stock_status_first_logged_at IS NULL --> fetch the serial list of x3 specific (no matching in ether)
-- WHERE x3_change_events.logged_at < ether_summary.stock_status_first_logged_at --> and over-lapping part (x3 has earlier records)
  SELECT
      x3_change_events.serial_number
    , max(x3_change_events.serial_row_number) AS last_serial_source_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_stock_status_change_events` AS x3_change_events
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON x3_change_events.serial_number = inventory_units.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_stock_status_summary` AS ether_summary
    ON inventory_units.ether_wms_inventory_unit_id = ether_summary.ether_wms_inventory_unit_id
  WHERE ether_summary.stock_status_first_logged_at IS NULL
    OR x3_change_events.logged_at < ether_summary.stock_status_first_logged_at
  GROUP BY 1

), x3_serials_after AS (

-- WHERE ether_summary.stock_status_first_logged_at IS NOT NULL
-- WHERE x3_change_events.logged_at > ether_summary.stock_status_last_changed_at --> and over-lapping part (x3 has later records)
  SELECT
      x3_change_events.serial_number
    , min(x3_change_events.serial_row_number) AS first_serial_source_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_stock_status_change_events` AS x3_change_events
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON x3_change_events.serial_number = inventory_units.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_stock_status_summary` AS ether_summary
    ON inventory_units.ether_wms_inventory_unit_id = ether_summary.ether_wms_inventory_unit_id
  WHERE ether_summary.stock_status_first_logged_at IS NOT NULL
    AND x3_change_events.logged_at > ether_summary.stock_status_last_changed_at
  GROUP BY 1

), x3_log_before AS (

  SELECT
      stock_status_change_events.serial_number
    , cast('X3 log' AS string) AS stock_status_change_source
    , stock_status_change_events.logged_at
    , cast(stock_status_change_events.row_id AS int64) AS log_entry_id
    , stock_status_change_events.action_type AS log_entry_type
    , previous_stock_status
    , stock_status
    , creation_user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_stock_status_change_events` AS stock_status_change_events
  INNER JOIN x3_serials_before
    ON  stock_status_change_events.serial_number = x3_serials_before.serial_number
  WHERE stock_status_change_events.serial_row_number <= x3_serials_before.last_serial_source_row

), x3_log_after AS (

  SELECT
      stock_status_change_events.serial_number
    , cast('X3 log' AS string) AS stock_status_change_source
    , stock_status_change_events.logged_at
    , cast(stock_status_change_events.row_id AS int64) AS log_entry_id
    , stock_status_change_events.action_type AS log_entry_type
    , previous_stock_status
    , stock_status
    , creation_user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_stock_status_change_events` AS stock_status_change_events
  INNER JOIN x3_serials_after
    ON  stock_status_change_events.serial_number = x3_serials_after.serial_number
  WHERE stock_status_change_events.serial_row_number >= x3_serials_after.first_serial_source_row

), ether_log AS (

-- ether specific log, where joins happen and add dependent values
  SELECT
      inventory_units.serial_number
    , cast('Ether log' AS string) AS stock_status_change_source
    , stock_status_history.logged_at
    , stock_status_history.ether_wms_inventory_unit_version_id AS log_entry_id
    , stock_status_history.action_type AS log_entry_type
    , CASE CAST(stock_status_history.previous_stock_status_code AS string)
WHEN '0'  THEN cast( 'A' AS string)
WHEN '1'  THEN cast( 'AC' AS string)
WHEN '2'  THEN cast( 'Q' AS string)
WHEN '3'  THEN cast( 'RW' AS string)
WHEN '4'  THEN cast( 'R' AS string)
WHEN '5'  THEN cast( 'A1' AS string)
WHEN '6'  THEN cast( 'A2' AS string)
WHEN '7'  THEN cast( 'A3' AS string)
WHEN '8'  THEN cast( 'AD' AS string)
WHEN '9'  THEN cast( 'AZ' AS string)
WHEN '10' THEN cast( 'Q1' AS string)
WHEN '11' THEN cast( 'A4' AS string)
WHEN '12' THEN cast( 'No Status' AS string)
ELSE CAST(stock_status_history.previous_stock_status_code AS string)
END AS previous_stock_status
    , CASE CAST(stock_status_history.stock_status_code AS string)
WHEN '0'  THEN cast( 'A' AS string)
WHEN '1'  THEN cast( 'AC' AS string)
WHEN '2'  THEN cast( 'Q' AS string)
WHEN '3'  THEN cast( 'RW' AS string)
WHEN '4'  THEN cast( 'R' AS string)
WHEN '5'  THEN cast( 'A1' AS string)
WHEN '6'  THEN cast( 'A2' AS string)
WHEN '7'  THEN cast( 'A3' AS string)
WHEN '8'  THEN cast( 'AD' AS string)
WHEN '9'  THEN cast( 'AZ' AS string)
WHEN '10' THEN cast( 'Q1' AS string)
WHEN '11' THEN cast( 'A4' AS string)
WHEN '12' THEN cast( 'No Status' AS string)
ELSE CAST(stock_status_history.stock_status_code AS string)
END AS stock_status
    , employees.employee_name AS creation_user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_stock_status_history` AS stock_status_history
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_units` AS inventory_units
   ON stock_status_history.ether_wms_inventory_unit_id =  inventory_units.ether_wms_inventory_unit_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS employees
   ON COALESCE(stock_status_history.employee_id, stock_status_history.user_id) = employees.employee_id
  WHERE inventory_units.serial_number IS NOT NULL
  AND (stock_status_history.previous_stock_status_code IS NOT NULL
        OR stock_status_history.stock_status_code IS NOT NULL)

), log_union AS (

  SELECT
    *
  FROM x3_log_before
  UNION ALL
  SELECT
    *
  FROM x3_log_after
  UNION ALL
  SELECT
    *
  FROM ether_log

), logged_and_unlogged AS (

-- serials have stock_status change
  SELECT
      serial_number
    , stock_status_change_source
    , row_number() OVER (PARTITION BY serial_number ORDER BY logged_at, log_entry_id) AS serial_stock_status_row
    , logged_at
    , log_entry_id
    , log_entry_type
    , previous_stock_status
    , stock_status
    , creation_user_name
  FROM log_union
  UNION ALL
-- serials never have stock_status change
  SELECT
      inventory_units.serial_number
    , cast('Ether inventory unit' AS string) AS stock_status_change_source
    , cast(1 AS int64) AS serial_stock_status_row
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS string) AS previous_stock_status
    , inventory_units.stock_status AS stock_status
    , cast(NULL AS string) AS creation_user_name
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
-- adding a previous row (create type) for log like 'xxx'--> 'yyy' (update type)
  SELECT
      serial_number
    , cast('Inferred from earliest log entry' AS string) AS stock_status_change_source
    , cast(0 AS int64) AS serial_stock_status_row
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS string) AS previous_stock_status
    , previous_stock_status AS stock_status
    , cast(NULL AS string) AS creation_user_name
  FROM logged_and_unlogged
  WHERE serial_stock_status_row = 1
    AND previous_stock_status IS NOT NULL

), stock_status_history_scd AS (

-- SCD modeling par
  SELECT
      full_history.*
    , CASE
        WHEN lag(full_history.serial_number) OVER (PARTITION BY full_history.serial_number ORDER BY full_history.serial_stock_status_row) IS NULL
        THEN cast('1970-01-01 00:00:00' AS timestamp)
        ELSE full_history.logged_at
      END AS valid_from
    , coalesce(
          
  

timestamp_add(cast( lead(full_history.logged_at) OVER (PARTITION BY full_history.serial_number ORDER BY full_history.serial_stock_status_row) as timestamp),
        interval -1 second)



        , cast('2038-01-19 03:14:08' AS timestamp)
      ) AS valid_to
  FROM full_history

), final AS (

  SELECT *
  , (valid_from <> cast('1970-01-01 00:00:00' AS timestamp) AND previous_stock_status IS NOT NULL) AS is_stock_status_change
  FROM stock_status_history_scd

)

SELECT * FROM final
  );
    
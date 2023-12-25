

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_warehouse_history`
  
  
  OPTIONS()
  as (
    WITH x3_serials_before AS (

-- fetch the serial list of x3 specific (no matching in ether)
-- and over-lapping part (x3 has earlier records)
  SELECT
      x3_change_events.serial_number
    , max(x3_change_events.serial_row_number) AS last_serial_source_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_warehouse_change_events` AS x3_change_events
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON x3_change_events.serial_number = inventory_units.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_warehouse_history_summary` AS ether_summary
    ON inventory_units.ether_wms_inventory_unit_id = ether_summary.ether_wms_inventory_unit_id
  WHERE ether_summary.warehouse_first_logged_at IS NULL
    OR x3_change_events.logged_at < ether_summary.warehouse_first_logged_at
  GROUP BY 1

), x3_serials_after AS (

-- fetch the serials that (x3 has later records than Ether)
  SELECT
      x3_change_events.serial_number
    , min(x3_change_events.serial_row_number) AS first_serial_source_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_warehouse_change_events` AS x3_change_events
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON x3_change_events.serial_number = inventory_units.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_warehouse_history_summary` AS ether_summary
    ON inventory_units.ether_wms_inventory_unit_id = ether_summary.ether_wms_inventory_unit_id
  WHERE ether_summary.warehouse_first_logged_at IS NOT NULL
    AND x3_change_events.logged_at > ether_summary.warehouse_last_changed_at
   --and x3_change_events.serial_number = '22114240630'
  GROUP BY 1

), x3_log_before AS (

  SELECT
      warehouse_change_events.serial_number
    , cast('X3 log' AS string) AS warehouse_change_source
    , warehouse_change_events.logged_at
    , cast(warehouse_change_events.row_id AS int64) AS log_entry_id
    , warehouse_change_events.action_type AS log_entry_type
    , previous_warehouse
    , warehouse
    , creation_user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_warehouse_change_events` AS warehouse_change_events
  INNER JOIN x3_serials_before
    ON  warehouse_change_events.serial_number = x3_serials_before.serial_number
  WHERE warehouse_change_events.serial_row_number <= x3_serials_before.last_serial_source_row

), x3_log_after AS (

  SELECT
      warehouse_change_events.serial_number
    , cast('X3 log' AS string) AS warehouse_change_source
    , warehouse_change_events.logged_at
    , cast(warehouse_change_events.row_id AS int64) AS log_entry_id
    , warehouse_change_events.action_type AS log_entry_type
    , previous_warehouse
    , warehouse
    , creation_user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_log_warehouse_change_events` AS warehouse_change_events
  INNER JOIN x3_serials_after
    ON  warehouse_change_events.serial_number = x3_serials_after.serial_number
  WHERE warehouse_change_events.serial_row_number >= x3_serials_after.first_serial_source_row

), ether_log AS (

-- ether specific log, where joins happen and add dependent values
  SELECT
      inventory_units.serial_number
    , cast('Ether log' AS string) AS warehouse_change_source
    , warehouse_history.logged_at
    , warehouse_history.ether_wms_inventory_unit_version_id AS log_entry_id
    , warehouse_history.action_type AS log_entry_type
    , previous_warehouses.warehouse_code AS previous_warehouse
    , warehouses.warehouse_code AS warehouse
    , employees.employee_name AS creation_user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_warehouse_history` AS warehouse_history
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_units` AS inventory_units
   ON warehouse_history.ether_wms_inventory_unit_id =  inventory_units.ether_wms_inventory_unit_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS warehouses
   ON warehouse_history.ether_wms_warehouse_id = warehouses.ether_wms_warehouse_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS previous_warehouses
   ON warehouse_history.previous_ether_wms_warehouse_id = previous_warehouses.ether_wms_warehouse_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS employees
   ON COALESCE(warehouse_history.employee_id, warehouse_history.user_id) = employees.employee_id

  WHERE inventory_units.serial_number IS NOT NULL
    AND (warehouse_history.previous_ether_wms_warehouse_id IS NOT NULL
         OR warehouse_history.ether_wms_warehouse_id IS NOT NULL)

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
-- serials have warehouse change
  SELECT
      serial_number
    , warehouse_change_source
    , row_number() OVER (PARTITION BY serial_number ORDER BY logged_at, log_entry_id) AS serial_warehouse_row
    , logged_at
    , log_entry_id
    , log_entry_type
    , previous_warehouse
    , warehouse
    , creation_user_name
  FROM log_union
  UNION ALL
-- serials never have warehouse change
  SELECT
      inventory_units.serial_number
    , cast('Ether inventory unit' AS string) AS warehouse_change_source
    , cast(1 AS int64) AS serial_warehouse_row
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS string) AS previous_warehouse
    , inventory_units.warehouse_code AS warehouse
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
    , cast('Inferred from earliest log entry' AS string) AS warehouse_change_source
    , cast(0 AS int64) AS serial_warehouse_row
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS string) AS previous_warehouse
    , previous_warehouse AS warehouse
    , cast(NULL AS string) AS creation_user_name
  FROM logged_and_unlogged
  WHERE serial_warehouse_row = 1
    AND previous_warehouse IS NOT NULL

), warehouse_history_scd AS (

-- SCD modeling par
  SELECT
      full_history.*
    , CASE
        WHEN lag(full_history.serial_number) OVER (PARTITION BY full_history.serial_number ORDER BY full_history.serial_warehouse_row) IS NULL
        THEN cast('1970-01-01 00:00:00' AS timestamp)
        ELSE full_history.logged_at
      END AS valid_from
    , coalesce(
          
  

timestamp_add(cast( lead(full_history.logged_at) OVER (PARTITION BY full_history.serial_number ORDER BY full_history.serial_warehouse_row) as timestamp),
        interval -1 second)



        , cast('2038-01-19 03:14:08' AS timestamp)
      ) AS valid_to
  FROM full_history

), final AS (

  SELECT *
  , (valid_from <> cast('1970-01-01 00:00:00' AS timestamp) AND previous_warehouse IS NOT NULL) AS is_warehouse_change
  FROM warehouse_history_scd

)

SELECT * FROM final
  );
    
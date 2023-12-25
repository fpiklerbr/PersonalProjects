

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_consignment_status_history`
  
  
  OPTIONS()
  as (
    WITH logged AS (

  SELECT
      inventory_units.serial_number
    , row_number() OVER (
        PARTITION BY inventory_units.serial_number
        ORDER BY history.created_at, history.ether_wms_inventory_unit_version_id
      ) AS serial_consignment_status_row
    , cast('Ether log' AS string) AS consignment_status_change_source
    , history.created_at AS logged_at
    , history.ether_wms_inventory_unit_version_id AS log_entry_id
    , history.action_type AS log_entry_type
    , history.previous_consignment_status
    , history.consignment_status
    , employees.employee_name
    , users.full_name AS user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_consignment_status_history` AS history
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON history.ether_wms_inventory_unit_id =  inventory_units.ether_wms_inventory_unit_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS employees
    ON history.employee_id = employees.employee_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS users
    ON history.user_id = users.user_id
  WHERE inventory_units.serial_number IS NOT NULL
    AND (
      history.previous_consignment_status IS NOT NULL
      OR history.consignment_status IS NOT NULL
    )

), full_history AS (

  SELECT
    *
  FROM logged
  UNION ALL
  SELECT
      serial_number
    , cast(0 AS int64) AS serial_consignment_status_row
    , cast('Inferred from earliest log entry' AS string) AS consignment_status_change_source
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS string) AS previous_consignment_status
    , previous_consignment_status AS consignment_status
    , cast(NULL AS string) AS employee_name
    , cast(NULL AS string) AS user_name
  FROM logged
  WHERE serial_consignment_status_row = 1
    AND previous_consignment_status IS NOT NULL
  UNION ALL
  SELECT
      inventory_units.serial_number
    , cast(1 AS int64) AS serial_consignment_status_row
    , cast('Ether inventory unit' AS string) AS consignment_status_change_source
    , cast(NULL AS timestamp) AS logged_at
    , cast(NULL AS int64) AS log_entry_id
    , cast(NULL AS string) AS log_entry_type
    , cast(NULL AS string) AS previous_consignment_status
    , inventory_units.consignment_status
    , cast(NULL AS string) AS employee_name
    , cast(NULL AS string) AS user_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_units` AS inventory_units
  LEFT JOIN logged
   ON inventory_units.serial_number = logged.serial_number
  WHERE inventory_units.serial_number IS NOT NULL
   AND logged.serial_number IS NULL

), final AS (

  SELECT
      full_history.*
    , CASE
        WHEN lag(serial_number) OVER (PARTITION BY serial_number ORDER BY serial_consignment_status_row) IS NULL
        THEN cast('1970-01-01 00:00:00' AS timestamp)
        ELSE logged_at
      END AS valid_from
    , coalesce(
          
  

timestamp_add(cast( lead(logged_at) OVER (PARTITION BY serial_number ORDER BY serial_consignment_status_row) as timestamp),
        interval -1 second)



        , cast('2038-01-19 03:14:08' AS timestamp)
      ) AS valid_to
  FROM full_history

)

SELECT * FROM final
  );
    
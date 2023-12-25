WITH label_dates AS (


  SELECT
      label_number
    , SAFE_CAST(TIMESTAMP(SAFE_CAST(

        datetime_add(
            cast( 

        datetime_add(
            cast( safe_cast(datetime(safe_cast(file_time AS timestamp), 
  r'America/New_York'
) AS date) as datetime),
        interval 1 day
        )

 as datetime),
        interval -1 second
        )

 AS datetime), 
  r'America/New_York'
) AS timestamp) AS on_hand_at -- 23:59:59 local time on on_hand_date
    , safe_cast(datetime(safe_cast(file_time AS timestamp), 
  r'America/New_York'
) AS date) AS on_hand_date
    , cast('CAP' AS string) AS warehouse
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__inventory`
  WHERE label_number IS NOT NULL
    AND qty_on_hand = 1

  UNION ALL
  SELECT
      label_number
    , SAFE_CAST(TIMESTAMP(SAFE_CAST(

        datetime_add(
            cast( 

        datetime_add(
            cast( safe_cast(datetime(safe_cast(file_time AS timestamp), 
  r'America/Los_Angeles'
) AS date) as datetime),
        interval 1 day
        )

 as datetime),
        interval -1 second
        )

 AS datetime), 
  r'America/Los_Angeles'
) AS timestamp) AS on_hand_at -- 23:59:59 local time on on_hand_date
    , safe_cast(datetime(safe_cast(file_time AS timestamp), 
  r'America/Los_Angeles'
) AS date) AS on_hand_date
    , cast('LAW' AS string) AS warehouse
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__inventory`
  WHERE label_number IS NOT NULL
    AND qty_on_hand = 1

  UNION ALL
  SELECT
      label_number
    , SAFE_CAST(TIMESTAMP(SAFE_CAST(

        datetime_add(
            cast( 

        datetime_add(
            cast( safe_cast(datetime(safe_cast(file_time AS timestamp), 
  r'America/Chicago'
) AS date) as datetime),
        interval 1 day
        )

 as datetime),
        interval -1 second
        )

 AS datetime), 
  r'America/Chicago'
) AS timestamp) AS on_hand_at -- 23:59:59 local time on on_hand_date
    , safe_cast(datetime(safe_cast(file_time AS timestamp), 
  r'America/Chicago'
) AS date) AS on_hand_date
    , cast('CHW' AS string) AS warehouse
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`chw__inventory`
  WHERE label_number IS NOT NULL
    AND qty_on_hand = 1
), serial_dates AS (

  SELECT
      label_dates.*
    , coalesce(inventory_units.serial_number, label_dates.label_number) AS serial_number
  FROM label_dates
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON label_dates.label_number = inventory_units.label_number
    AND label_dates.on_hand_at >= inventory_units.label_number_valid_from
    AND label_dates.on_hand_at <= inventory_units.label_number_valid_to

), last_date_by_warehouse AS (

  SELECT
      warehouse
    , max(on_hand_date) AS last_date
  FROM serial_dates
  GROUP BY 1

)

SELECT
    serial_dates.serial_number
  , min(serial_dates.on_hand_date) AS first_date_on_hand
  , max(serial_dates.on_hand_date) AS last_date_on_hand
  , count(DISTINCT serial_dates.on_hand_date) AS total_days_on_hand
  , cast(max(
      CASE
        WHEN serial_dates.on_hand_date = last_date_by_warehouse.last_date
        THEN 1
        ELSE 0
      END
    ) AS boolean) AS currently_on_hand

  , min( 
    CASE WHEN serial_dates.warehouse = 'CAP' THEN serial_dates.on_hand_date END
   ) AS first_date_at_cap
    , max( 
    CASE WHEN serial_dates.warehouse = 'CAP' THEN serial_dates.on_hand_date END
   ) AS last_date_at_cap
    , count(DISTINCT 
    CASE WHEN serial_dates.warehouse = 'CAP' THEN serial_dates.on_hand_date END
   ) AS total_days_at_cap
    , cast(max(
        CASE
          WHEN serial_dates.warehouse = 'CAP' AND serial_dates.on_hand_date = last_date_by_warehouse.last_date
          THEN 1
          ELSE 0
        END
      ) AS boolean) AS currently_at_cap

  , min( 
    CASE WHEN serial_dates.warehouse = 'LAW' THEN serial_dates.on_hand_date END
   ) AS first_date_at_law
    , max( 
    CASE WHEN serial_dates.warehouse = 'LAW' THEN serial_dates.on_hand_date END
   ) AS last_date_at_law
    , count(DISTINCT 
    CASE WHEN serial_dates.warehouse = 'LAW' THEN serial_dates.on_hand_date END
   ) AS total_days_at_law
    , cast(max(
        CASE
          WHEN serial_dates.warehouse = 'LAW' AND serial_dates.on_hand_date = last_date_by_warehouse.last_date
          THEN 1
          ELSE 0
        END
      ) AS boolean) AS currently_at_law

  , min( 
    CASE WHEN serial_dates.warehouse = 'CHW' THEN serial_dates.on_hand_date END
   ) AS first_date_at_chw
    , max( 
    CASE WHEN serial_dates.warehouse = 'CHW' THEN serial_dates.on_hand_date END
   ) AS last_date_at_chw
    , count(DISTINCT 
    CASE WHEN serial_dates.warehouse = 'CHW' THEN serial_dates.on_hand_date END
   ) AS total_days_at_chw
    , cast(max(
        CASE
          WHEN serial_dates.warehouse = 'CHW' AND serial_dates.on_hand_date = last_date_by_warehouse.last_date
          THEN 1
          ELSE 0
        END
      ) AS boolean) AS currently_at_chw
, current_timestamp AS rebuild_timestamp
FROM serial_dates
INNER JOIN last_date_by_warehouse
  ON serial_dates.warehouse = last_date_by_warehouse.warehouse
GROUP BY 1
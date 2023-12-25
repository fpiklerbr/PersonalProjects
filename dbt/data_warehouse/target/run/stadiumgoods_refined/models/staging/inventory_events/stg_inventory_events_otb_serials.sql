

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_otb_serials`
  OPTIONS()
  as WITH price_history AS (

--Serial Price History
  SELECT
    serial_number
  , log_entry_id AS serial_log_id
  , log_entry_type AS log_type
  , previous_price
  , price
  , CAST(valid_from AS DATE) AS start_date
  , CAST(valid_to AS DATE) AS end_date
  , serial_price_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history`
  WHERE ( CAST(valid_from AS DATE) != CAST(valid_to AS DATE)
  OR valid_to IS NULL )

), serials AS (

  SELECT
    serial_number
  , price
  , serial_cost
  , simple_sku
  , business_entity
  , commission_rate
  , original_price
  , warehouse
  , first_available_date
  , last_available_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  -- where serial_number in ('22114069182', '22114076904','22114047262')

), dated_events AS (

  SELECT
    inventory_events.*
  , CAST(calendar_dates.date_id AS DATE) AS inventory_date
  FROM (
    SELECT
      *
    , COALESCE(
        lead(transaction_date) OVER (PARTITION BY serial_number ORDER BY transaction_date, qty_commercial DESC)
        , current_date('America/New_York')
      ) AS next_transaction_date
    , sum(qty_commercial) OVER (PARTITION BY serial_number ROWS UNBOUNDED PRECEDING) AS availability
    FROM (SELECT DISTINCT serial_number FROM serials) AS distinct_serials
    INNER JOIN (
    SELECT DISTINCT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`inventory_events`
    ) AS inventory_events
    USING (serial_number)
    ORDER BY serial_number, transaction_date
  ) AS inventory_events
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_calendar_dates` AS calendar_dates
  ON inventory_events.transaction_date <= calendar_dates.date_id
  AND inventory_events.next_transaction_date >= calendar_dates.date_id

), dated_events_price_cost AS (

  SELECT
    dated_events.*
  , serials.simple_sku
  , serials.business_entity
  , COALESCE(price_history.price, serials.price) AS price
  , COALESCE(serials.serial_cost, price_history.price * serials.commission_rate) as cost
  , nullif(
     greatest(
      coalesce(

    datetime_diff(
        cast(nullif(
     least(
      coalesce(serials.last_available_date, CAST('9999-12-31' AS date))
      ,coalesce(dated_events.inventory_date, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) as datetime),
        cast(serials.first_available_date as datetime),
        day
    )

+ 1, CAST('-9223372036854775808' AS int64))
      ,coalesce(0, CAST('-9223372036854775808' AS int64))
      
      )
     , CAST('-9223372036854775808' AS int64)
  ) AS inventory_age
  , serials.original_price
  , COALESCE(moves.warehouse
          , serials.warehouse
          , CASE WHEN dated_events.serial_inventory = 'Dropship' THEN 'DSS' END
      ) AS warehouse
  -- fix the bug that moves mdl dont have dss info, and stadium_serials having serials not in moves
  FROM (SELECT DISTINCT * FROM dated_events) AS dated_events --dedup
  LEFT JOIN price_history
    ON dated_events.serial_number = price_history.serial_number
    AND dated_events.inventory_date >= price_history.start_date
    AND dated_events.inventory_date < price_history.end_date
    OR dated_events.serial_number = price_history.serial_number
    AND dated_events.inventory_date >= price_history.start_date
    AND price_history.end_date IS NULL
  LEFT JOIN serials
    ON dated_events.serial_number = serials.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_warehouse_history` AS moves
    ON moves.serial_number = dated_events.serial_number
    AND 
  

timestamp_add(cast( 

        datetime_add(
            cast( dated_events.inventory_date as datetime),
        interval 1 day
        )

 as timestamp),
        interval -1 second)


 >= moves.valid_from
    AND 
  

timestamp_add(cast( 

        datetime_add(
            cast( dated_events.inventory_date as datetime),
        interval 1 day
        )

 as timestamp),
        interval -1 second)


 <= moves.valid_to

), final AS (

  SELECT
    serial_number
  , inventory_date
  , simple_sku
  , business_entity
  , serial_relationship
  , serial_inventory
  , transaction_date
  , next_transaction_date
  , availability
  , event_class
  , event_type
  , price
  , cost
  , inventory_age
  , CASE WHEN inventory_age IS NOT NULL
     THEN concat( DIV(inventory_age, 30) * 30, ' ~ ', (DIV(inventory_age, 30)+1) * 30 -1, ' days' )
    ELSE CAST('NULL' AS string)
    END AS inventory_age_bucket
  , original_price
  , warehouse
  , event_class_reference_name
  , event_class_reference
  , event_type_reference_name
  , event_type_reference
  , qty_finance
  , qty_ops
  , qty_commercial
--  , snapshot_date
--  , snapshot_row
  FROM dated_events_price_cost
  WHERE inventory_date > DATE_SUB(CURRENT_DATE('America/New_York'), INTERVAL 2 YEAR)

)

SELECT * FROM final;


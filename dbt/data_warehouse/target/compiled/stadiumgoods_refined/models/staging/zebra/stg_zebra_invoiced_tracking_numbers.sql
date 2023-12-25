WITH final AS (

  SELECT
      tracking_number
    , ship_reference
    , customer_reference_number
    , transit_order_number
    , cast('SG&A' AS string ) AS operations_category
    , SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(shipped_at AS timestamp), 'America/New_York') AS datetime) AS date) AS ship_date
    , file_name AS invoice_id
    , SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , coalesce(ship_cost, 0) + coalesce(tax, 0) AS total_cost
    , ship_cost
    , tax AS ship_tax
    , cast('Zebra' AS string ) AS invoice_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`zebra__dashboard_parcel_list`

)

SELECT * FROM final
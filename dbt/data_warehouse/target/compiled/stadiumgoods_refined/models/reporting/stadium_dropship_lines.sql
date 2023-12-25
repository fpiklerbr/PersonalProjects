WITH dropship AS (

  SELECT
    stadium_order_id AS mag_order_id
  , item_number AS dsco_item_id
  , serial_source AS dropship_source
  , CAST(safe_cast(datetime(safe_cast(line_fulfilled_at AS timestamp), 'America/New_York') AS datetime) AS date) AS ship_date
  , safe_cast(datetime(safe_cast(line_fulfilled_at AS timestamp), 'America/New_York') AS datetime) AS shipping_timestamp_nyc
  , line_fulfilled_at IS NOT NULL OR order_item_state = 'fulfilled' AS is_fulfilled
  , serial_cost
  , serial_relationship
  , serial_inventory
  , seller_id
  , tracking_number
  , CAST(NULL AS datetime) AS ship_by_date
  , CAST(NULL AS string) AS dsco_order_id
  , CAST(NULL AS string) AS dsco_order_status
  , order_paid_out
  , third_party_name AS dropshipper_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dss_order_lines`
  UNION ALL
  SELECT
    po_number AS mag_order_id
  , dsco_item_id
  , serial_source AS dropship_source
  , CAST(COALESCE(
  package_ship_timestamp_nyc
 , CASE WHEN dsco_order_status = 'shipped' THEN shipment_file_timestamp_nyc END) AS date) AS ship_date
  , COALESCE(
  package_ship_timestamp_nyc
 , CASE WHEN dsco_order_status = 'shipped' THEN shipment_file_timestamp_nyc END) AS shipping_timestamp_nyc
  , (package_ship_timestamp_nyc IS NOT NULL OR dsco_order_status = 'shipped') AS is_fulfilled
  , CAST(NULL AS float64) AS serial_cost
  , CAST(NULL AS string) AS serial_relationship
  , CAST(NULL AS string) AS serial_inventory
  , CAST(NULL AS string) AS seller_id
  , package_tracking_number AS tracking_number
  , 

        datetime_add(
            cast( 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(ship_by_date AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval 12 hour
        )

 as datetime),
        interval -1 minute
        )

 AS ship_by_date
  , dsco_order_id
  , dsco_order_status
  , CAST(NULL AS int64) AS order_paid_out
  , dsco_supplier_name AS dropshipper_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dsco_order_lines` AS dsco
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_dropshippers` AS lookup_dsco_supplier ON CAST(lookup_dsco_supplier.dropshipper_id AS string) = dsco.dsco_supplier_id

), final AS (

  SELECT *
  , row_number() OVER (PARTITION BY mag_order_id, dropship_source, dsco_item_id ORDER BY shipping_timestamp_nyc) AS dropship_order_source_item_line
  , CASE WHEN EXISTS (
        SELECT *
        FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`link__tmall_order_id_to_zebra_ship_reference`
        WHERE zebra_ship_reference = tracking_number
      ) THEN tracking_number END AS crossdock_reference
  , current_timestamp rebuild_timestamp
  FROM dropship

)
SELECT * FROM final
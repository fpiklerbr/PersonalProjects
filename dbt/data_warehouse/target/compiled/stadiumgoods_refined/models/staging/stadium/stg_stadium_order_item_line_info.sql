

/* TODO don't hard-code flow channels here

also: item_line_info has more cols than reporting SQL because of they are needed when creating in-transition tbls
need exclude : ['dropship_source','dropship_order_source_item_line'
                 ,'mag_dsco_ship_late_date','x3_issued_serial','mag_dsco_order_id'
                  ,'zebra_ship_reference','tmall_b2c_ship_reference']
*/



WITH cte_3pl_pick_items AS (

  SELECT * EXCEPT(ord_number)
  FROM (
    SELECT *
    , ROW_NUMBER() OVER (PARTITION BY pick_id, serial_number ORDER BY (created_at)) AS ord_number
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_3pl_pick_items`)
  WHERE ord_number = 1

), final AS (

  SELECT
    item_lines.*

/* cap attributes */
  , item_lines.x3_pick_creation_nyc AS pick_creation_nyc
  , coalesce(
        safe_cast(datetime(safe_cast(_3pl_pick_items.created_at AS timestamp), 
  r'America/New_York'
) AS datetime)
      , cap_pick.first_cap_pick_creation_nyc
    ) AS _3pl_pick_creation_nyc
  , _3pl_pick_items.pick_item_status AS _3pl_pick_item_status
  , _3pl_pick_items.file_time AS _3pl_pick_item_file_time
  , safe_cast(datetime(safe_cast(cap_shipping.shipped_at AS timestamp), 
  r'America/New_York'
) AS datetime) AS cap_shipping_file_nyc
  , cap_shipping.ship_date AS cap_ship_date
  , coalesce(cap_shipping.ship_method, item_lines.delivery_shipping_description) AS ship_method
  , cap_shipping.ship_method AS cap_ship_method
  , cap_shipping.tracking_number AS cap_tracking_number
  , cap_shipping.serial_number AS cap_serial
  , cap_shipping.client_code AS _3pl_client_code
  , coalesce(cap_shipping.carrier_code, _3pl_pick_items.carrier_code) AS _3pl_carrier_code

/* dropship attributes */
  , coalesce(dropship_lines.dsco_order_id, CAST(item_lines.mag_dsco_order_id AS string)) AS dsco_order_id
  , dropship_lines.dsco_order_status
  , coalesce(dropship_lines.ship_by_date, item_lines.mag_dsco_ship_late_date) AS dsco_ship_late_date
  , dropship_lines.ship_date AS dsco_ship_date
  , dropship_lines.tracking_number AS dsco_tracking_number
  , dropship_lines.serial_cost AS dropship_inventory_cost
  , dropship_lines.dropship_source AS dropship_inventory_source
  , dropship_lines.serial_relationship AS dropship_inventory_relationship
  , dropship_lines.serial_inventory AS dropship_inventory_type
  , dropship_lines.seller_id AS dropship_inventory_seller
  , dropship_lines.order_paid_out AS dropship_order_paid_out
  , dropship_lines.dropshipper_name

/* cap, dropship attributes */
  , coalesce(
        cap_shipping.ship_date
      , dropship_lines.ship_date
      , item_lines.x3_ship_date
      , cast(item_lines.mag_shipment_creation_nyc AS date)
    ) AS ship_date
  , coalesce(
        safe_cast(datetime(safe_cast(cap_shipping.shipped_at AS timestamp), 'America/New_York') AS datetime)
      , dropship_lines.shipping_timestamp_nyc
      , cast(item_lines.x3_ship_date AS datetime )
      , item_lines.mag_shipment_creation_nyc
    ) AS shipping_timestamp_nyc
  , coalesce(item_lines.x3_tracking_number, cap_shipping.tracking_number, dropship_lines.tracking_number, item_lines.mag_tracking_number) AS tracking_number
  , coalesce(
  	item_lines.x3_issued_serial
  	, cap_shipping.serial_number
  	, item_lines.x3_returned_serial
  	, CASE WHEN (item_lines.allocation_type = 'Shipment' AND coalesce(cap_shipping.ship_date, item_lines.x3_ship_date) IS NOT NULL) OR item_lines.allocation_type = 'Sales invoice' THEN item_lines.allocated_serial END
  	, CASE WHEN dropship_lines.is_fulfilled THEN coalesce(item_lines.mag_order_serial, item_lines.x3_order_serial) END
    ) AS issued_serial
  , 
  coalesce(
      item_lines.x3_issued_serial
    , cap_shipping.serial_number
    , item_lines.x3_returned_serial
    , CASE WHEN (item_lines.allocation_type = 'Shipment' AND coalesce(cap_shipping.ship_date, item_lines.x3_ship_date) IS NOT NULL) OR item_lines.allocation_type = 'Sales invoice' THEN item_lines.allocated_serial END
    , CASE WHEN dropship_lines.is_fulfilled THEN coalesce(item_lines.mag_order_serial, item_lines.x3_order_serial) END
    , item_lines.allocated_serial
    , item_lines.x3_order_serial
    , item_lines.mag_order_serial
  )
 AS serial_number
  , coalesce(
        zebra_shipping.zebra_tracking_number
      , item_lines.tmall_b2c_ship_reference
      , CASE WHEN coalesce(item_lines.mag_order_channel, item_lines.x3_order_channel) IN ('flow_china', 'flow', 'FLOWCUST', 'FLCHCUST') THEN item_lines.external_order_id END
      , dropship_lines.crossdock_reference
      , item_lines.zebra_ship_reference
    ) AS crossdock_reference /* TODO don't hard-code flow channels here */
  , coalesce(
        cap_shipping.tracking_number
      , dropship_lines.tracking_number
      , item_lines.x3_tracking_number
    ) AS tracking_number_from_fulfillment

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info_items` AS item_lines
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_dropship_lines` AS dropship_lines
  ON dropship_lines.mag_order_id = item_lines.mag_order_id
  AND dropship_lines.dropship_source = item_lines.dropship_source
  AND dropship_lines.dsco_item_id = item_lines.dsco_item_id
  AND dropship_lines.dropship_order_source_item_line = item_lines.dropship_order_source_item_line
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_3pl_shipped_serials` AS cap_shipping
  ON item_lines.fulfillment_number = cap_shipping.fulfillment_number
  AND item_lines.allocation_line_number = cap_shipping.allocation_line_number
  AND cap_shipping.reporting_priority = 1
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_zebra_shipped_serials` AS zebra_shipping
  ON zebra_shipping.serial_number = coalesce(item_lines.x3_issued_serial, item_lines.x3_returned_serial, item_lines.allocated_serial, item_lines.x3_order_serial)
  AND zebra_shipping.zebra_ship_reference = item_lines.zebra_ship_reference
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_order_to_pick` AS cap_pick
  ON cap_pick.x3_order_id = item_lines.x3_order_id
  AND cap_pick.x3_order_line = item_lines.x3_order_line
  LEFT JOIN cte_3pl_pick_items AS _3pl_pick_items
  ON item_lines.pick_id = _3pl_pick_items.pick_id
  AND 
  coalesce(
      item_lines.x3_issued_serial
    , cap_shipping.serial_number
    , item_lines.x3_returned_serial
    , CASE WHEN (item_lines.allocation_type = 'Shipment' AND coalesce(cap_shipping.ship_date, item_lines.x3_ship_date) IS NOT NULL) OR item_lines.allocation_type = 'Sales invoice' THEN item_lines.allocated_serial END
    , CASE WHEN dropship_lines.is_fulfilled THEN coalesce(item_lines.mag_order_serial, item_lines.x3_order_serial) END
    , item_lines.allocated_serial
    , item_lines.x3_order_serial
    , item_lines.mag_order_serial
  )
 = _3pl_pick_items.serial_number

)

SELECT * FROM final
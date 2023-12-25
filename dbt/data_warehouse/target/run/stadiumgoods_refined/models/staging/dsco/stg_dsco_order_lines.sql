

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dsco_order_lines`
  OPTIONS()
  as WITH dsco_order AS (

  SELECT *
    , row_number() OVER (
    PARTITION BY dsco_order_id, dsco_item_id
    ORDER BY file_timestamp DESC
  ) AS order_item_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dsco__order`

), dsco_order_cancel AS (

  SELECT *
    , row_number() OVER (
    PARTITION BY dsco_order_id, dsco_item_id
    ORDER BY file_timestamp DESC
  ) AS order_item_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dsco__order_cancel`

), dsco_shipment AS (

  SELECT *
    , row_number() OVER (
    PARTITION BY dsco_order_id, dsco_item_id
    ORDER BY file_timestamp DESC
  ) AS order_item_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dsco__shipment`

), orders AS (

  SELECT *
  FROM dsco_order
  WHERE order_item_row = 1

), cancels AS (

  SELECT *
  FROM dsco_order_cancel
  WHERE order_item_row = 1

), shipments AS (

  SELECT *
  FROM dsco_shipment
  WHERE order_item_row = 1

), final AS (

  SELECT
      coalesce(shipments.po_number, cancels.po_number, orders.po_number) AS po_number
    , coalesce(shipments.number_of_line_items, cancels.number_of_line_items, orders.number_of_line_items) AS number_of_line_items
    , coalesce(shipments.line_item_sku, cancels.line_item_sku, orders.line_item_sku) AS line_item_sku
    , coalesce(shipments.dsco_order_id, cancels.dsco_order_id, orders.dsco_order_id) AS dsco_order_id
    , coalesce(shipments.dsco_order_status, cancels.dsco_order_status, orders.dsco_order_status) AS dsco_order_status
    , coalesce(shipments.dsco_item_id, cancels.dsco_item_id, orders.dsco_item_id) AS dsco_item_id
    , coalesce(shipments.dsco_supplier_id, cancels.dsco_supplier_id, orders.dsco_supplier_id) AS dsco_supplier_id
    , coalesce(shipments.dsco_supplier_name, cancels.dsco_supplier_name, orders.dsco_supplier_name) AS dsco_supplier_name
    , coalesce(shipments.dsco_retailer_id, cancels.dsco_retailer_id, orders.dsco_retailer_id) AS dsco_retailer_id
    , coalesce(shipments.dsco_trading_partner_id, cancels.dsco_trading_partner_id, orders.dsco_trading_partner_id) AS dsco_trading_partner_id
    , coalesce(shipments.dsco_trading_partner_name, cancels.dsco_trading_partner_name, orders.dsco_trading_partner_name) AS dsco_trading_partner_name
    , nullif(
     least(
      coalesce(DATETIME(SAFE_CAST(shipments.dsco_create_date AS timestamp), 'America/New_York'), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(DATETIME(SAFE_CAST(cancels.dsco_create_date AS timestamp), 'America/New_York'), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(DATETIME(SAFE_CAST(orders.dsco_create_date AS timestamp), 'America/New_York'), CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS dsco_create_timestamp_nyc
    , nullif(
     greatest(
      coalesce(DATETIME(SAFE_CAST(shipments.dsco_last_update_date AS timestamp), 'America/New_York'), CAST('0001-01-01 00:00:00' AS datetime))
      ,coalesce(DATETIME(SAFE_CAST(cancels.dsco_last_update_date AS timestamp), 'America/New_York'), CAST('0001-01-01 00:00:00' AS datetime))
      ,coalesce(DATETIME(SAFE_CAST(orders.dsco_last_update_date AS timestamp), 'America/New_York'), CAST('0001-01-01 00:00:00' AS datetime))
      
      )
     , CAST('0001-01-01 00:00:00' AS datetime)
  ) AS dsco_last_update_timestamp_nyc
    , coalesce(shipments.line_item_quantity, orders.line_item_quantity) AS line_item_quantity
    , coalesce(shipments.retailer_ship_carrier, orders.retailer_ship_carrier) AS retailer_ship_carrier
    , coalesce(shipments.retailer_ship_method, orders.retailer_ship_method) AS retailer_ship_method
    , coalesce(cancels.line_item_upc, orders.line_item_upc) AS line_item_upc
    , orders.line_item_title
    , orders.line_item_size
    , CAST(orders.line_item_expected_cost AS numeric) AS line_item_expected_cost
    , orders.line_item_retail_price
    , orders.ship_first_name
    , orders.ship_last_name
    , orders.ship_company
    , orders.ship_address_1
    , orders.ship_address_2
    , orders.ship_city
    , orders.ship_region
    , orders.ship_postal
    , orders.ship_country
    , orders.ship_phone
    , orders.ship_email
    , orders.ship_store_number
    , orders.ship_carrier
    , orders.ship_method
    , SAFE_CAST(orders.ship_by_date AS timestamp) AS ship_by_date
    , orders.retailer_create_date
    , orders.bill_to_first_name
    , orders.bill_to_last_name
    , orders.bill_to_company
    , orders.bill_to_address_1
    , orders.bill_to_address_2
    , orders.bill_to_city
    , orders.bill_to_region
    , orders.bill_to_postal
    , orders.bill_to_country
    , orders.bill_to_phone
    , orders.bill_to_email
    , shipments.package_tracking_number
    , shipments.package_ship_carrier
    , shipments.package_ship_method
    , shipments.shipping_service_level_code
    , DATETIME(SAFE_CAST(shipments.package_ship_date AS timestamp), 'America/New_York') AS package_ship_timestamp_nyc
    , shipments.line_item_line_number
    , shipments.line_item_original_quantity
    , shipments.dsco_package_id
    , shipments.dsco_retailer_name
    , shipments.dsco_requested_ship_carrier
    , shipments.dsco_requested_ship_method
    , shipments.dsco_requested_shipping_service_level_code
    , cancels.order_cancel_reason
    , cancels.line_item_status_quantity
    , cancels.line_item_original_order_quantity
    , cancels.line_item_cancel_reason
, DATETIME(SAFE_CAST(orders.file_timestamp AS timestamp), 'America/New_York') AS order_file_timestamp_nyc
, DATETIME(SAFE_CAST(shipments.file_timestamp AS timestamp), 'America/New_York') AS shipment_file_timestamp_nyc
, DATETIME(SAFE_CAST(cancels.file_timestamp AS timestamp), 'America/New_York') AS cancel_file_timestamp_nyc
    , current_timestamp AS rebuild_timestamp
  FROM orders
  FULL JOIN shipments
    ON orders.dsco_order_id = shipments.dsco_order_id
    AND orders.dsco_item_id = shipments.dsco_item_id
  FULL JOIN cancels
    ON coalesce(orders.dsco_order_id, shipments.dsco_order_id) = cancels.dsco_order_id
    AND coalesce(orders.dsco_item_id, shipments.dsco_item_id) = cancels.dsco_item_id

)

SELECT * FROM final;


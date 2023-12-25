WITH mpp_serials AS (

  SELECT DISTINCT
	  serial_relationship
	, serial_number
	, serial_inventory
    , consignment_status
    , document_id
    , x3_order_id
    , document_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS stadium_serials
  WHERE warehouse = 'MPP'

), mpp_transfers AS (

  SELECT
      mpp_serials.*
    , safe_cast(datetime(safe_cast(transfer_items.closed_at AS timestamp), 
  r'America/New_York'
) AS date) AS transaction_date
	, cast('receipt_number' AS string) AS event_class_reference_name
	, transfer_items.receipt_number AS event_class_reference
	, cast('transfer_number' AS string) AS event_type_reference_name
	, transfer_items.transfer_number AS event_type_reference
    , row_number() OVER (
        PARTITION BY mpp_serials.serial_number
        ORDER BY transfer_items.closed_at DESC
      ) AS serial_transfer_rank
  FROM mpp_serials
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transfer_items` AS transfer_items
    ON mpp_serials.serial_number = transfer_items.serial_number
  WHERE transfer_items.receiving_warehouse = 'MPP'
    AND transfer_items.transfer_item_status = 'Received'
    AND transfer_items.closed_at IS NOT NULL

), mpp_log AS (

  SELECT
      mpp_serials.*
    , safe_cast(datetime(safe_cast(warehouse_history.logged_at AS timestamp), 
  r'America/New_York'
) AS date) AS transaction_date
	, cast('log_entry_id' AS string) AS event_class_reference_name
	, cast(warehouse_history.log_entry_id AS string) AS event_class_reference
	, cast('warehouse_change_source' AS string) AS event_type_reference_name
	, warehouse_history.warehouse_change_source AS event_type_reference
    , row_number() OVER (
        PARTITION BY mpp_serials.serial_number
        ORDER BY warehouse_history.logged_at DESC
      ) AS serial_log_rank
  FROM mpp_serials
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_warehouse_history` AS warehouse_history
    ON mpp_serials.serial_number = warehouse_history.serial_number
  LEFT JOIN mpp_transfers
    ON mpp_serials.serial_number = mpp_transfers.serial_number
    AND mpp_transfers.serial_transfer_rank = 1
  WHERE warehouse_history.warehouse = 'MPP'
    AND warehouse_history.logged_at IS NOT NULL
    AND mpp_transfers.serial_number IS NULL

), mpp_in_inventory AS (

  SELECT *
  FROM mpp_transfers
  WHERE serial_transfer_rank = 1
  UNION ALL
  SELECT *
  FROM mpp_log
  WHERE serial_log_rank = 1

), final AS (

  SELECT
      serial_relationship
    , serial_number
    , serial_inventory
    , transaction_date
	, cast('MPP' AS string) AS event_class
	, cast('MPP - In Inventory' AS string) AS event_type
    , event_class_reference_name
    , event_class_reference
    , event_type_reference_name
    , event_type_reference
	, cast(0 AS int64) AS qty_finance
	, cast(0 AS int64) AS qty_ops
	, cast(0 AS int64) AS qty_commercial
  FROM mpp_in_inventory
  UNION ALL
  SELECT
      serial_relationship
    , serial_number
    , serial_inventory
    , document_date AS transaction_date
    , cast('MPP' AS string) AS event_class
    , cast('MPP - Write Off' AS string) AS event_type
    , cast('document_id' AS string) AS event_class_reference_name
    , document_id AS event_class_reference
    , cast('x3_order_id' AS string) AS event_type_reference_name
    , x3_order_id AS event_type_reference
    , cast(-1 AS int64) AS qty_finance
    , cast(0 AS int64) AS qty_ops
    , cast(-1 AS int64) AS qty_commercial
  FROM mpp_serials
  WHERE consignment_status LIKE '%sold%'
    OR consignment_status = 'returned'

)

SELECT * FROM final
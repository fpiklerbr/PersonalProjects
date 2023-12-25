

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_transfer_lines`
  
  
  OPTIONS()
  as (
    

SELECT
    x3_transfers.x3_order_id AS transfer_number
  , x3_transfers.order_line AS transfer_item_line_number
  , CASE
      WHEN receipts.serial_number = x3_transfers.order_serial
      THEN cast('Received' AS string)
      WHEN x3_transfers.ship_date IS NOT NULL
      THEN cast('Not Received' AS string)
      ELSE cast('Not Sent' AS string)
    END AS transfer_item_status
  , SAFE_CAST(TIMESTAMP(SAFE_CAST(x3_transfers.order_creation_nyc AS datetime), 
  r'America/New_York'
) AS timestamp) AS transfer_created_at
  , x3_transfers.order_total_line_count AS transfer_total_qty
  , x3_transfers.order_total_serial_count AS transfer_total_serial_count
  , x3_transfers.ship_date
  , x3_transfers.pick_id AS picking_number
  , x3_transfers.delivery_id AS shipment_number
  , x3_transfers.delivery_status AS transfer_status
  , SAFE_CAST(TIMESTAMP(SAFE_CAST(x3_transfers.delivery_creation_nyc AS datetime), 
  r'America/New_York'
) AS timestamp) AS shipped_at
  , x3_transfers.order_warehouse AS sending_warehouse
  , x3_transfers.order_channel AS receiving_warehouse
  , x3_transfers.order_creation_user_id AS transfer_employee
  , receipts.document_id AS receipt_number
  , receipts.created_at AS closed_at
  , receipts.creation_user_id AS receiving_employee
  , coalesce(
        x3_transfers.returned_serial
      , x3_transfers.issued_serial
      , x3_transfers.allocated_serial
      , x3_transfers.order_serial
    ) AS serial_number
  , cast('X3' AS string) AS data_source
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines` AS x3_transfers
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stojou` AS receipts
    ON  x3_transfers.delivery_id = receipts.vcrnumori_0
    AND x3_transfers.delivery_line = receipts.vcrlinori_0
    AND receipts.document_type_code = 6 -- receipt
    AND receipts.vcrtypori_0 = 4 -- shipment
    AND receipts.regflg_0 = 1 -- not an adjustment
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`seller_portal__ether_wms_transfers` AS ether_transfers
    ON x3_transfers.x3_order_id = ether_transfers.transfer_number
WHERE x3_transfers.order_type = 'Transfer'
    AND ether_transfers.transfer_number IS NULL
  );
    
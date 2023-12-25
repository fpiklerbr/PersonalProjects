SELECT
    item_lines.*
  , coalesce(
        mag_items.simple_sku
      , ether_items.simple_sku
      , x3_lines.simple_sku
    ) AS simple_sku
  , coalesce(
        mag_items.item_serial_number
      , ether_items.initial_serial
      , x3_lines.order_serial
    ) AS order_serial
  , coalesce(
        mag_items.line_item_price
      , ether_items.item_price_base_amount
      , x3_lines.price
    ) AS line_item_price_raw
  , coalesce(
        mag_items.line_item_tax
      , ether_items.item_tax_base_amount
      , x3_lines.tax
    ) AS line_item_tax
  , coalesce(
        mag_items.line_item_discount
      , ether_items.item_discount_base_amount
      , x3_lines.discount
    ) AS line_item_discount_raw
  , coalesce(
        mag_items.line_item_credit
      , 0
    ) AS line_item_store_credit_applied
  , coalesce(
        mag_items.line_shipping_price
      , ether_items.order_shipping_price_base_amount / ether_items.order_total_qty
      , x3_lines.shipping
    ) AS line_shipping_price
  , coalesce(
        mag_items.line_shipping_tax
      , ether_items.order_shipping_tax_base_amount / ether_items.order_total_qty
      , 0
    ) AS line_shipping_tax
  , coalesce(
        mag_items.line_shipping_discount
      , ether_items.order_shipping_discount_base_amount / ether_items.order_total_qty
      , 0
    ) AS line_shipping_discount
  , coalesce(
        mag_items.line_shipping_credit
      , 0
    ) AS line_shipping_store_credit_applied
  , coalesce(
        mag_items.item_qty_canceled
      , 0
    ) AS qty_canceled
  , coalesce(
        mag_items.item_qty_refunded
      , 0
    ) AS qty_refunded
  , cast(coalesce(
        mag_items.item_qty_ordered
      , ether_items.qty_ordered
      , x3_lines.qty_ordered
      , 0
    ) AS float64) AS qty_ordered
  , cast(coalesce(
        ether_items.qty_delivered
      , x3_lines.qty_delivered
      , mag_items.item_qty_shipped
    ) AS float64) AS qty_shipped

/* mag_items attributes  */
  , mag_items.line_item_original_price
  , mag_items.simple_item_id
  , mag_items.simple_product_id
  , mag_items.configurable_item_id
  , mag_items.configurable_product_id
  , mag_items.item_serial_number AS mag_order_serial

/* shipment_items attributes  */
  , shipment_items.tracking_numbers AS mag_tracking_number
  , shipment_items.mag_shipment_ids
  , shipment_items.shipment_creation_nyc AS mag_shipment_creation_nyc
  , shipment_items.tracking_creation_nyc AS mag_tracking_creation_nyc

/* rma_items attributes  */
  , rma_items.mag_rma_ids
  , rma_items.first_rma_creation_nyc
  , rma_items.last_rma_update_nyc
  , rma_items.rma_statuses
  , rma_items.rma_first_date_received
  , rma_items.rma_tracking_numbers
  , rma_items.house_serial_numbers
  , rma_items.rma_last_reply_name
  , rma_items.rma_last_reply_nyc
  , rma_items.rma_package_approved_nyc
  , rma_items.rma_closed_nyc
  , rma_items.item_qty_requested AS rma_item_qty_requested

/* creditmemo_items attributes  */
  , coalesce(creditmemo_items.creditmemo_transaction_ids, ARRAY[CAST('NULL' AS string)]) AS creditmemo_transaction_ids
  , creditmemo_items.mag_creditmemo_ids
  , creditmemo_items.first_creditmemo_creation_nyc
  , creditmemo_items.last_creditmemo_update_nyc
  , creditmemo_items.creditmemo_reason
  , creditmemo_items.creditmemo_item_price
  , creditmemo_items.creditmemo_item_qty
  , creditmemo_items.creditmemo_item_discount
  , creditmemo_items.creditmemo_item_tax
  , creditmemo_items.creditmemo_shipping
  , creditmemo_items.creditmemo_shipping_tax
  , creditmemo_items.creditmemo_discount
  , creditmemo_items.creditmemo_tax
  , creditmemo_items.creditmemo_adjustment
  , creditmemo_items.creditmemo_refunded
  , creditmemo_items.creditmemo_store_credit
  , creditmemo_items.creditmemo_store_credit_refunded

/* external_items attributes  */
  , external_items.external_line_id
  , external_items.farfetch_order_status_id
  , external_items.farfetch_order_status
  , external_items.external_tracking_number
  , external_items.external_return_id
  , external_items.external_return_creation_nyc

/* Ether/X3 attributes */
  , coalesce(ether_items.fulfillment_number, x3_lines.x3_order_id) AS fulfillment_number
  , coalesce(ether_items.allocation_line_number, x3_lines.order_line) AS allocation_line_number
  , coalesce(ether_items.initial_serial, x3_lines.order_serial) AS x3_order_serial
  , coalesce(ether_items.order_item_warehouse_code, x3_lines.order_warehouse) AS x3_order_warehouse
  , coalesce(ether_items.allocated_serial, x3_lines.allocated_serial) AS allocated_serial
  , coalesce(ether_items.issued_serial, x3_lines.issued_serial) AS x3_issued_serial
  , coalesce(ether_items.zebra_ship_reference, x3_lines.zebra_ship_reference) AS zebra_ship_reference
  , coalesce(
        CASE
          WHEN ether_items.ether_wms_allocation_id IS NOT NULL
          THEN cast('Ether WMS' AS string)
        END
      , x3_lines.allocation_type
    ) AS allocation_type
  , coalesce(ether_items.picking_number, x3_lines.pick_id) AS pick_id
  , x3_lines.pick_line --not in Ether
  , nullif(
     least(
      coalesce(safe_cast(datetime(safe_cast(ether_items.pick_item_created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_lines.pick_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS x3_pick_creation_nyc
  , nullif(
     least(
      coalesce(safe_cast(datetime(safe_cast(ether_items.pick_item_updated_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_lines.pick_update_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS pick_update_nyc
  , coalesce(ether_items.lp_order_code, x3_lines.lg_order_number) AS lg_order_number
  , nullif(
     least(
      coalesce(ether_items.issue_date, CAST('9999-12-31' AS date))
      ,coalesce(x3_lines.ship_date, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS x3_ship_date
  , coalesce(ether_items.delivery_flag, x3_lines.delivery_flag) AS delivery_flag
  , coalesce(ether_items.shipment_number, x3_lines.delivery_id) AS delivery_id
  , x3_lines.delivery_line --not in Ether
  , nullif(
     least(
      coalesce(safe_cast(datetime(safe_cast(ether_items.shipment_created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_lines.delivery_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS delivery_creation_nyc
  , coalesce(
        ether_items.shipment_warehouse_code
      , x3_lines.delivery_warehouse
    ) AS delivery_warehouse
  , coalesce(
        ether_items.fulfillment_shipping_description
      , x3_lines.delivery_shipping_description
    ) AS delivery_shipping_description
  , coalesce(ether_items.tracking_number, x3_lines.tracking_number) AS x3_tracking_number

/* X3 invoices, returns, creditmemos not in Ether */
  , x3_lines.invoice_flag
  , x3_lines.last_invoice_line
  , x3_lines.return_id AS x3_return_id
  , x3_lines.return_line AS x3_return_line
  , x3_lines.return_creation_nyc AS x3_return_creation_nyc
  , x3_lines.returned_serial AS x3_returned_serial
  , x3_lines.creditmemo_id AS x3_creditmemo_id
  , x3_lines.creditmemo_line AS x3_creditmemo_line
  , x3_lines.creditmemo_creation_nyc AS x3_creditmemo_creation_nyc
  , (
        x3_lines.creditmemo_line_price
      + x3_lines.creditmemo_line_shipping
      + x3_lines.creditmemo_line_tax
      - x3_lines.creditmemo_line_discount
    ) AS x3_creditmemo_line_refunded
  , x3_lines.creditmemo_total AS x3_creditmemo_total_refunded

  , coalesce(ether_items.lp_order_code, x3_lines.tmall_b2c_ship_reference) AS tmall_b2c_ship_reference

/* Ether RMA attributes */
  , ether_items.rma_number AS ether_rma_number
  , ether_items.rma_created_at AS ether_rma_created_at
  , ether_items.rma_updated_at AS ether_rma_updated_at
  , ether_items.return_reason AS ether_return_reason
  , ether_items.return_condition AS ether_return_condition
  , ether_items.rma_item_status AS ether_rma_item_status
  , ether_items.rma_item_resolved_at AS ether_rma_item_resolved_at

FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info_orders` AS item_lines
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items` AS mag_items
  ON item_lines.order_item_id = mag_items.order_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_order_items` AS ether_items
  ON item_lines.ether_order_number = ether_items.ether_order_number
  AND item_lines.ether_order_item_line_number = ether_items.ether_order_item_line_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_order_lines` AS x3_lines
  ON item_lines.x3_order_id = x3_lines.x3_order_id
  AND item_lines.x3_order_line = x3_lines.order_line
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_rma_items` AS rma_items
  ON item_lines.order_item_id = rma_items.order_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_shipment_items` AS shipment_items
  ON item_lines.order_item_id = shipment_items.order_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_creditmemo_items` AS creditmemo_items
  ON item_lines.order_item_id = creditmemo_items.order_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_tmp_external_items` AS external_items
  ON item_lines.order_item_id = external_items.order_item_id
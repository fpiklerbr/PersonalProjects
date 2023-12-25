

  SELECT
    sol.ship_date
  , sol.mag_order_id
  , sol.business_unit AS channel_group
  , sol.sales_channel AS channel
  , sol.order_item_id
  , sol.simple_item_id
  , sol.configurable_item_id
  , sol.ship_method
  , coalesce(sol.tracking_number_from_fulfillment,orph.tracking_number) AS tracking_number
  , count(sol.issued_serial) AS qty_shipped
  , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS sol
  -- /* cannot refer the upstream models, cuz inventory_type & order_item_line are almost final calculation */
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_orphan_transactions` AS orph USING (order_item_id)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_shipment_items` AS msi ON msi.mag_order_id = sol.mag_order_id
  AND msi.order_item_id = sol.order_item_id
  AND msi.shipment_item_qty <= CAST(sol.order_item_line AS numeric)
  WHERE sol.mag_order_entity_id IS NOT NULL
  AND sol.order_item_id IS NOT NULL
  AND sol.issued_serial IS NOT NULL
  AND (sol.tracking_number_from_fulfillment IS NOT NULL OR orph.tracking_number IS NOT NULL)
  AND msi.mag_shipment_id IS NULL
  AND msi.tracking_number IS NULL
  AND sol.order_date > '2023-08-21'
  AND nullif(trim(sol.ship_method), '') IS NOT NULL
  GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9
  ORDER BY 1 DESC, 2, 5
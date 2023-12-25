

WITH intakes AS (

  SELECT
    tix_item.purchase_order_number
  , tix_item.ticket_status
  , ss.mfg_sku
  , ss.size
  , ss.original_intake_id
  , ss.original_intake_date
  , STRING_AGG(DISTINCT serial_number, ',') AS serial_numbers
  , STRING_AGG(DISTINCT serial_inventory, ',') AS serial_inventory
  , STRING_AGG(DISTINCT ss.business_entity, ',') AS business_entity
  , COUNT(DISTINCT serial_number) AS serial_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ticket_items` as tix_item
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS ss USING (serial_number)
  GROUP BY 1, 2, 3, 4, 5, 6

), consignors AS (

  SELECT
    consignor_id
  , string_agg(DISTINCT business_entity, ', ') AS business_entity
  , string_agg(DISTINCT inventory_type, ', ') AS inventory_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users`
  GROUP BY 1

), joined AS (

  SELECT DISTINCT
    po.*

/* purchase_order_lines attrs  */
  , po_lines.ether_commercial_purchase_order_line_item_id
  , po_lines.mfg_sku
  , products.simple_sku
  , po_lines.size
  , po_lines.base_currency
  , po_lines.cost_base_amount
  , po_lines.price_base_amount
  , 
  CASE WHEN po_lines.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END AS conversion_rate
  , CAST(po.sox_approved_at AS date) AS conversion_date
  , round(po_lines.cost_base_amount * 
  CASE WHEN po_lines.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END, 2) AS cost
  , round(po_lines.price_base_amount * 
  CASE WHEN po_lines.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END, 2) AS price
  , COALESCE(po_lines.expected_quantity, 0) AS expected_quantity
  , COALESCE(po_lines.received_quantity, 0) AS received_quantity
  , COALESCE(po_lines.rejected_quantity, 0) AS rejected_quantity
  , (po.item_in_po * po_lines.expected_quantity) AS total_expected_lines

/* intakes ticket info */
  , intakes.ticket_status
  , intakes.serial_numbers
  , COALESCE(consignors.business_entity, intakes.business_entity) AS business_entity
  , intakes.serial_count
  , COALESCE(intakes.serial_inventory, consignors.inventory_type) AS serial_inventory
  , intakes.original_intake_id
  , intakes.original_intake_date

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_purchase_orders` AS po
  INNER JOIN  `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_purchase_order_line_items` AS po_lines
    USING (ether_commercial_purchase_order_id)
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS price_conversion -- at most one to one
    ON  po_lines.base_currency = price_conversion.currency
    AND CAST(po.sox_approved_at AS date) = price_conversion.transaction_date
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
    ON  products.mfg_sku = po_lines.mfg_sku
    AND products.size = po_lines.size
  LEFT JOIN intakes
    ON  po.purchase_order_number = intakes.purchase_order_number
	AND po_lines.mfg_sku = intakes.mfg_sku
	AND po_lines.size = intakes.size
  LEFT JOIN consignors
    ON po.consignor_id = consignors.consignor_id

)

SELECT * FROM joined
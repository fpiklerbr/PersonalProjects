WITH itemless_shipments_by_ticket AS (

  SELECT
      ticket_id
    , string_agg(DISTINCT CAST(shipment_id AS string), ', ') AS shipment_ids
    , min(created_at) AS shipment_created_at
    , sum(shippo_amount) AS shipment_total_shippo_amount
    , sum(free_labels_count) AS shipment_total_free_labels_count
    , sum(CASE WHEN insurance_is_enabled THEN 1 ELSE 0 END) > 0 AS shipment_insurance_is_enabled
    , string_agg(DISTINCT warehouse_code, ', ') AS shipment_warehouse
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_shipments_without_ticket_items` AS shipments
  GROUP BY 1

), itemless_print_labels_by_ticket AS (

  SELECT
      ticket_id
    , string_agg(DISTINCT CAST(print_label_id AS string), ', ') AS print_label_ids
    , string_agg(DISTINCT tracking_number, ', ') AS print_label_tracking_number
    , string_agg(DISTINCT print_label_status, ', ') AS print_label_status
    , min(shipped_at) AS print_label_shipped_at
    , min(estimated_delivery_at) AS print_label_estimated_delivery_at
    , min(delivered_at) AS print_label_delivered_at
    , sum(CASE WHEN is_free THEN 1 ELSE 0 END) > 0 AS print_label_is_free
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_print_labels_without_ticket_items` AS print_labels
  GROUP BY 1

), catalog_parity_products AS (

  SELECT
      product_number
    , max(last_fps_catalog_parity_snapshot_created_at) AS last_fps_catalog_parity_snapshot_created_at
    , string_agg(DISTINCT last_mag_pdp_status, ', ') AS last_mag_pdp_status
    , string_agg(DISTINCT last_fps_pdp_status, ', ') AS last_fps_pdp_status
    , string_agg(DISTINCT last_size_scale_mapping_status, ', ') AS last_size_scale_mapping_status
    , min(first_mag_pdp_success_at) AS first_mag_pdp_success_at
    , max(last_mag_pdp_success_at) AS last_mag_pdp_success_at
    , min(first_fps_pdp_success_at) AS first_fps_pdp_success_at
    , max(last_fps_pdp_success_at) AS last_fps_pdp_success_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_catalog_parity_products`
  GROUP BY 1

), magento_configurable_products AS (

  SELECT
      product_number
    , count(*) AS magento_configurable_product_count
    , array_agg(DISTINCT configurable_product_id
        IGNORE NULLS) AS magento_configurable_product_ids
    , string_agg(DISTINCT configurable_sku, ', ') AS magento_configurable_product_skus
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_configurable_products` AS configurable_products
  GROUP BY 1

), magento_simple_products AS (

  SELECT
      product_number
    , variant_size
    , count(*) AS magento_simple_product_count
    , array_agg(DISTINCT simple_product_id
        IGNORE NULLS) AS magento_simple_product_ids
    , string_agg(DISTINCT simple_sku, ', ') AS magento_simple_product_skus
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_simple_products`
  GROUP BY 1, 2

)

SELECT
    ticket_items.`ticket_item_number`,
  ticket_items.`serial_number`,
  ticket_items.`ether_wms_intake_item_id`,
  ticket_items.`intake_status`,
  ticket_items.`item_created_at`,
  ticket_items.`item_rejected_at`,
  ticket_items.`rejection_reason`,
  ticket_items.`product_profile_id`,
  ticket_items.`product_profile_created_at`,
  ticket_items.`product_profile_status`,
  ticket_items.`product_profile_content_matches`,
  ticket_items.`base_currency`,
  ticket_items.`cost_base_amount`,
  ticket_items.`product_profile_quantity`,
  ticket_items.`product_profile_employee`,
  ticket_items.`user_id`,
  ticket_items.`consignor_id`,
  ticket_items.`inventory_relationship`,
  ticket_items.`inventory_type`,
  ticket_items.`seller_tier`,
  ticket_items.`ticket_id`,
  ticket_items.`ticket_source`,
  ticket_items.`ticket_is_return`,
  ticket_items.`purchase_order_number`,
  ticket_items.`vendor_number`,
  ticket_items.`source_bundle_number`,
  ticket_items.`purchase_reference`,
  ticket_items.`ticket_status`,
  ticket_items.`ticket_created_at`,
  ticket_items.`ticket_updated_at`,
  ticket_items.`ticket_submitted_at`,
  ticket_items.`ether_wms_intake_receipt_id`,
  ticket_items.`receipt_created_at`,
  ticket_items.`receipt_warehouse`,
  ticket_items.`receipt_delivery_method`,
  ticket_items.`receipt_employee`,
  ticket_items.`receipt_status`,
  ticket_items.`receipt_intake_date`,
  ticket_items.`intake_receipt`,
  ticket_items.`message`,
  ticket_items.`mfg_sku`,
  ticket_items.`brand`,
  ticket_items.`item_category`,
  ticket_items.`product_type`,
  ticket_items.`gender`,
  ticket_items.`product_number`,
  ticket_items.`ether_pim_product_id`,
  ticket_items.`ether_product_created_at`,
  ticket_items.`release_date`,
  ticket_items.`is_hazardous`,
  ticket_items.`sales_channels`,
  ticket_items.`images_count`,
  ticket_items.`variant_size`,
  ticket_items.`size_code`,
  ticket_items.`variant_number`,
  ticket_items.`upc`,
  ticket_items.`ether_consignment_shipment_box_id`
  , ticket_items.ticket_number AS seller_portal_ticket_number
  , coalesce(ticket_items.ticket_number, ticket_items.source_bundle_number) AS ticket_number
  , CASE ticket_items.ticket_source
      WHEN 'purchase_order' THEN cast('1P' AS string)
      WHEN 'consignor_ether' THEN cast('3P' AS string)
      WHEN 'customer_return' THEN cast('Return' AS string)
      WHEN 'source_bundle' THEN cast('SOURCE' AS string)
      WHEN 'reintake' THEN cast('Return' AS string)
      WHEN 'consignor_web' THEN cast('3P' AS string)
    END AS ticket_type
  , inventory_units.label_number
  , coalesce(magento_configurable_products.magento_configurable_product_count, 0) AS magento_configurable_product_count
  , magento_configurable_products.magento_configurable_product_ids
  , magento_configurable_products.magento_configurable_product_skus
  , coalesce(magento_simple_products.magento_simple_product_count, 0) AS magento_simple_product_count
  , magento_simple_products.magento_simple_product_ids
  , magento_simple_products.magento_simple_product_skus
  , catalog_parity_products.last_fps_catalog_parity_snapshot_created_at
  , catalog_parity_products.last_mag_pdp_status
  , catalog_parity_products.last_fps_pdp_status
  , catalog_parity_products.last_size_scale_mapping_status
  , catalog_parity_products.first_mag_pdp_success_at
  , catalog_parity_products.last_mag_pdp_success_at
  , catalog_parity_products.first_fps_pdp_success_at
  , catalog_parity_products.last_fps_pdp_success_at
  , CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN cast('item' AS string)
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN cast('ticket' AS string)
    END AS shipment_match_type
  , CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN CAST(ticket_items.shipment_id AS string)
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN itemless_shipments_by_ticket.shipment_ids
    END AS shipment_ids
  , 
    CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_total_item_count
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN count(*) OVER (PARTITION BY itemless_shipments_by_ticket.ticket_id)
    END
 AS shipment_total_item_count
  , CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_created_at
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN itemless_shipments_by_ticket.shipment_created_at
    END AS shipment_created_at
  , 
    CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_total_shippo_amount
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN itemless_shipments_by_ticket.shipment_total_shippo_amount
    END
 AS shipment_total_shippo_amount
  , 
    CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_total_shippo_amount
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN itemless_shipments_by_ticket.shipment_total_shippo_amount
    END
 / 
    CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_total_item_count
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN count(*) OVER (PARTITION BY itemless_shipments_by_ticket.ticket_id)
    END
 AS shippo_amount
  , CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_total_free_labels_count
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN itemless_shipments_by_ticket.shipment_total_free_labels_count
    END AS shipment_total_free_labels_count
  , CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_insurance_is_enabled
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN itemless_shipments_by_ticket.shipment_insurance_is_enabled
    END AS shipment_insurance_is_enabled
  , CASE
      WHEN ticket_items.shipment_id IS NOT NULL
        THEN ticket_items.shipment_warehouse
      WHEN itemless_shipments_by_ticket.ticket_id IS NOT NULL
        THEN itemless_shipments_by_ticket.shipment_warehouse
    END AS shipment_warehouse
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN cast('item' AS string)
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN cast('ticket' AS string)
    END AS print_label_match_type
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN CAST(ticket_items.print_label_id AS string)
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN itemless_print_labels_by_ticket.print_label_ids
    END AS print_label_ids
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN ticket_items.print_label_total_item_count
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN count(*) OVER (PARTITION BY itemless_print_labels_by_ticket.ticket_id)
    END AS print_label_total_item_count
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN ticket_items.print_label_tracking_number
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN itemless_print_labels_by_ticket.print_label_tracking_number
    END AS print_label_tracking_number
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN ticket_items.print_label_status
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN itemless_print_labels_by_ticket.print_label_status
    END AS print_label_status
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN ticket_items.print_label_shipped_at
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN itemless_print_labels_by_ticket.print_label_shipped_at
    END AS print_label_shipped_at
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN ticket_items.print_label_estimated_delivery_at
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN itemless_print_labels_by_ticket.print_label_estimated_delivery_at
    END AS print_label_estimated_delivery_at
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN ticket_items.print_label_delivered_at
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN itemless_print_labels_by_ticket.print_label_delivered_at
    END AS print_label_delivered_at
  , CASE
      WHEN ticket_items.print_label_id IS NOT NULL
        THEN ticket_items.print_label_is_free
      WHEN itemless_print_labels_by_ticket.ticket_id IS NOT NULL
        THEN itemless_print_labels_by_ticket.print_label_is_free
    END AS print_label_is_free
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ticket_items` AS ticket_items
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
  ON ticket_items.serial_number = inventory_units.serial_number
LEFT JOIN magento_configurable_products
  ON ticket_items.product_number = magento_configurable_products.product_number
LEFT JOIN magento_simple_products
  ON ticket_items.product_number = magento_simple_products.product_number
  AND ticket_items.variant_size = magento_simple_products.variant_size
LEFT JOIN catalog_parity_products
  ON ticket_items.product_number = catalog_parity_products.product_number
LEFT JOIN itemless_shipments_by_ticket
  ON ticket_items.ticket_id = itemless_shipments_by_ticket.ticket_id
  AND ticket_items.shipment_id IS NULL
LEFT JOIN itemless_print_labels_by_ticket
  ON ticket_items.ticket_id = itemless_print_labels_by_ticket.ticket_id
  AND ticket_items.print_label_id IS NULL


  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ticket_items`
  
  
  OPTIONS()
  as (
    WITH notes AS (

  SELECT
      ticket_id
    , string_agg(DISTINCT message,', ') AS message
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_intake_notes` AS notes
  GROUP BY 1

), all_items AS (

  SELECT
      consignment.ticket_item_number
    , consignment.product_profile_id
    , consignment.ether_consignment_ticket_item_id
    , wms.ether_wms_intake_item_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_consignment_ticket_items` AS consignment
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_intake_items` AS wms
    ON consignment.ticket_item_number = wms.ticket_item_number
  UNION DISTINCT
  SELECT
      wms_orphans.ticket_item_number
    , wms_orphans.product_profile_id
    , cast(NULL AS int64) AS ether_consignment_ticket_item_id
    , wms_orphans.ether_wms_intake_item_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_intake_items` AS wms_orphans
  WHERE NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_consignment_ticket_items`
    WHERE ticket_item_number = wms_orphans.ticket_item_number
  )

)

SELECT
    all_items.ticket_item_number
  , intake_items.serial_number
  , all_items.ether_wms_intake_item_id
  , intake_items.intake_status
  , intake_items.created_at AS item_created_at
  , intake_items.rejected_at AS item_rejected_at
  , intake_items.rejection_reason
  , all_items.product_profile_id
  , product_profiles.created_at AS product_profile_created_at
  , product_profiles.product_profile_status
  , product_profiles.content_matches AS product_profile_content_matches
  , product_profiles.base_currency
  , product_profiles.cost_base_amount
  , product_profiles.quantity AS product_profile_quantity
  , product_profile_employees.employee_name AS product_profile_employee
  , tickets.user_id
  , users.consignor_id
  , users.inventory_relationship
  , users.inventory_type
  , users.seller_tier
  , product_profiles.ticket_id
  , tickets.ticket_source
  , tickets.is_return AS ticket_is_return
  , tickets.ticket_number
  , tickets.purchase_order_number
  , purchase_orders.vendor_number
  , tickets.source_bundle_number
  , CASE
      WHEN tickets.purchase_order_number IS NOT NULL
        THEN tickets.purchase_order_number
      WHEN purchase_references.purchase_reference IS NOT NULL
        THEN purchase_references.purchase_reference
      WHEN product_profiles.cost_base_amount IS NOT NULL
        THEN tickets.ticket_number
    END AS purchase_reference
  , tickets.ticket_status
  , tickets.created_at as ticket_created_at
  , tickets.updated_at as ticket_updated_at
  , tickets.submitted_at AS ticket_submitted_at
  , intake_items.ether_wms_intake_receipt_id
  , receipts.created_at AS receipt_created_at
  , receipt_warehouses.warehouse_code AS receipt_warehouse
  , receipts.delivery_method AS receipt_delivery_method
  , receipt_employees.employee_name AS receipt_employee
  , receipts.receipt_status
  , receipts.intake_date AS receipt_intake_date
  , receipts.intake_receipt
  , notes.message
  , coalesce(ether_products.mfg_sku, products.mfg_sku) AS mfg_sku
  , coalesce(ether_products.brand, products.brand_code) AS brand
  , ether_products.item_category
  , coalesce(ether_products.product_type, products.product_type_code) AS product_type
  , coalesce(ether_products.gender, products.gender_code) AS gender
  , products.product_number
  , ether_products.ether_pim_product_id
  , ether_products.created_at AS ether_product_created_at
  , ether_products.release_date
  , ether_products.is_hazardous
  , ether_products.sales_channels
  , ether_products.images_count
  , coalesce(product_profiles.variant_size, products.variant_size) AS variant_size
  , product_variants.size_code
  , product_variants.variant_number
  , product_variants.upc
  , ticket_items.ether_consignment_shipment_box_id
  , shipment_boxes.shipment_id
  , count(*) OVER (PARTITION BY shipment_boxes.shipment_id) AS shipment_total_item_count
  , shipments.created_at AS shipment_created_at
  , shipments.shippo_amount AS shipment_total_shippo_amount
  , shipments.free_labels_count AS shipment_total_free_labels_count
  , shipments.insurance_is_enabled AS shipment_insurance_is_enabled
  , shipments.warehouse_code AS shipment_warehouse
  , shipment_boxes.print_label_id
  , count(*) OVER (PARTITION BY shipment_boxes.print_label_id) AS print_label_total_item_count
  , print_labels.tracking_number AS print_label_tracking_number
  , print_labels.print_label_status
  , print_labels.shipped_at AS print_label_shipped_at
  , print_labels.estimated_delivery_at AS print_label_estimated_delivery_at
  , print_labels.delivered_at AS print_label_delivered_at
  , print_labels.is_free AS print_label_is_free


FROM all_items
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__product_profiles` AS product_profiles
  ON all_items.product_profile_id = product_profiles.product_profile_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_consignment_ticket_items` AS ticket_items
  ON all_items.ether_consignment_ticket_item_id = ticket_items.ether_consignment_ticket_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_consignment_shipment_boxes` AS shipment_boxes
  ON ticket_items.ether_consignment_shipment_box_id = shipment_boxes.ether_consignment_shipment_box_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_shipments` AS shipments
  ON shipment_boxes.shipment_id = shipments.shipment_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__print_labels` AS print_labels
  ON shipment_boxes.print_label_id = print_labels.print_label_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_intake_items` AS intake_items
  ON all_items.ether_wms_intake_item_id = intake_items.ether_wms_intake_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS product_profile_employees
  ON product_profiles.created_by_employee_id = product_profile_employees.employee_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__products` AS products
  ON product_profiles.product_id = products.product_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_products` AS ether_products
  ON products.product_number = ether_products.product_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_product_variants` AS product_variants
  ON products.product_number = product_variants.product_number
  AND coalesce(product_profiles.variant_size, products.variant_size) = product_variants.variant_size
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__tickets` AS tickets
  ON product_profiles.ticket_id = tickets.ticket_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_purchase_orders` AS purchase_orders
  ON purchase_orders.purchase_order_number = tickets.purchase_order_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_seller_portal_purchase_reference_by_ticket_number` AS purchase_references
  ON tickets.ticket_number =  purchase_references.ticket_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_intake_receipts` AS receipts
  ON intake_items.ether_wms_intake_receipt_id =  receipts.ether_wms_intake_receipt_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS receipt_warehouses
  ON receipts.ether_wms_warehouse_id = receipt_warehouses.ether_wms_warehouse_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS receipt_employees
  ON receipts.employee_id = receipt_employees.employee_id
LEFT JOIN  notes
  ON tickets.ticket_id = notes.ticket_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS users
  ON users.user_id = tickets.user_id
  );
    
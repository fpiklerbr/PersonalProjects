

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_source_bundle_item_lines`
  
  
  OPTIONS()
  as (
    WITH item_lines AS (

  SELECT
      source_bundle_item_id
    , row_number() OVER (PARTITION BY source_bundle_item_id ORDER BY source_bundle_allocation_id) AS bundle_item_row_number
    , source_bundle_allocation_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_allocations`
  UNION ALL
  SELECT
      bundle_items.source_bundle_item_id
    , bundle_item_row_number
    , cast(NULL AS int64) AS source_bundle_allocation_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_items` AS bundle_items
  , 
  UNNEST( generate_array(1,  bundle_items.quantity, 1) )
 AS bundle_item_row_number
  WHERE NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_allocations`
    WHERE source_bundle_item_id = bundle_items.source_bundle_item_id
  )

)

SELECT
    substr(
    concat(
    
      coalesce(items.source_bundle_item_id|| '-' , '')
    
      , coalesce(item_lines.bundle_item_row_number|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(items.source_bundle_item_id|| '-' , '')
    
      , coalesce(item_lines.bundle_item_row_number|| '-' , '')
    
  )) - length('-')
      , 0
    )
) AS source_bundle_item_line
  , bundles.source_bundle_id
  , bundles.source_bundle_number
  , bundles.seller_user_id
  , sellers.email AS seller_email
  , sellers.full_name AS seller_name
  , sellers.country AS seller_country
  , sellers.city AS seller_city
  , bundles.source_bundle_status
  , bundles.created_at AS bundle_created_at
  , bundles.submitted_at AS bundle_submitted_at
  , bundles.rejected_at AS bundle_rejected_at
  , bundles.approved_at AS bundle_approved_at
  , bundles.cancelled_at AS bundle_cancelled_at
  , bundles.sold_at AS bundle_sold_at
  , bundles.buyer_user_id
  , items.source_bundle_item_id
  , items.mfg_sku
  , items.size
  , product_variants.simple_sku
  , products.mfg_sku AS product_sku
  , product_variants.variant_size
  , products.brand AS product_brand
  , products.product_name
  , products.attribute_set AS product_attribute_set
  , items.quantity AS item_quantity
  , coalesce(seller_inventory_units.base_currency, sellers.base_currency) AS bundle_item_base_currency
  , items.unit_price_base_amount
  , (items.buyer_commission_base_amount / items.quantity) AS unit_buyer_commission_base_amount
  , (items.seller_commission_base_amount / items.quantity) AS unit_seller_commission_base_amount
  , CASE WHEN items.sold_price_base_amount IS NOT NULL THEN 1 END AS unit_sold_quantity
  , (items.sold_price_base_amount / items.quantity) AS unit_price_paid_base_amount
  , CASE
      WHEN items.sold_price_base_amount IS NOT NULL
      THEN (items.buyer_commission_base_amount / items.quantity)
    END AS unit_buyer_commission_paid_base_amount
  , CASE
      WHEN items.sold_price_base_amount IS NOT NULL
      THEN (items.seller_commission_base_amount / items.quantity)
    END AS unit_seller_commission_payable_base_amount
  , allocations.source_bundle_allocation_id
  , allocations.allocation_status
  , allocations.seller_serial_number
  , seller_inventory_units.ether_wms_inventory_unit_id AS seller_serial_ether_wms_inventory_unit_id
  , coalesce(seller_inventory_units.inventory_relationship, sellers.inventory_relationship) AS inventory_relationship
  , coalesce(seller_inventory_units.inventory_type, sellers.inventory_type) AS inventory_type
  , coalesce(seller_inventory_units.consignor_id, sellers.consignor_id) AS inventory_seller
  , coalesce(allocations.allocation_fulfilled_at, fulfillment_allocations.issued_at) AS allocation_fulfilled_at 
  , allocations.buyer_serial_number
  , fulfillment_allocations.x3_order_id
  , fulfillment_allocations.x3_order_line
  , fulfillment_allocations.fulfillment_number
  , fulfillment_allocations.allocation_line_number
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundles` AS bundles
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS sellers
  ON bundles.seller_user_id = sellers.user_id
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_items` AS items
  ON bundles.source_bundle_id = items.source_bundle_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_products` AS products
  ON items.mfg_sku = products.mfg_sku
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_product_variants` AS product_variants --TODO
  ON products.product_number = product_variants.product_number
  AND items.size = product_variants.variant_size
INNER JOIN item_lines
  ON items.source_bundle_item_id = item_lines.source_bundle_item_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_allocations` AS allocations
  ON item_lines.source_bundle_allocation_id = allocations.source_bundle_allocation_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS seller_inventory_units
  ON allocations.seller_serial_number = seller_inventory_units.serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations` AS fulfillment_allocations
  ON bundles.source_bundle_number = fulfillment_allocations.source_bundle_number
  AND item_lines.source_bundle_allocation_id = fulfillment_allocations.source_bundle_allocation_id
  AND allocations.seller_serial_number = fulfillment_allocations.allocation_serial
  );
    
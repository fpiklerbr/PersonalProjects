

















WITH serial_union AS (

  SELECT
    serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_distinct_serials`
  UNION DISTINCT
  SELECT
    serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_serials`
  UNION DISTINCT
  SELECT
    serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`sp_serials`

), reserialized_rma_items AS (

  SELECT
      rma_items.item_new_serial_number AS serial_number
    , string_agg(DISTINCT order_item_line_info.issued_serial, ', ') AS original_serial
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info` AS order_item_line_info
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_rma_items` AS rma_items
    ON order_item_line_info.order_item_id = rma_items.order_item_id
  WHERE EXISTS (SELECT * FROM serial_union WHERE serial_number = rma_items.item_new_serial_number)
  GROUP BY 1

)

  SELECT
    serial_union.serial_number

/* mag attributes */
  , mag.simple_sku AS mag_simple_sku
  , mag.simple_product_ids
  , mag.serial_id AS mag_serial_id
  , mag.price AS mag_price
  , mag.mag_order_id
  , mag.status AS mag_status
  , mag.serial_creation_nyc AS mag_creation_nyc
  , mag.serial_update_nyc AS mag_update_nyc
  , mag.conditions AS mag_conditions
  , mag.warehouse AS mag_warehouse
  , mag.dropshipper_type
  , mag.dropshipper_item_id
  , mag.dropshipper_id
  , coalesce(dss_sellers.commission_rate, lookup_dsco_supplier.commission_rate, mag.dropshipper_commission_rate) AS dropshipper_commission_rate

/* x3 attributes */
  , coalesce(seller_portal.product_number, x3.x3_sku) AS x3_sku
  , coalesce(seller_portal.simple_sku, x3.simple_sku) AS x3_simple_sku
  , coalesce(seller_portal.x3_order_id, x3.x3_order_id) AS x3_order_id
  , CASE
      WHEN seller_portal.x3_order_id IS NOT NULL
        THEN seller_portal.x3_order_line
      WHEN x3.x3_order_id IS NOT NULL
        THEN x3.x3_order_line
    END AS x3_order_line
  , seller_portal.fulfillment_number
  , seller_portal.allocation_line_number
  , coalesce(seller_portal.price, x3.price) AS x3_price
  , coalesce(seller_portal.warehouse_code, x3.serial_warehouse) AS x3_warehouse
  , coalesce(seller_portal.warehouse_bin, x3.serial_location) AS x3_location
  , coalesce(seller_portal.size_code, x3.size_uom) AS x3_size_uom
  , coalesce(seller_portal.conditions, x3.conditions) AS x3_conditions
  , x3.note AS x3_note
  , coalesce(
        safe_cast(datetime(safe_cast(seller_portal.updated_at AS timestamp), 
  r'America/New_York'
) AS datetime)
      , x3.last_modified_nyc
    ) AS x3_last_modified_nyc
  , coalesce(
        CASE WHEN seller_portal.is_available THEN 2 ELSE 1 END
      , x3.available
    ) AS x3_available

  , coalesce(seller_portal.consignor_id, x3.consignor_id) AS consignor_id
  , coalesce(seller_portal.commission_rate, x3.commission_rate) AS x3_commission_rate
  , x3.purchase_id AS purchase_id
  , x3.purchase_line AS purchase_line
  , coalesce(seller_portal.purchase_reference, x3.purchase_reference) AS x3_purchase_reference
  , coalesce(seller_portal.payout_invoice_number, x3.payout_invoice_id) AS x3_payout_invoice_id
  , x3.payout_invoice_line
  , coalesce(
        CASE seller_portal.consignment_status
          WHEN 'in_stock' THEN 'In Stock'
          WHEN 'in_stock_allocated' THEN 'In Stock-Allocated'
          WHEN 'in_stock_allocated_transfer' THEN 'In Stock-Allocated'
          WHEN 'in_transit' THEN 'In Transit'
          WHEN 'quarantine' THEN 'Quarantine'
          WHEN 'requested_withdrawal' THEN 'Requested-Withdrawal'
          WHEN 'returned' THEN 'Returned'
          WHEN 'review' THEN 'Review'
          WHEN 'sold_pos' THEN 'Sold-POS'
          WHEN 'sold_web' THEN 'Sold-Web'
          WHEN 'withdrawn' THEN 'Withdrawn'
          ELSE seller_portal.consignment_status
        END
      , x3.yseristatus_consignment_status
    ) AS yseristatus_consignment_status
  , x3.yserinf_rowid
  , coalesce(seller_portal.intake_date, x3.yseristatus_intake_date) AS yseristatus_intake_date
  , 
coalesce(seller_portal.issue_date, x3.yseristatus_issue_date)
 AS yseristatus_issue_date
  , coalesce(
        CASE seller_portal.paid_out_status
          WHEN 'in_review' THEN 'Review'
          WHEN 'invoiced' THEN 'Invoiced'
          WHEN 'paid_out' THEN 'Paid Out'
          WHEN 'pending'  THEN 'Pending'
          ELSE seller_portal.paid_out_status
        END
      , x3.yseristatus_paid_out_status
    ) AS yseristatus_paid_out_status
  , nullif(
     least(
      coalesce(seller_portal.ether_payment_payout_date, CAST('9999-12-31' AS date))
      ,coalesce(x3.yseristatus_payout_date, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS yseristatus_payout_date
  , coalesce(
        safe_cast(datetime(safe_cast(seller_portal.receipt_created_at AS timestamp), 
  r'America/New_York'
) AS datetime)
      , x3.intake_creation_nyc
    ) AS original_intake_creation_nyc
  , 
coalesce(seller_portal.intake_date, x3.intake_date)
 AS original_intake_date
  , 
coalesce(seller_portal.intake_receipt, x3.intake_id)
 AS original_intake_id
  , x3.intake_line AS original_intake_line
  , coalesce(seller_portal.receipt_warehouse, x3.intake_warehouse) AS original_intake_warehouse
  , coalesce(seller_portal.ticket_number, x3.intake_seller_portal_ticket) AS original_intake_seller_portal_ticket

/* historical stock-journal data, not in Ether */ 
  , x3.last_journal_creation_nyc
  , x3.last_journal_type
  , x3.last_journal_id
  , x3.last_journal_line
  , x3.last_journal_warehouse

  , CASE
      WHEN (
        seller_portal.allocation_issue_date IS NOT NULL
        AND seller_portal.fulfillment_order_type = 'withdrawal_order'
      )
        THEN cast('Withdrawal' AS string)
      WHEN seller_portal.allocation_issue_date IS NOT NULL
        THEN cast('Issue' AS string)
      WHEN 
(
  x3.status_document IN ('Withdrawal', 'Issue')
  AND coalesce(left(x3.document_id, 3), '') <> 'SDI'
  AND coalesce(left(x3.x3_order_id, 3), '') <> 'SOT'
)

        THEN x3.status_document
      WHEN seller_portal.ether_wms_allocation_id IS NOT NULL
        THEN cast('Allocation' AS string)
      WHEN 
coalesce(seller_portal.intake_receipt, x3.intake_id)
 IS NOT NULL
        THEN cast('Receipt' AS string)
      WHEN coalesce(
coalesce(seller_portal.issue_date, x3.yseristatus_issue_date)
, 
coalesce(seller_portal.intake_date, x3.intake_date)
) IS NOT NULL
        THEN cast('Serial' AS string)
    END AS status_document
  , CASE
      WHEN seller_portal.allocation_issue_date IS NOT NULL
        THEN seller_portal.fulfillment_order_type
      WHEN 
(
  x3.status_document IN ('Withdrawal', 'Issue')
  AND coalesce(left(x3.document_id, 3), '') <> 'SDI'
  AND coalesce(left(x3.x3_order_id, 3), '') <> 'SOT'
)

        THEN x3.document_type
      WHEN seller_portal.ether_wms_allocation_id IS NOT NULL
        THEN seller_portal.fulfillment_order_type
      WHEN 
coalesce(seller_portal.intake_receipt, x3.intake_id)
 IS NOT NULL
        THEN cast('Receipt' AS string)
      WHEN 
coalesce(seller_portal.issue_date, x3.yseristatus_issue_date)
 IS NOT NULL
        THEN cast('Issue' AS string)
      WHEN 
coalesce(seller_portal.intake_date, x3.intake_date)
 IS NOT NULL
        THEN cast('Intake' AS string)
    END AS document_type
  , CASE
      WHEN seller_portal.allocation_issue_date IS NOT NULL
        THEN seller_portal.allocation_issue_date
      WHEN 
(
  x3.status_document IN ('Withdrawal', 'Issue')
  AND coalesce(left(x3.document_id, 3), '') <> 'SDI'
  AND coalesce(left(x3.x3_order_id, 3), '') <> 'SOT'
)

        THEN x3.document_date
      WHEN seller_portal.ether_wms_allocation_id IS NOT NULL
        THEN safe_cast(datetime(safe_cast(seller_portal.allocation_created_at AS timestamp), 
  r'America/New_York'
) AS date)
      WHEN 
coalesce(seller_portal.intake_receipt, x3.intake_id)
 IS NOT NULL
        THEN 
coalesce(seller_portal.intake_date, x3.intake_date)

      WHEN 
coalesce(seller_portal.issue_date, x3.yseristatus_issue_date)
 IS NOT NULL
        THEN 
coalesce(seller_portal.issue_date, x3.yseristatus_issue_date)

      WHEN 
coalesce(seller_portal.intake_date, x3.intake_date)
 IS NOT NULL
        THEN 
coalesce(seller_portal.intake_date, x3.intake_date)

    END AS document_date
  , CASE
      WHEN seller_portal.allocation_issue_date IS NOT NULL
        THEN seller_portal.fulfillment_order_number
      WHEN 
(
  x3.status_document IN ('Withdrawal', 'Issue')
  AND coalesce(left(x3.document_id, 3), '') <> 'SDI'
  AND coalesce(left(x3.x3_order_id, 3), '') <> 'SOT'
)

        THEN x3.document_id
      WHEN seller_portal.ether_wms_allocation_id IS NOT NULL
        THEN seller_portal.fulfillment_order_number
      WHEN 
coalesce(seller_portal.intake_receipt, x3.intake_id)
 IS NOT NULL
        THEN 
coalesce(seller_portal.intake_receipt, x3.intake_id)

    END AS document_id
  , CASE
      WHEN seller_portal.allocation_issue_date IS NOT NULL
        THEN seller_portal.allocation_line_number
      WHEN 
(
  x3.status_document IN ('Withdrawal', 'Issue')
  AND coalesce(left(x3.document_id, 3), '') <> 'SDI'
  AND coalesce(left(x3.x3_order_id, 3), '') <> 'SOT'
)

        THEN x3.document_line
      WHEN seller_portal.ether_wms_allocation_id IS NOT NULL
        THEN seller_portal.allocation_line_number
      WHEN seller_portal.intake_receipt = x3.intake_id
        THEN x3.intake_line
    END AS document_line

  , seller_portal.ether_wms_inventory_unit_id
  , seller_portal.label_number
  , seller_portal.label_number_valid_from
  , seller_portal.label_number_valid_to
  , coalesce(
        seller_portal.original_serial_number
      , x3.original_serial
      , reserialized_rma_items.original_serial
    ) AS original_serial
  , CASE
      WHEN seller_portal.relation_to_original_serial_number IS NOT NULL
        THEN seller_portal.relation_to_original_serial_number
      WHEN x3.original_serial IS NOT NULL
        THEN cast('Reserialization' AS string)
      WHEN reserialized_rma_items.original_serial IS NOT NULL
        THEN cast('RMA' AS string)
    END AS relation_to_original_serial
  , seller_portal.original_serial_number AS ether_original_serial
  , coalesce(
        seller_portal.original_serial_number
      , x3.original_serial
    ) AS x3_original_serial
  , reserialized_rma_items.original_serial AS rma_original_serial
  , coalesce(seller_portal.stock_status, x3.stock_status) AS x3_stock_status

/* x3 payout */
  , coalesce(seller_portal.payout_invoice_number, x3.payout_invoice_id) AS payout_invoice_id
  , nullif(
     least(
      coalesce(payouts.payout_date, CAST('9999-12-31' AS date))
      ,coalesce(seller_portal.ether_payment_payout_date, CAST('9999-12-31' AS date))
      ,coalesce(x3.yseristatus_payout_date, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS payout_date

/* historical payout invoice data, not in Ether */
  , payouts.payout_invoice_date
  , payouts.line_paid_amount as payout_invoice_paid_amount
  , payouts.net_price AS payout_invoice_payable_amount
  , payouts.payout_date AS payout_invoice_paid_date
  , payouts.payment_id AS payout_invoice_payment_id
  , payouts.payment_accounting_date AS payout_invoice_payment_accounting_date

/* product attributes */
  , products.brand
  , products.brand_subcategory
  , products.attribute_set AS product_attribute_set
  , products.colorway
  , products.size
  , products.gender
  , products.nickname
  , products.mfg_sku
  , products.name

/* order lines attributes */
  , coalesce(
        seller_portal.picking_number
      , order_lines.pick_id
    ) AS pick_id
  , seller_portal.shipment_number

/* ether / x3 / mag attributes */
  , coalesce(seller_portal.simple_sku, mag.simple_sku, x3.simple_sku) AS simple_sku
  , 
coalesce(seller_portal.base_currency, 'USD')
 AS base_currency
  , coalesce(seller_portal.business_entity, 'STADIUM GOODS USA') AS business_entity
  , seller_portal.cost_currency_conversion_date
  , coalesce(
        seller_portal.cost_currency_conversion_rate
      , CASE WHEN 
coalesce(seller_portal.base_currency, 'USD')
 = 'USD' THEN cast(1.0 AS numeric) END
    ) AS cost_currency_conversion_rate
  , coalesce(
        seller_portal.cost_base_amount
      , CASE WHEN 
coalesce(seller_portal.base_currency, 'USD')
 = 'USD' THEN 
coalesce(
    (1 - coalesce(dss_sellers.commission_rate, lookup_dsco_supplier.commission_rate, mag.dropshipper_commission_rate) ) * mag.price
  , seller_portal.cost
  , x3.serial_cost
  , (
      CAST(1 AS float64) - CAST(0.17442198506570215993 AS float64)
    ) * CAST(coalesce(seller_portal.price, x3.price, mag.price) AS float64)
)
 END
    ) AS serial_cost_base_amount
  , 
coalesce(
    (1 - coalesce(dss_sellers.commission_rate, lookup_dsco_supplier.commission_rate, mag.dropshipper_commission_rate) ) * mag.price
  , seller_portal.cost
  , x3.serial_cost
  , (
      CAST(1 AS float64) - CAST(0.17442198506570215993 AS float64)
    ) * CAST(coalesce(seller_portal.price, x3.price, mag.price) AS float64)
)
 AS serial_cost
  , seller_portal.price_currency_conversion_date
  , coalesce(
        seller_portal.price_currency_conversion_rate
      , CASE WHEN 
coalesce(seller_portal.base_currency, 'USD')
 = 'USD' THEN cast(1.0 AS numeric) END
    ) AS price_currency_conversion_rate
  , coalesce(
        seller_portal.price_base_amount
      , CASE WHEN 
coalesce(seller_portal.base_currency, 'USD')
 = 'USD' THEN 
coalesce(
    CASE WHEN mag.serial_inventory = 'Dropship' THEN mag.price END
  , seller_portal.price
  , mag.price
  , x3.price
)
 END
    ) AS price_base_amount
  , 
coalesce(
    CASE WHEN mag.serial_inventory = 'Dropship' THEN mag.price END
  , seller_portal.price
  , mag.price
  , x3.price
)
 AS price
  , coalesce(mag.serial_source, seller_portal.serial_source, x3.serial_source, cast('Magento' AS string)) AS serial_source
  , 
coalesce(
    mag.serial_relationship
  , seller_portal.inventory_relationship
  , x3.serial_relationship
  , cast('3P' AS string)
)
 AS serial_relationship
  , 
coalesce(
    mag.serial_inventory
  , seller_portal.inventory_type
  , x3.serial_inventory
  , cast('Consignment' AS string)
)
 AS serial_inventory
  , coalesce(mag.supplier_acronym, coalesce(seller_portal.consignor_id, x3.consignor_id)) AS seller_id
  , coalesce(mag.dropshipper_name, seller_portal.seller_name, x3.consignor_name) AS seller_name
  , coalesce(seller_portal.seller_country, x3.consignor_country) AS seller_country
  , seller_portal.seller_city
  , seller_portal.seller_is_exempt_from_storage_fee
  , seller_portal.seller_has_flat_rate_storage_fee
  , seller_portal.storage_fee_is_payable
  , cast(coalesce(
        CASE WHEN 
coalesce(
    mag.serial_relationship
  , seller_portal.inventory_relationship
  , x3.serial_relationship
  , cast('3P' AS string)
)
 = '1P' THEN 'House Account' END
      , CASE WHEN mag.dropshipper_type IS NOT NULL THEN 'Dropshipper' END
      , 'Consignor'
    ) AS string) AS consignor_type
  , coalesce(seller_portal.conditions, x3.conditions, mag.conditions) AS conditions
  , coalesce(seller_portal.warehouse_code, x3.serial_warehouse, mag.warehouse) AS warehouse
  , coalesce(seller_portal.warehouse_bin, x3.serial_location) AS warehouse_bin
  , coalesce(seller_portal.stock_status, x3.stock_status) AS stock_status
  , seller_portal.consignment_status
  , seller_portal.paid_out_status
  , seller_portal.issue_date
  , seller_portal.payout_invoice_number AS ether_payout_invoice_number
  , seller_portal.is_3p_payable
  , coalesce(
    seller_portal.commission_rate
  , x3.commission_rate
  , coalesce(dss_sellers.commission_rate, lookup_dsco_supplier.commission_rate, mag.dropshipper_commission_rate)) AS commission_rate
  , coalesce(
        seller_portal._3p_payout
      , CASE
          WHEN 
coalesce(
    mag.serial_relationship
  , seller_portal.inventory_relationship
  , x3.serial_relationship
  , cast('3P' AS string)
)
 = '1P'
          THEN 0
          ELSE (1 - coalesce(
    seller_portal.commission_rate
  , x3.commission_rate
  , coalesce(dss_sellers.commission_rate, lookup_dsco_supplier.commission_rate, mag.dropshipper_commission_rate)) ) * 
coalesce(
    CASE WHEN mag.serial_inventory = 'Dropship' THEN mag.price END
  , seller_portal.price
  , mag.price
  , x3.price
)

        END
    ) AS payout_amount
  , coalesce(
        seller_portal._1p_cost
      , CASE
          WHEN 
coalesce(
    mag.serial_relationship
  , seller_portal.inventory_relationship
  , x3.serial_relationship
  , cast('3P' AS string)
)
 = '3P' OR 
coalesce(
    mag.serial_inventory
  , seller_portal.inventory_type
  , x3.serial_inventory
  , cast('Consignment' AS string)
)
 = 'Returns Purchase'
          THEN 0
          ELSE coalesce(x3.purchase_price, (1 - coalesce(
    seller_portal.commission_rate
  , x3.commission_rate
  , coalesce(dss_sellers.commission_rate, lookup_dsco_supplier.commission_rate, mag.dropshipper_commission_rate)) ) * 
coalesce(
    CASE WHEN mag.serial_inventory = 'Dropship' THEN mag.price END
  , seller_portal.price
  , mag.price
  , x3.price
)
)
        END
    ) AS purchase_price
  , CASE
  	    WHEN products.brand = 'STADIUM GOODS' THEN 'Exclude (Brand)'
  	    WHEN mag.dropshipper_type IS NOT NULL AND coalesce(seller_portal.consignor_id, x3.consignor_id) IS NULL THEN 'Exclude (Seller)'
 	  --WHEN coalesce(seller_portal.warehouse_code, x3.serial_warehouse, mag.warehouse) = 'CAP' THEN 'CAP Inventory'
  	    WHEN coalesce(seller_portal.warehouse_code, x3.serial_warehouse, mag.warehouse) = 'SGD' THEN 'SGD Audit'
  	    ELSE 'Exclude (Warehouse)'
  	END AS audit_logic

/* ether / seller portal attributes */
    , coalesce(seller_portal.purchase_reference, x3.purchase_reference) AS purchase_reference
    , seller_portal.ticket_number AS seller_portal_ticket_number
    , seller_portal.purchase_reference AS seller_portal_purchase_reference
    , seller_portal.cost AS seller_portal_cost
    , seller_portal.receipt_created_at AS ether_receipt_created_at
    , seller_portal.receipt_warehouse AS ether_receipt_warehouse
    , seller_portal.receipt_employee AS ether_receipt_employee
    , seller_portal.receipt_status AS ether_receipt_status
    , seller_portal.intake_receipt AS ether_intake_receipt_number
    , seller_portal.intake_date AS ether_intake_date
    , seller_portal.price AS ether_price
    , seller_portal.warehouse_bin AS ether_warehouse_bin
    , seller_portal.stock_status AS ether_stock_status
    , seller_portal.stock_status_label AS ether_stock_status_label
  	, seller_portal.simple_sku AS ether_simple_sku
    , seller_portal.purchase_order_number
    , seller_portal.vendor_number
    , seller_portal.payment_request_ids -- requests_ids
    , seller_portal.payment_request_created_at -- first_payment_request
    , seller_portal.last_payment_request_created_at -- last_payment_request
    , seller_portal.payment_request_status
    , seller_portal.payment_request_sla_deadline
    , seller_portal.payment_request_pay_method
    , seller_portal.ether_payment_third_party_identifier
    , seller_portal.ether_payment_submitted_to_provider_at
    , seller_portal.ether_payment_payout_date
    , seller_portal.user_tax_form_request_date
    , seller_portal.user_tax_form_status
    , seller_portal.user_tax_form_approval_date
    , seller_portal.withdrawal_request_ids -- withdrawal_requests_ids
    , seller_portal.first_withdrawal_request_created_at AS withdrawal_request_created_at -- first_withdrawal_request
    , SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(seller_portal.last_withdrawal_request_submitted_at AS timestamp), 'America/New_York') AS datetime) AS date) AS withdrawal_request_submission_date  -- withdraw_request_submission_date
    , seller_portal.last_withdrawal_request_warehouse AS withdrawal_request_warehouse
    , seller_portal.last_withdrawal_request_status AS withdrawal_request_status -- withdraw_ticket_status
    , seller_portal.last_withdrawal_request_note AS withdrawal_request_note -- may contain tracking_number
    , seller_portal.ticket_status as seller_portal_ticket_status
    , seller_portal.ticket_created_at as seller_portal_ticket_created_at
    , seller_portal.ticket_updated_at as seller_portal_ticket_updated_at
    , seller_portal.ticket_submitted_at as seller_portal_ticket_submitted_at
    , seller_portal.ticket_is_return as seller_portal_ticket_is_return
    , seller_portal.message as seller_portal_message
/* SOURCE bundle attributes */
    , seller_portal.source_bundle_number
  FROM serial_union
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_distinct_serials` AS x3
    ON serial_union.serial_number = x3.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_serials` AS mag
    ON serial_union.serial_number = mag.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`sp_serials` AS seller_portal
    ON serial_union.serial_number = seller_portal.serial_number
  LEFT JOIN reserialized_rma_items
    ON serial_union.serial_number = reserialized_rma_items.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dss_sellers` AS dss_sellers
    ON mag.serial_source = dss_sellers.serial_source
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_dropshippers` AS lookup_dsco_supplier
    ON mag.serial_source = lookup_dsco_supplier.serial_source
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_products` AS products
    ON coalesce(seller_portal.simple_sku, mag.simple_sku, x3.simple_sku) = products.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_consignor_payouts` AS payouts
    ON serial_union.serial_number = payouts.serial_number
    AND x3.payout_invoice_id = payouts.payout_invoice_id
    AND x3.payout_invoice_line = payouts.payout_invoice_line
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_order_lines` AS order_lines
    ON x3.x3_order_id = order_lines.x3_order_id
    AND x3.x3_order_line = order_lines.order_line
  WHERE serial_union.serial_number IS NOT NULL
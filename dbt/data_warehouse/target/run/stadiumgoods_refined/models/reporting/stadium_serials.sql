

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  
  
  OPTIONS()
  as (
    WITH cap_inventory_last AS (

  SELECT
    MAX( CASE WHEN currently_at_cap THEN last_date_at_cap END ) AS last_cap_inventory
  , MAX( CASE WHEN currently_at_law THEN last_date_at_law END ) AS last_law_inventory
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_inventory_current`

), sgd_audit_last AS (

  SELECT
    max(last_audit_date) AS last_sgd_audit
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_sgd_audit_current`
  WHERE on_current_audit

), serial_warehouses AS (

  SELECT
      serial_number
    , warehouse
    , min(valid_to) AS first_valid_to
    , max(valid_from) AS last_valid_from
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_warehouse_history`
  GROUP BY 1, 2

), final AS (

  SELECT
    serial_info.serial_number
  , serial_info.mag_simple_sku
  , serial_info.simple_product_ids
  , serial_info.mag_serial_id
  , serial_info.mag_price
  , serial_info.mag_order_id
  , serial_info.mag_status
  , serial_info.mag_creation_nyc
  , serial_info.mag_update_nyc
  , serial_info.mag_conditions
  , serial_info.mag_warehouse
  , serial_info.dropshipper_type
  , serial_info.dropshipper_item_id
  , serial_info.dropshipper_id
  , serial_info.dropshipper_commission_rate
  , serial_info.x3_sku
  , serial_info.x3_simple_sku
  , serial_info.x3_order_id
  , serial_info.x3_order_line
  , serial_info.fulfillment_number
  , serial_info.allocation_line_number
  , serial_info.x3_price
  , serial_info.x3_warehouse
  , serial_info.x3_location
  , serial_info.x3_size_uom
  , serial_info.x3_conditions
  , serial_info.x3_note
  , serial_info.x3_last_modified_nyc
  , serial_info.x3_available
  , serial_info.consignor_id
  , serial_info.x3_commission_rate
  , serial_info.purchase_id
  , serial_info.purchase_line
  , serial_info.x3_purchase_reference
  , serial_info.x3_payout_invoice_id
  , serial_info.payout_invoice_line
  , serial_info.yseristatus_consignment_status
  , serial_info.yserinf_rowid
  , serial_info.yseristatus_intake_date
  , serial_info.yseristatus_issue_date
  , serial_info.yseristatus_paid_out_status
  , serial_info.yseristatus_payout_date
  , serial_info.original_intake_creation_nyc
  , serial_info.original_intake_date
  , serial_info.original_intake_id
  , serial_info.original_intake_line
  , serial_info.original_intake_warehouse
  , serial_info.original_intake_seller_portal_ticket
  , serial_info.last_journal_creation_nyc
  , serial_info.last_journal_type
  , serial_info.last_journal_id
  , serial_info.last_journal_line
  , serial_info.last_journal_warehouse
  , serial_info.status_document
  , serial_info.document_type
  , serial_info.document_date
  , serial_info.document_id
  , serial_info.document_line
  , serial_info.ether_wms_inventory_unit_id
  , serial_info.label_number
  , serial_info.label_number_valid_from
  , serial_info.label_number_valid_to
  , serial_info.original_serial
  , serial_info.relation_to_original_serial
  , serial_info.ether_original_serial
  , serial_info.x3_original_serial
  , serial_info.rma_original_serial
  , serial_info.x3_stock_status
  , serial_info.payout_invoice_id
  , serial_info.payout_date
  , serial_info.payout_invoice_date
  , serial_info.payout_invoice_paid_amount
  , serial_info.payout_invoice_payable_amount
  , serial_info.payout_invoice_paid_date
  , serial_info.payout_invoice_payment_id
  , serial_info.payout_invoice_payment_accounting_date
  , serial_info.brand
  , serial_info.brand_subcategory
  , serial_info.product_attribute_set
  , serial_info.colorway
  , serial_info.size
  , serial_info.gender
  , serial_info.nickname
  , serial_info.mfg_sku
  , serial_info.name
  , serial_info.pick_id
  , serial_info.shipment_number
  , serial_info.simple_sku
  , serial_info.base_currency
  , serial_info.business_entity
  , serial_info.cost_currency_conversion_date
  , serial_info.cost_currency_conversion_rate
  , serial_info.serial_cost_base_amount
  , serial_info.serial_cost
  , serial_info.price_currency_conversion_date
  , serial_info.price_currency_conversion_rate
  , serial_info.price_base_amount
  , serial_info.price
  , serial_info.serial_source
  , serial_info.serial_relationship
  , serial_info.serial_inventory
  , CASE WHEN lsa.seller_id IS NOT NULL THEN lsa.seller_id ELSE serial_info.seller_id END AS seller_id
  , serial_info.seller_name
  , serial_info.seller_country
  , serial_info.seller_city
  , serial_info.seller_is_exempt_from_storage_fee
  , serial_info.seller_has_flat_rate_storage_fee
  , serial_info.storage_fee_is_payable
  , serial_info.consignor_type
  , serial_info.conditions
  , serial_info.warehouse
  , serial_info.warehouse_bin
  , serial_info.stock_status
  , serial_info.consignment_status
  , serial_info.paid_out_status
  , serial_info.issue_date
  , serial_info.ether_payout_invoice_number
  , serial_info.is_3p_payable
  , serial_info.commission_rate
  , serial_info.payout_amount
  , serial_info.purchase_price
  , serial_info.audit_logic
  , serial_info.purchase_reference
  , serial_info.seller_portal_ticket_number
  , serial_info.seller_portal_purchase_reference
  , serial_info.seller_portal_cost
  , serial_info.ether_receipt_created_at
  , serial_info.ether_receipt_warehouse
  , serial_info.ether_receipt_employee
  , serial_info.ether_receipt_status
  , serial_info.ether_intake_receipt_number
  , serial_info.ether_intake_date
  , serial_info.ether_price
  , serial_info.ether_warehouse_bin
  , serial_info.ether_stock_status
  , serial_info.ether_stock_status_label
  , serial_info.ether_simple_sku
  , serial_info.purchase_order_number
  , serial_info.vendor_number
  , serial_info.payment_request_ids
  , serial_info.payment_request_created_at
  , serial_info.last_payment_request_created_at
  , serial_info.payment_request_status
  , serial_info.payment_request_sla_deadline
  , serial_info.payment_request_pay_method
  , serial_info.ether_payment_third_party_identifier
  , serial_info.ether_payment_submitted_to_provider_at
  , serial_info.ether_payment_payout_date
  , serial_info.user_tax_form_request_date
  , serial_info.user_tax_form_status
  , serial_info.user_tax_form_approval_date
  , serial_info.withdrawal_request_ids
  , serial_info.withdrawal_request_created_at
  , serial_info.withdrawal_request_submission_date
  , serial_info.withdrawal_request_warehouse
  , serial_info.withdrawal_request_status
  , serial_info.withdrawal_request_note
  , serial_info.seller_portal_ticket_status
  , serial_info.seller_portal_ticket_created_at
  , serial_info.seller_portal_ticket_updated_at
  , serial_info.seller_portal_ticket_submitted_at
  , serial_info.seller_portal_ticket_is_return
  , serial_info.seller_portal_message
  , serial_info.source_bundle_number
  , CASE WHEN lsa.parent_company IS NOT NULL THEN lsa.parent_company ELSE coalesce(dss_seed.parent_company, serial_info.seller_name) END as parent_company
/* stadium order info */
  , serial_orders.stadium_order_id
  , serial_orders.order_creation_nyc

/* first and last available date */
  , CAST(coalesce(serial_info.original_intake_date, serial_info.mag_creation_nyc) AS date) AS first_available_date
  , CASE
  	WHEN serial_orders.order_creation_nyc IS NOT NULL THEN SAFE_CAST(SAFE_CAST(serial_orders.order_creation_nyc AS datetime) AS date)
  	WHEN serial_info.status_document IN ('Withdrawal', 'Issue') THEN serial_info.document_date
  	WHEN serial_info.audit_logic = 'SGD Audit' AND NOT coalesce(sgd_audit.on_current_audit, false) AND serial_info.original_intake_creation_nyc < sgd_audit_last.last_sgd_audit THEN sgd_audit.last_audit_date
  	WHEN serial_info.audit_logic = 'CAP Inventory' AND NOT coalesce(cap_inventory.currently_on_hand, false) AND serial_info.original_intake_creation_nyc < cap_inventory_last.last_cap_inventory THEN cap_inventory.last_date_on_hand
  	WHEN serial_info.mag_status = 'Available' AND (serial_info.serial_inventory = 'Dropship' OR serial_info.yseristatus_consignment_status = 'In Stock') THEN SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date)
  	ELSE coalesce(
        status_history.mag_last_available_date
      , CASE WHEN serial_info.mag_status = 'Dss Withdrawn' THEN SAFE_CAST(SAFE_CAST(serial_info.mag_update_nyc AS datetime) AS date) END
      , SAFE_CAST(SAFE_CAST(serial_info.last_journal_creation_nyc AS datetime) AS date)
    )
  END AS last_available_date

/* warehouse-transfer info */
  , coalesce(
        intake_warehouses.first_valid_to
      , CASE WHEN serial_info.original_intake_warehouse IS NOT NULL THEN cast('2038-01-19 03:14:08' AS timestamp) END
    ) AS original_intake_warehouse_valid_to
  , coalesce(
        current_warehouses.last_valid_from
      , CASE WHEN serial_info.warehouse IS NOT NULL THEN cast('1970-01-01 00:00:00' AS timestamp) END
    ) AS current_warehouse_valid_from

/* quarantine info */
  , quarantine_history.quarantined_at
  , quarantine_history.removed_from_quarantine_at

/* price_history info */
  , coalesce(price_history.first_price, serial_info.price) AS original_price
  , coalesce(price_history.price_changes, 0) AS price_changes

/* cap inventory info */
  , coalesce(cap_inventory.currently_on_hand, false) AS cap_currently_on_hand
  , cap_inventory.last_date_on_hand AS cap_last_date_on_hand

/* sgd_audit info */
  , coalesce(sgd_audit.on_current_audit, false) AS sgd_on_current_audit
  , sgd_audit.last_audit_date AS sgd_last_audit_date
  , CASE serial_info.audit_logic
  	WHEN 'SGD Audit' THEN
  		CASE
  			WHEN sgd_audit.on_current_audit THEN 'Available'
  			WHEN serial_info.original_intake_creation_nyc >= sgd_audit_last.last_sgd_audit THEN 'Unaudited'
  			ELSE 'Unavailable'
  		END
      /*
      	WHEN 'CAP Inventory' THEN
      		CASE
      			WHEN cap_inventory.currently_on_hand THEN 'Available'
      --			WHEN serial_info.original_intake_creation_nyc >= cap.last_cap_inventory THEN 'Unaudited'
      			ELSE 'Unavailable'
      		END
      */
  	ELSE 'Unaudited'
  	END AS audit_status

  , current_timestamp rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_tmp_info` AS serial_info
  CROSS JOIN cap_inventory_last
  CROSS JOIN sgd_audit_last
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders` AS serial_orders
    ON serial_info.serial_number = serial_orders.serial_number
  LEFT JOIN serial_warehouses AS intake_warehouses
    ON serial_info.serial_number = intake_warehouses.serial_number
    AND serial_info.original_intake_warehouse = intake_warehouses.warehouse
  LEFT JOIN serial_warehouses AS current_warehouses
    ON serial_info.serial_number = current_warehouses.serial_number
    AND serial_info.warehouse = current_warehouses.warehouse
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_history_quarantine` AS quarantine_history
    ON serial_info.serial_number = quarantine_history.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_history_price` AS price_history
    ON serial_info.serial_number = price_history.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_history_status` AS status_history
    ON serial_info.serial_number = status_history.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_sgd_audit_current` AS sgd_audit
    ON serial_info.serial_number = sgd_audit.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_inventory_current` AS cap_inventory
    ON serial_info.serial_number = cap_inventory.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_dss_parent_company` as dss_seed 
    ON dss_seed.supplier_acronym = serial_info.seller_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_supplier_acronym` as lsa 
    ON lsa.consignor_id = serial_info.consignor_id

)

SELECT * FROM final
  );
    
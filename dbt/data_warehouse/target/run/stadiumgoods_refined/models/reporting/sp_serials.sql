

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`sp_serials`
  
  
  OPTIONS()
  as (
    WITH serial_union AS (

  SELECT
    serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units_converted_currency`
  UNION DISTINCT
  SELECT
    serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ticket_items`

), reserved_allocations AS (

  SELECT DISTINCT
    allocation_serial
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations`
  WHERE allocation_status = 'reserved'

), source_bundle_seller_serials AS (

SELECT DISTINCT
      seller_serial_number
    , source_bundle_number
    , source_bundle_allocation_id
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_source_bundle_item_lines`
WHERE allocation_fulfilled_at IS NOT NULL
  AND buyer_serial_number IS NOT NULL

), all_serials AS (

  SELECT
      serial_union.serial_number
    , inventory_units.`ether_wms_inventory_unit_id`,
  inventory_units.`business_entity`,
  inventory_units.`consignment_status`,
  inventory_units.`paid_out_status`,
  inventory_units.`sold_at`,
  inventory_units.`x3_creation_date`,
  inventory_units.`is_dropshipped`,
  inventory_units.`ether_pim_product_condition_id_1`,
  inventory_units.`ether_pim_product_condition_id_2`,
  inventory_units.`ether_pim_product_condition_id_3`,
  inventory_units.`ether_pim_product_condition_id_4`,
  inventory_units.`ether_pim_product_condition_id_5`,
  inventory_units.`lock_version`,
  inventory_units.`created_at`,
  inventory_units.`updated_at`,
  inventory_units.`locked_for_x3_update_at`,
  inventory_units.`invoice_number`,
  inventory_units.`returned_at`,
  inventory_units.`original_ether_wms_inventory_unit_id`,
  inventory_units.`size`,
  inventory_units.`product_id`,
  inventory_units.`stock_status_label`,
  inventory_units.`stock_status`,
  inventory_units.`source_updated_at`,
  inventory_units.`dss_item_id`,
  inventory_units.`dss_incremental_id`,
  inventory_units.`sales_channel`,
  inventory_units.`label_number`,
  inventory_units.`_synched_from_source_at`,
  inventory_units.`_raw_in_display_case`,
  inventory_units.`_raw_label_generated_at`,
  inventory_units.`commission_rate`,
  inventory_units.`conditions`,
  inventory_units.`inventory_unit_user_id`,
  inventory_units.`ether_wms_product_variant_id`,
  inventory_units.`simple_sku`,
  inventory_units.`product_number`,
  inventory_units.`size_code`,
  inventory_units.`ether_wms_warehouse_id`,
  inventory_units.`warehouse_code`,
  inventory_units.`ether_wms_warehouse_bin_id`,
  inventory_units.`warehouse_bin`,
  inventory_units.`label_number_valid_from`,
  inventory_units.`label_number_valid_to`,
  inventory_units.`original_serial_number`,
  inventory_units.`relation_to_original_serial_number`,
  inventory_units.`inventory_relationship`,
  inventory_units.`inventory_type`,
  inventory_units.`payment_request_ids`,
  inventory_units.`payment_request_created_at`,
  inventory_units.`last_payment_request_created_at`,
  inventory_units.`payment_request_status`,
  inventory_units.`payment_request_sla_deadline`,
  inventory_units.`payment_request_pay_method`,
  inventory_units.`ether_payment_third_party_identifier`,
  inventory_units.`ether_payment_submitted_to_provider_at`,
  inventory_units.`ether_payment_payout_date`,
  inventory_units.`payout_invoice_number`,
  inventory_units.`payout_request_user_id`,
  inventory_units.`withdrawal_request_ids`,
  inventory_units.`first_withdrawal_request_created_at`,
  inventory_units.`last_withdrawal_request_id`,
  inventory_units.`last_withdrawal_request_created_at`,
  inventory_units.`last_withdrawal_request_submitted_at`,
  inventory_units.`last_withdrawal_request_deleted_at`,
  inventory_units.`last_withdrawal_request_status`,
  inventory_units.`last_withdrawal_request_warehouse`,
  inventory_units.`last_withdrawal_request_note`,
  inventory_units.`last_withdrawal_request_user_id`,
  inventory_units.`label_swap_occurred`,
  inventory_units.`destination_serial_number`,
  inventory_units.`origin_price_base_amount`,
  inventory_units.`origin_warehouse_bin`,
  inventory_units.`origin_warehouse_code`,
  inventory_units.`swapped_at`,
  inventory_units.`base_currency`,
  inventory_units.`price_base_amount`,
  inventory_units.`price_changed_at`,
  inventory_units.`price_currency_conversion_date`,
  inventory_units.`price_currency_conversion_rate`,
  inventory_units.`price`,
  inventory_units.`_3p_payout_base_amount`,
  inventory_units.`_3p_payout_changed_at`,
  inventory_units.`_3p_payout_currency_conversion_date`,
  inventory_units.`_3p_payout_currency_conversion_rate`,
  inventory_units.`_3p_payout`,
  inventory_units.`_1p_cost_base_amount`,
  inventory_units.`_1p_cost_changed_at`,
  inventory_units.`_1p_cost_currency_conversion_date`,
  inventory_units.`_1p_cost_currency_conversion_rate`,
  inventory_units.`_1p_cost`,
  inventory_units.`cost_base_amount`,
  inventory_units.`cost_changed_at`,
  inventory_units.`cost_currency_conversion_date`,
  inventory_units.`cost_currency_conversion_rate`,
  inventory_units.`cost`
    , inventory_units.intake_date AS inventory_unit_intake_date
    , ticket_items.receipt_intake_date
    , coalesce(ticket_items.receipt_intake_date, inventory_units.intake_date) AS intake_date
    , inventory_units.consignor_id AS inventory_unit_consignor_id
    , ticket_items.ticket_number
    , ticket_items.purchase_order_number
    , ticket_items.vendor_number
    , ticket_items.purchase_reference
    , ticket_items.ticket_status
    , ticket_items.ticket_created_at
    , ticket_items.ticket_updated_at
    , ticket_items.ticket_submitted_at
    , ticket_items.ticket_is_return
    , ticket_items.ether_wms_intake_item_id
    , ticket_items.intake_status
    , ticket_items.ether_wms_intake_receipt_id
    , ticket_items.message
    , ticket_items.receipt_created_at
    , ticket_items.receipt_warehouse
    , ticket_items.receipt_employee
    , ticket_items.receipt_status
    , ticket_items.intake_receipt
    , coalesce(
          inventory_units.inventory_unit_user_id
        , ticket_items.user_id
        , inventory_units.payout_request_user_id
        , inventory_units.last_withdrawal_request_user_id
      ) AS user_id
    , (
        inventory_units.consignment_status = 'in_stock'
        AND reserved_allocations.allocation_serial IS NULL
      ) IS TRUE AS is_available
    , inventory_units.issue_date AS inventory_unit_issue_date
    , allocations.issue_date AS allocation_issue_date
    , coalesce(allocations.issue_date, inventory_units.issue_date) AS issue_date
    , allocations.ether_wms_allocation_id
    , allocations.allocation_created_at
    , allocations.allocation_status
    , allocations.fulfillment_number
    , allocations.fulfillment_order_type
    , allocations.fulfillment_order_number
    , allocations.allocation_line_number
    , allocations.ether_order_number
    , allocations.ether_order_item_line_number
    , coalesce(
          allocations.source_bundle_number
        , source_bundle_seller_serials.source_bundle_number
      ) AS source_bundle_number
    , coalesce(
          allocations.source_bundle_allocation_id
        , source_bundle_seller_serials.source_bundle_allocation_id
      ) AS source_bundle_allocation_id
    , allocations.ether_withdrawal_number
    , allocations.ether_wms_withdrawal_order_item_id
    , allocations.x3_order_id
    , allocations.x3_order_line
    , allocations.ether_wms_pick_item_id
    , allocations.picking_number
    , allocations.pick_item_status
    , allocations.ether_wms_shipment_id
    , allocations.shipment_number
    , allocations.shipment_status
    , TRUE as test
  FROM serial_union
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units_converted_currency` AS inventory_units
    ON serial_union.serial_number = inventory_units.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ticket_items` AS ticket_items
    ON serial_union.serial_number = ticket_items.serial_number
  LEFT JOIN reserved_allocations
    ON serial_union.serial_number = reserved_allocations.allocation_serial
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations` AS allocations
    ON serial_union.serial_number = allocations.allocated_serial
    AND allocations.serial_allocation_priority = 1
  LEFT JOIN source_bundle_seller_serials
    ON serial_union.serial_number = source_bundle_seller_serials.seller_serial_number
    AND inventory_units.sales_channel = 'source'
  WHERE serial_union.serial_number IS NOT NULL

), final AS (

  SELECT
      all_serials.*
    , cast('Ether' AS string) AS serial_source
    , coalesce(all_serials.inventory_unit_consignor_id, users.consignor_id) AS consignor_id
    , users.is_enterprise
    , users.user_tax_form_status
    , users.user_tax_form_request_date
    , users.user_tax_form_approval_date
    , users.full_name AS seller_name
    , users.country AS seller_country
    , users.city AS seller_city
    , users.is_exempt_from_storage_fee AS seller_is_exempt_from_storage_fee
    , users.has_flat_rate_storage_fee AS seller_has_flat_rate_storage_fee
    , storage_fee_snapshots.storage_fee_is_payable
    , (
        all_serials.inventory_relationship = '3P'
        AND all_serials.inventory_type <> 'Dropship'
        AND all_serials.consignment_status <> 'withdrawn'
        AND (
          all_serials.paid_out_status <> 'pending'
          OR all_serials.issue_date IS NOT NULL
          OR all_serials.payout_invoice_number IS NOT NULL
        )
      ) AS is_3p_payable
    , current_timestamp AS rebuild_timestamp
  FROM all_serials
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS users
    ON all_serials.user_id = users.user_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__consignment_storage_fee_inventory_unit_snaps` AS storage_fee_snapshots
    ON all_serials.serial_number = storage_fee_snapshots.serial_number
    AND storage_fee_snapshots.snapshot_is_current IS TRUE

)

SELECT * FROM final
  );
    


  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_mpp_serials_history`
  
  
  OPTIONS()
  as (
    


WITH mpp_serials AS (

  SELECT DISTINCT serial_number
  , COALESCE(original_intake_creation_nyc, mag_creation_nyc) AS serial_creation_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  WHERE warehouse = 'MPP'

), warehouse_history AS (

  SELECT
    serial_number
  , string_agg(warehouse_history.warehouse, ',' order by warehouse_history.valid_from ASC) AS warehouse_track
  , array_agg(CAST(
        COALESCE(safe_cast(datetime(safe_cast(warehouse_history.logged_at AS timestamp), 'America/New_York') AS date), CAST(mpp_serials.serial_creation_nyc AS date))
        AS string)
    order by warehouse_history.valid_from ASC) AS journal_date_track
  , string_agg(CAST(creation_user_name AS string),',' order by warehouse_history.valid_from ASC) AS created_by_user_track
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_warehouse_history` AS warehouse_history
  INNER JOIN mpp_serials USING(serial_number)
  GROUP BY 1

), first_mpps AS (

  SELECT
    serial_number
  , MIN(COALESCE(safe_cast(datetime(safe_cast(warehouse_history.logged_at AS timestamp), 'America/New_York') AS date), CAST(mpp_serials.serial_creation_nyc AS date))) AS first_mpp_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_warehouse_history` AS warehouse_history
  INNER JOIN mpp_serials USING(serial_number)
  WHERE warehouse_history.warehouse = 'MPP'
  GROUP BY 1

), final AS (

  SELECT
    ss.serial_number

/* OG mpp_serials_history cols */
  , CAST(

    datetime_diff(
        cast(last_available_date as datetime),
        cast(first_available_date as datetime),
        day
    )

 AS int64) AS whole_duration
  , first_available_date
  , last_available_date
  , first_mpps.first_mpp_date
  , CAST(

    datetime_diff(
        cast(last_available_date as datetime),
        cast(first_mpps.first_mpp_date as datetime),
        day
    )

 AS int64) AS mpp_duration
  , ss.warehouse
  , ss.base_currency AS serial_base_currency
  , ss.price
  , ss.price_base_amount
  , ss.payout_amount
  , ss.serial_cost
  , ss.serial_cost_base_amount
  , ss.payout_invoice_id
  , ss.yseristatus_consignment_status
  , ss.consignor_id
  , ss.seller_name AS consignor_name
  , ss.x3_sku
  , ss.yseristatus_paid_out_status
  , ss.payout_date
  , ss.x3_order_id
  , warehouse_history.warehouse_track
  , warehouse_history.journal_date_track
  , warehouse_history.created_by_user_track
  , ss.stock_status as stock
  , products.size_uom
  , products.brand
  , products.name
  , sfl.stadium_order_id
  , sfl.order_date
  , sfl.inventory_seller
  , sfl.last_invoice_id

/* assessment workbook needed cols from stadium_serials */
 , ss.`mag_simple_sku`,
  ss.`simple_product_ids`,
  ss.`mag_serial_id`,
  ss.`mag_price`,
  ss.`mag_order_id`,
  ss.`mag_status`,
  ss.`mag_creation_nyc`,
  ss.`mag_update_nyc`,
  ss.`mag_conditions`,
  ss.`mag_warehouse`,
  ss.`dropshipper_type`,
  ss.`dropshipper_item_id`,
  ss.`dropshipper_id`,
  ss.`dropshipper_commission_rate`,
  ss.`x3_simple_sku`,
  ss.`x3_order_line`,
  ss.`fulfillment_number`,
  ss.`allocation_line_number`,
  ss.`x3_price`,
  ss.`x3_warehouse`,
  ss.`x3_location`,
  ss.`x3_size_uom`,
  ss.`x3_conditions`,
  ss.`x3_note`,
  ss.`x3_last_modified_nyc`,
  ss.`x3_available`,
  ss.`x3_commission_rate`,
  ss.`purchase_id`,
  ss.`purchase_line`,
  ss.`x3_purchase_reference`,
  ss.`x3_payout_invoice_id`,
  ss.`payout_invoice_line`,
  ss.`yserinf_rowid`,
  ss.`yseristatus_intake_date`,
  ss.`yseristatus_issue_date`,
  ss.`yseristatus_payout_date`,
  ss.`original_intake_creation_nyc`,
  ss.`original_intake_date`,
  ss.`original_intake_id`,
  ss.`original_intake_line`,
  ss.`original_intake_warehouse`,
  ss.`original_intake_seller_portal_ticket`,
  ss.`last_journal_creation_nyc`,
  ss.`last_journal_type`,
  ss.`last_journal_id`,
  ss.`last_journal_line`,
  ss.`last_journal_warehouse`,
  ss.`status_document`,
  ss.`document_type`,
  ss.`document_date`,
  ss.`document_id`,
  ss.`document_line`,
  ss.`ether_wms_inventory_unit_id`,
  ss.`label_number`,
  ss.`label_number_valid_from`,
  ss.`label_number_valid_to`,
  ss.`original_serial`,
  ss.`relation_to_original_serial`,
  ss.`ether_original_serial`,
  ss.`x3_original_serial`,
  ss.`rma_original_serial`,
  ss.`x3_stock_status`,
  ss.`payout_invoice_date`,
  ss.`payout_invoice_paid_amount`,
  ss.`payout_invoice_payable_amount`,
  ss.`payout_invoice_paid_date`,
  ss.`payout_invoice_payment_id`,
  ss.`payout_invoice_payment_accounting_date`,
  ss.`brand_subcategory`,
  ss.`product_attribute_set`,
  ss.`colorway`,
  ss.`size`,
  ss.`gender`,
  ss.`nickname`,
  ss.`mfg_sku`,
  ss.`pick_id`,
  ss.`shipment_number`,
  ss.`simple_sku`,
  ss.`business_entity`,
  ss.`cost_currency_conversion_date`,
  ss.`cost_currency_conversion_rate`,
  ss.`price_currency_conversion_date`,
  ss.`price_currency_conversion_rate`,
  ss.`serial_source`,
  ss.`serial_relationship`,
  ss.`serial_inventory`,
  ss.`seller_id`,
  ss.`seller_country`,
  ss.`seller_city`,
  ss.`seller_is_exempt_from_storage_fee`,
  ss.`seller_has_flat_rate_storage_fee`,
  ss.`storage_fee_is_payable`,
  ss.`conditions`,
  ss.`warehouse_bin`,
  ss.`consignment_status`,
  ss.`paid_out_status`,
  ss.`issue_date`,
  ss.`ether_payout_invoice_number`,
  ss.`is_3p_payable`,
  ss.`commission_rate`,
  ss.`purchase_price`,
  ss.`audit_logic`,
  ss.`purchase_reference`,
  ss.`seller_portal_ticket_number`,
  ss.`seller_portal_purchase_reference`,
  ss.`seller_portal_cost`,
  ss.`ether_receipt_created_at`,
  ss.`ether_receipt_warehouse`,
  ss.`ether_receipt_employee`,
  ss.`ether_receipt_status`,
  ss.`ether_intake_receipt_number`,
  ss.`ether_intake_date`,
  ss.`ether_price`,
  ss.`ether_warehouse_bin`,
  ss.`ether_stock_status`,
  ss.`ether_stock_status_label`,
  ss.`ether_simple_sku`,
  ss.`purchase_order_number`,
  ss.`vendor_number`,
  ss.`payment_request_ids`,
  ss.`payment_request_created_at`,
  ss.`last_payment_request_created_at`,
  ss.`payment_request_status`,
  ss.`payment_request_sla_deadline`,
  ss.`payment_request_pay_method`,
  ss.`ether_payment_third_party_identifier`,
  ss.`ether_payment_submitted_to_provider_at`,
  ss.`ether_payment_payout_date`,
  ss.`user_tax_form_request_date`,
  ss.`user_tax_form_status`,
  ss.`user_tax_form_approval_date`,
  ss.`withdrawal_request_ids`,
  ss.`withdrawal_request_created_at`,
  ss.`withdrawal_request_submission_date`,
  ss.`withdrawal_request_warehouse`,
  ss.`withdrawal_request_status`,
  ss.`withdrawal_request_note`,
  ss.`seller_portal_ticket_status`,
  ss.`seller_portal_ticket_created_at`,
  ss.`seller_portal_ticket_updated_at`,
  ss.`seller_portal_ticket_submitted_at`,
  ss.`seller_portal_ticket_is_return`,
  ss.`seller_portal_message`,
  ss.`source_bundle_number`,
  ss.`parent_company`,
  ss.`order_creation_nyc`,
  ss.`original_intake_warehouse_valid_to`,
  ss.`current_warehouse_valid_from`,
  ss.`quarantined_at`,
  ss.`removed_from_quarantine_at`,
  ss.`original_price`,
  ss.`price_changes`,
  ss.`cap_currently_on_hand`,
  ss.`cap_last_date_on_hand`,
  ss.`sgd_on_current_audit`,
  ss.`sgd_last_audit_date`,
  ss.`audit_status`

/* assessment workbook needed cols from stadium_consignors */
 , consignors.`consignor_type`,
  consignors.`inventory_relationship`,
  consignors.`inventory_type`,
  consignors.`consignor_email`,
  consignors.`consignor_city`,
  consignors.`consignor_state`,
  consignors.`consignor_country`,
  consignors.`seller_tier`,
  consignors.`is_exempt_from_storage_fee`,
  consignors.`has_flat_rate_storage_fee`,
  consignors.`consignor_creation_timestamp`,
  consignors.`consignor_intake_cohort`,
  consignors.`consignor_sales_cohort`,
  consignors.`qty_sold`,
  consignors.`value_sold`,
  consignors.`qty_withdrawn`,
  consignors.`value_withdrawn`,
  consignors.`qty_available`,
  consignors.`value_available`,
  consignors.`last_6_months_gtv`,
  consignors.`is_enterprise`,
  consignors.`latest_intaken_serial`,
  consignors.`is_active`,
  consignors.`consignor_persona`

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS ss
  INNER JOIN mpp_serials
    ON ss.serial_number = mpp_serials.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
    ON ss.simple_sku = products.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS sfl
    ON ss.serial_number = sfl.serial_number
    AND ss.stadium_order_id = sfl.stadium_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_consignors` AS consignors
    ON ss.consignor_id = consignors.consignor_id
  LEFT JOIN warehouse_history
    ON ss.serial_number = warehouse_history.serial_number
  LEFT JOIN first_mpps
    ON ss.serial_number = first_mpps.serial_number
  ORDER BY ss.first_available_date DESC

)

SELECT * FROM final
  );
    
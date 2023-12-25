/*
  N.B. there is additional logic in stg_stadium_finance_lines_adjustments
  to handle the legacy case (for Tmall) where we assume a return based on a refund
*/

--TODO for DE-3502: consider Ether RMAs in logic TBD

SELECT
    sol.`stadium_order_id`,
  sol.`mag_order_id`,
  sol.`order_item_id`,
  sol.`ether_order_number`,
  sol.`ether_order_item_line_number`,
  sol.`x3_order_id`,
  sol.`x3_order_line`,
  sol.`data_source`,
  sol.`dsco_item_id`,
  sol.`order_total_qty`,
  sol.`order_channel`,
  sol.`mag_order_status_raw`,
  sol.`order_shipping_description`,
  sol.`shipping_country`,
  sol.`shipping_region`,
  sol.`shipping_postcode`,
  sol.`shipping_address`,
  sol.`customer_id`,
  sol.`shipping_city`,
  sol.`email_domain`,
  sol.`order_date`,
  sol.`order_timestamp`,
  sol.`order_creation_nyc`,
  sol.`order_time_nyc`,
  sol.`customer_country`,
  sol.`customer_region`,
  sol.`billing_country`,
  sol.`billing_city`,
  sol.`checkout_type`,
  sol.`order_transaction_ids`,
  sol.`customer_country_and_telephone`,
  sol.`customer_country_and_postcode_and_lastname`,
  sol.`customer_firstname_and_lastname`,
  sol.`coupon_code`,
  sol.`mag_order_total_qty`,
  sol.`mag_order_payment`,
  sol.`mag_order_store_credit_applied`,
  sol.`mag_order_refunded`,
  sol.`mag_order_store_credit`,
  sol.`external_order_id`,
  sol.`shipping_name`,
  sol.`mag_order_creation_nyc`,
  sol.`mag_order_entity_id`,
  sol.`external_order_creation_nyc`,
  sol.`mag_order_channel`,
  sol.`customer_name`,
  sol.`magento_order_link`,
  sol.`order_base_currency`,
  sol.`cash_payment`,
  sol.`x3_ymagord`,
  sol.`x3_order_creation_nyc`,
  sol.`x3_order_date`,
  sol.`x3_order_channel`,
  sol.`x3_order_status_closes_line`,
  sol.`x3_order_total_qty`,
  sol.`x3_order_total`,
  sol.`x3_order_status`,
  sol.`delivery_status`,
  sol.`last_invoice_id`,
  sol.`order_invoice_status`,
  sol.`last_invoice_date`,
  sol.`last_invoice_status`,
  sol.`credit_status`,
  sol.`ga_channel_grouping`,
  sol.`acquisition_medium`,
  sol.`acquisition_source`,
  sol.`acquisition_campaign`,
  sol.`acquisition_device_category`,
  sol.`order_total_affiliate_commission`,
  sol.`linkshare_total_commission`,
  sol.`affiliate_offer`,
  sol.`affiliate_publisher`,
  sol.`affiliate_publisher_group`,
  sol.`simple_sku`,
  sol.`order_serial`,
  sol.`line_item_price_raw`,
  sol.`line_item_tax`,
  sol.`line_item_discount_raw`,
  sol.`line_item_store_credit_applied`,
  sol.`line_shipping_price`,
  sol.`line_shipping_tax`,
  sol.`line_shipping_discount`,
  sol.`line_shipping_store_credit_applied`,
  sol.`qty_canceled`,
  sol.`qty_refunded`,
  sol.`qty_ordered`,
  sol.`qty_shipped`,
  sol.`line_item_original_price`,
  sol.`simple_item_id`,
  sol.`simple_product_id`,
  sol.`configurable_item_id`,
  sol.`configurable_product_id`,
  sol.`mag_order_serial`,
  sol.`mag_tracking_number`,
  sol.`mag_shipment_ids`,
  sol.`mag_shipment_creation_nyc`,
  sol.`mag_tracking_creation_nyc`,
  sol.`mag_rma_ids`,
  sol.`first_rma_creation_nyc`,
  sol.`last_rma_update_nyc`,
  sol.`rma_statuses`,
  sol.`rma_first_date_received`,
  sol.`rma_tracking_numbers`,
  sol.`house_serial_numbers`,
  sol.`rma_last_reply_name`,
  sol.`rma_last_reply_nyc`,
  sol.`rma_package_approved_nyc`,
  sol.`rma_closed_nyc`,
  sol.`rma_item_qty_requested`,
  sol.`creditmemo_transaction_ids`,
  sol.`mag_creditmemo_ids`,
  sol.`first_creditmemo_creation_nyc`,
  sol.`last_creditmemo_update_nyc`,
  sol.`creditmemo_reason`,
  sol.`creditmemo_item_price`,
  sol.`creditmemo_item_qty`,
  sol.`creditmemo_item_discount`,
  sol.`creditmemo_item_tax`,
  sol.`creditmemo_shipping`,
  sol.`creditmemo_shipping_tax`,
  sol.`creditmemo_discount`,
  sol.`creditmemo_tax`,
  sol.`creditmemo_adjustment`,
  sol.`creditmemo_refunded`,
  sol.`creditmemo_store_credit`,
  sol.`creditmemo_store_credit_refunded`,
  sol.`external_line_id`,
  sol.`farfetch_order_status_id`,
  sol.`farfetch_order_status`,
  sol.`external_tracking_number`,
  sol.`external_return_id`,
  sol.`external_return_creation_nyc`,
  sol.`fulfillment_number`,
  sol.`allocation_line_number`,
  sol.`x3_order_serial`,
  sol.`x3_order_warehouse`,
  sol.`allocated_serial`,
  sol.`allocation_type`,
  sol.`pick_id`,
  sol.`pick_line`,
  sol.`x3_pick_creation_nyc`,
  sol.`pick_update_nyc`,
  sol.`lg_order_number`,
  sol.`x3_ship_date`,
  sol.`delivery_flag`,
  sol.`delivery_id`,
  sol.`delivery_line`,
  sol.`delivery_creation_nyc`,
  sol.`delivery_warehouse`,
  sol.`delivery_shipping_description`,
  sol.`x3_tracking_number`,
  sol.`invoice_flag`,
  sol.`last_invoice_line`,
  sol.`x3_return_id`,
  sol.`x3_return_line`,
  sol.`x3_return_creation_nyc`,
  sol.`x3_returned_serial`,
  sol.`x3_creditmemo_id`,
  sol.`x3_creditmemo_line`,
  sol.`x3_creditmemo_creation_nyc`,
  sol.`x3_creditmemo_line_refunded`,
  sol.`x3_creditmemo_total_refunded`,
  sol.`ether_rma_number`,
  sol.`ether_rma_created_at`,
  sol.`ether_rma_updated_at`,
  sol.`ether_return_reason`,
  sol.`ether_return_condition`,
  sol.`ether_rma_item_status`,
  sol.`ether_rma_item_resolved_at`,
  sol.`pick_creation_nyc`,
  sol.`_3pl_pick_creation_nyc`,
  sol.`_3pl_pick_item_status`,
  sol.`_3pl_pick_item_file_time`,
  sol.`cap_shipping_file_nyc`,
  sol.`cap_ship_date`,
  sol.`ship_method`,
  sol.`cap_ship_method`,
  sol.`cap_tracking_number`,
  sol.`cap_serial`,
  sol.`_3pl_client_code`,
  sol.`_3pl_carrier_code`,
  sol.`dsco_order_id`,
  sol.`dsco_order_status`,
  sol.`dsco_ship_late_date`,
  sol.`dsco_ship_date`,
  sol.`dsco_tracking_number`,
  sol.`dropship_inventory_cost`,
  sol.`dropship_inventory_source`,
  sol.`dropship_inventory_relationship`,
  sol.`dropship_inventory_type`,
  sol.`dropship_inventory_seller`,
  sol.`dropship_order_paid_out`,
  sol.`dropshipper_name`,
  sol.`ship_date`,
  sol.`shipping_timestamp_nyc`,
  sol.`tracking_number`,
  sol.`issued_serial`,
  sol.`serial_number`,
  sol.`crossdock_reference`,
  sol.`tracking_number_from_fulfillment`,
  sol.`channel_or_gateway`,
  sol.`business_unit`,
  sol.`sales_channel`,
  sol.`marketing_channel`,
  sol.`order_id`,
  sol.`dispatch_date`,
  sol.`dispatch_warehouse`,
  sol.`dispatch_country`,
  sol.`expected_issue_date`,
  sol.`shipping_value_not_charged`,
  sol.`channel_fee_percentage`,
  sol.`channel_upcharge_percentage`,
  sol.`channel_upcharge_flat`,
  sol.`channel_fee_flat`,
  sol.`riskified_percentage`,
  sol.`agency_percentage`,
  sol.`return_refund_deduction`,
  sol.`fee_includes_ship_cost`,
  sol.`fee_includes_duties`,
  sol.`receipt_date_is_dispatch_date`,
  sol.`return_refund_threshold`,
  sol.`free_shipping_value`,
  sol.`return_if_refunded`,
  sol.`x3_sku`,
  sol.`configurable_sku`,
  sol.`product_sku`,
  sol.`variant_size`,
  sol.`product_brand`,
  sol.`product_attribute_set`,
  sol.`product_name`,
  sol.`cap_charge`,
  sol.`mag_order_status`,
  sol.`is_closed`,
  sol.`geography_type`,
  sol.`geography`,
  sol.`customer_email`,
  sol.`individual_email`,
  sol.`unique_email`,
  sol.`is_for_a_customer`,
  sol.`external_order_total_item_price`,
  sol.`external_order_total_item_tax`,
  sol.`external_order_total_item_discount`,
  sol.`external_order_shipping_price`,
  sol.`external_order_shipping_tax`,
  sol.`external_order_shipping_discount`,
  sol.`external_order_duties`,
  sol.`external_order_has_item_discount`,
  sol.`external_order_has_shipping_discount`,
  sol.`order_shipping_is_express`,
  sol.`ship_method_is_express`,
  sol.`marketing_promo_type`,
  sol.`marketing_promo_description`,
  sol.`inventory_base_currency`,
  sol.`inventory_cost_currency_conversion_date`,
  sol.`inventory_cost_currency_conversion_rate`,
  sol.`inventory_cost_base_amount`,
  sol.`inventory_cost`,
  sol.`inventory_source`,
  sol.`inventory_relationship`,
  sol.`inventory_type`,
  sol.`inventory_seller`,
  sol.`seller_name`,
  sol.`seller_country`,
  sol.`seller_city`,
  sol.`serial_base_currency`,
  sol.`serial_price_base_amount`,
  sol.`serial_price`,
  sol.`commission_rate`,
  sol.`serial_cost_base_amount`,
  sol.`serial_cost`,
  sol.`serial_simple_sku`,
  sol.`paid_out_status`,
  sol.`yseristatus_issue_date`,
  sol.`purchase_id`,
  sol.`purchase_reference`,
  sol.`serial_purchase_price`,
  sol.`payout_invoice_id`,
  sol.`serial_order_id`,
  sol.`serial_order_match`,
  sol.`order_serial_base_currency`,
  sol.`order_serial_price_base_amount`,
  sol.`order_serial_price`,
  sol.`order_serial_previous_price_base_amount`,
  sol.`order_serial_previous_price`,
  sol.`order_serial_price_changed_at`,
  sol.`seller_portal_promotion_id`,
  sol.`seller_portal_promotion_type`,
  sol.`seller_portal_promotion_started_at`,
  sol.`revenue`,
  sol.`tracking_number_from_crossdock`,
  sol.`total_ship_cost_from_crossdock`,
  sol.`ship_cost_from_crossdock_type`,
  sol.`ship_cost_from_crossdock_source`,
  sol.`total_zebra_ship_cost`,
  sol.`total_tmall_b2c_ship_cost`,
  sol.`total_flow_ship_cost`,
  sol.`total_tmall_b2c_duties_cost`,
  sol.`total_flow_duties_cost`,
  sol.`total_ship_cost_from_fulfillment`,
  sol.`ship_cost_from_fulfillment_type`,
  sol.`ship_cost_from_fulfillment_source`,
  sol.`total_p2p_ship_cost`,
  sol.`total_dhl_ship_cost`,
  sol.`total_fps_ship_cost`,
  sol.`total_cap_invoiced_ship_cost`,
  sol.`total_fedex_ship_cost`,
  sol.`total_cap_confirmation_ship_cost`,
  sol.`dhl_customs_invoice_id`,
  sol.`total_dhl_customs_cost`,
  sol.`dhl_duties_invoice_id`,
  sol.`total_dhl_duties_cost`,
  sol.`ship_cost_source`,
  sol.`ship_cost_type`,
  sol.`private_customer_status`,
  sol.`private_customer_stylist`,
  sol.`private_customer_type`,
  sol.`private_customer_source`,
  sol.`private_client_customer_id`,
  sol.`new_serial_from_return`,
  sol.`new_serial_inventory_relationship`,
  sol.`return_intake_id`,
  sol.`return_intake_creation_nyc`,
  sol.`issued_serial_next_journal_date_after_dispatch_date`,
  sol.`issued_serial_next_journal_document_id_after_dispatch_date`,
  sol.`dispatch_timestamp_nyc`
  , 
(
  
(
  sol.x3_return_id IS NOT NULL
  OR sol.return_intake_id IS NOT NULL
  OR sol.issued_serial_next_journal_document_id_after_dispatch_date IS NOT NULL
)

  OR 
(
  sol.new_serial_from_return IS NOT NULL
  OR (sol.dispatch_date IS NOT NULL AND NOT sol.serial_order_match)
)

  OR 
(
  


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Closed.*')


  OR 


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Package Approved.*')


)

  OR 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_package_approved_nyc, sol.rma_closed_nyc) IS NOT NULL
)

  OR 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_last_reply_name, 'NONE') NOT IN ('NONE', 'YASNAYA PENA', 'YASNAYA P')
  AND cast(coalesce(sol.rma_last_reply_nyc, sol.last_rma_update_nyc) AS date) < '2021-01-01'
)

)
 AS is_return
  , sol.dispatch_date IS NULL OR 
(
  
(
  sol.x3_return_id IS NOT NULL
  OR sol.return_intake_id IS NOT NULL
  OR sol.issued_serial_next_journal_document_id_after_dispatch_date IS NOT NULL
)

  OR 
(
  sol.new_serial_from_return IS NOT NULL
  OR (sol.dispatch_date IS NOT NULL AND NOT sol.serial_order_match)
)

  OR 
(
  


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Closed.*')


  OR 


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Package Approved.*')


)

  OR 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_package_approved_nyc, sol.rma_closed_nyc) IS NOT NULL
)

  OR 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_last_reply_name, 'NONE') NOT IN ('NONE', 'YASNAYA PENA', 'YASNAYA P')
  AND cast(coalesce(sol.rma_last_reply_nyc, sol.last_rma_update_nyc) AS date) < '2021-01-01'
)

)
 OR sol.qty_refunded > 0 AS refund_expected
  , cast(
      CASE
        WHEN 
(
  
(
  sol.x3_return_id IS NOT NULL
  OR sol.return_intake_id IS NOT NULL
  OR sol.issued_serial_next_journal_document_id_after_dispatch_date IS NOT NULL
)

  OR 
(
  sol.new_serial_from_return IS NOT NULL
  OR (sol.dispatch_date IS NOT NULL AND NOT sol.serial_order_match)
)

  OR 
(
  


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Closed.*')


  OR 


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Package Approved.*')


)

  OR 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_package_approved_nyc, sol.rma_closed_nyc) IS NOT NULL
)

  OR 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_last_reply_name, 'NONE') NOT IN ('NONE', 'YASNAYA PENA', 'YASNAYA P')
  AND cast(coalesce(sol.rma_last_reply_nyc, sol.last_rma_update_nyc) AS date) < '2021-01-01'
)

)

        THEN nullif(
     least(
      coalesce(sol.return_intake_creation_nyc, CAST('9999-12-31' AS date))
      ,coalesce(sol.x3_return_creation_nyc, CAST('9999-12-31' AS date))
      ,coalesce(sol.issued_serial_next_journal_date_after_dispatch_date, CAST('9999-12-31' AS date))
      ,coalesce(sol.rma_closed_nyc, CAST('9999-12-31' AS date))
      ,coalesce(sol.rma_package_approved_nyc, CAST('9999-12-31' AS date))
      ,coalesce(CASE WHEN 
(
  


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Closed.*')


  OR 


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Package Approved.*')


)
 THEN sol.last_rma_update_nyc END, CAST('9999-12-31' AS date))
      ,coalesce(CASE WHEN 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_last_reply_name, 'NONE') NOT IN ('NONE', 'YASNAYA PENA', 'YASNAYA P')
  AND cast(coalesce(sol.rma_last_reply_nyc, sol.last_rma_update_nyc) AS date) < '2021-01-01'
)
 THEN coalesce(sol.rma_last_reply_nyc, sol.last_rma_update_nyc) END, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  )
      END
      AS date
    ) AS return_date
  , cast(
      CASE
        WHEN 
(
  sol.x3_return_id IS NOT NULL
  OR sol.return_intake_id IS NOT NULL
  OR sol.issued_serial_next_journal_document_id_after_dispatch_date IS NOT NULL
)
 THEN 'X3 Document'
        WHEN 
(
  sol.new_serial_from_return IS NOT NULL
  OR (sol.dispatch_date IS NOT NULL AND NOT sol.serial_order_match)
)
 THEN 'X3 Serial'
        WHEN 
(
  


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Closed.*')


  OR 


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Package Approved.*')


)
 THEN 'RMA Status'
        WHEN 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_package_approved_nyc, sol.rma_closed_nyc) IS NOT NULL
)
 THEN 'RMA History'
        WHEN 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_last_reply_name, 'NONE') NOT IN ('NONE', 'YASNAYA PENA', 'YASNAYA P')
  AND cast(coalesce(sol.rma_last_reply_nyc, sol.last_rma_update_nyc) AS date) < '2021-01-01'
)
 THEN 'RMA Reply'
      END
      AS string
    ) AS return_source
  , 
(
  sol.x3_return_id IS NOT NULL
  OR sol.return_intake_id IS NOT NULL
  OR sol.issued_serial_next_journal_document_id_after_dispatch_date IS NOT NULL
)
 AS is_return_by_x3_document
  , 
(
  sol.new_serial_from_return IS NOT NULL
  OR (sol.dispatch_date IS NOT NULL AND NOT sol.serial_order_match)
)
 AS is_return_by_x3_serial
  , 
(
  


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Closed.*')


  OR 


  regexp_contains(coalesce(sol.rma_statuses, ''), r'(?i).*Package Approved.*')


)
 AS is_return_by_rma_status
  , 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_package_approved_nyc, sol.rma_closed_nyc) IS NOT NULL
)
 AS is_return_by_farfetch_rma_history
  , 
(
  sol.channel_or_gateway IN ('Farfetch', 'FPS')
  AND coalesce(sol.rma_last_reply_name, 'NONE') NOT IN ('NONE', 'YASNAYA PENA', 'YASNAYA P')
  AND cast(coalesce(sol.rma_last_reply_nyc, sol.last_rma_update_nyc) AS date) < '2021-01-01'
)
 AS is_return_by_farfetch_rma_reply
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_tmp_sol` AS sol
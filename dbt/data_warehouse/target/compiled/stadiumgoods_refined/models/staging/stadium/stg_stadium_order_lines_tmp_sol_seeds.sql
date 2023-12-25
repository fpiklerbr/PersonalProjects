/* need explicitly declare select which cols from item_line_info */
  SELECT
  item_line_info.`stadium_order_id`,
  item_line_info.`mag_order_id`,
  item_line_info.`order_item_id`,
  item_line_info.`ether_order_number`,
  item_line_info.`ether_order_item_line_number`,
  item_line_info.`x3_order_id`,
  item_line_info.`x3_order_line`,
  item_line_info.`data_source`,
  item_line_info.`dsco_item_id`,
  item_line_info.`order_total_qty`,
  item_line_info.`order_channel`,
  item_line_info.`mag_order_status_raw`,
  item_line_info.`order_shipping_description`,
  item_line_info.`shipping_country`,
  item_line_info.`shipping_region`,
  item_line_info.`shipping_postcode`,
  item_line_info.`shipping_address`,
  item_line_info.`customer_id`,
  item_line_info.`shipping_city`,
  item_line_info.`email_domain`,
  item_line_info.`order_date`,
  item_line_info.`order_timestamp`,
  item_line_info.`order_creation_nyc`,
  item_line_info.`order_time_nyc`,
  item_line_info.`customer_country`,
  item_line_info.`customer_region`,
  item_line_info.`billing_country`,
  item_line_info.`billing_city`,
  item_line_info.`checkout_type`,
  item_line_info.`order_transaction_ids`,
  item_line_info.`customer_country_and_telephone`,
  item_line_info.`customer_country_and_postcode_and_lastname`,
  item_line_info.`customer_firstname_and_lastname`,
  item_line_info.`coupon_code`,
  item_line_info.`mag_order_total_qty`,
  item_line_info.`mag_order_payment`,
  item_line_info.`mag_order_store_credit_applied`,
  item_line_info.`mag_order_refunded`,
  item_line_info.`mag_order_store_credit`,
  item_line_info.`external_order_id`,
  item_line_info.`shipping_name`,
  item_line_info.`mag_order_creation_nyc`,
  item_line_info.`mag_order_entity_id`,
  item_line_info.`external_order_creation_nyc`,
  item_line_info.`mag_order_channel`,
  item_line_info.`customer_name`,
  item_line_info.`magento_order_link`,
  item_line_info.`order_base_currency`,
  item_line_info.`cash_payment`,
  item_line_info.`x3_ymagord`,
  item_line_info.`x3_order_creation_nyc`,
  item_line_info.`x3_order_date`,
  item_line_info.`x3_order_channel`,
  item_line_info.`x3_order_status_closes_line`,
  item_line_info.`x3_order_total_qty`,
  item_line_info.`x3_order_total`,
  item_line_info.`x3_order_status`,
  item_line_info.`delivery_status`,
  item_line_info.`last_invoice_id`,
  item_line_info.`order_invoice_status`,
  item_line_info.`last_invoice_date`,
  item_line_info.`last_invoice_status`,
  item_line_info.`credit_status`,
  item_line_info.`ga_channel_grouping`,
  item_line_info.`acquisition_medium`,
  item_line_info.`acquisition_source`,
  item_line_info.`acquisition_campaign`,
  item_line_info.`acquisition_device_category`,
  item_line_info.`order_total_affiliate_commission`,
  item_line_info.`linkshare_total_commission`,
  item_line_info.`affiliate_offer`,
  item_line_info.`affiliate_publisher`,
  item_line_info.`affiliate_publisher_group`,
  item_line_info.`simple_sku`,
  item_line_info.`order_serial`,
  item_line_info.`line_item_price_raw`,
  item_line_info.`line_item_tax`,
  item_line_info.`line_item_discount_raw`,
  item_line_info.`line_item_store_credit_applied`,
  item_line_info.`line_shipping_price`,
  item_line_info.`line_shipping_tax`,
  item_line_info.`line_shipping_discount`,
  item_line_info.`line_shipping_store_credit_applied`,
  item_line_info.`qty_canceled`,
  item_line_info.`qty_refunded`,
  item_line_info.`qty_ordered`,
  item_line_info.`qty_shipped`,
  item_line_info.`line_item_original_price`,
  item_line_info.`simple_item_id`,
  item_line_info.`simple_product_id`,
  item_line_info.`configurable_item_id`,
  item_line_info.`configurable_product_id`,
  item_line_info.`mag_order_serial`,
  item_line_info.`mag_tracking_number`,
  item_line_info.`mag_shipment_ids`,
  item_line_info.`mag_shipment_creation_nyc`,
  item_line_info.`mag_tracking_creation_nyc`,
  item_line_info.`mag_rma_ids`,
  item_line_info.`first_rma_creation_nyc`,
  item_line_info.`last_rma_update_nyc`,
  item_line_info.`rma_statuses`,
  item_line_info.`rma_first_date_received`,
  item_line_info.`rma_tracking_numbers`,
  item_line_info.`house_serial_numbers`,
  item_line_info.`rma_last_reply_name`,
  item_line_info.`rma_last_reply_nyc`,
  item_line_info.`rma_package_approved_nyc`,
  item_line_info.`rma_closed_nyc`,
  item_line_info.`rma_item_qty_requested`,
  item_line_info.`creditmemo_transaction_ids`,
  item_line_info.`mag_creditmemo_ids`,
  item_line_info.`first_creditmemo_creation_nyc`,
  item_line_info.`last_creditmemo_update_nyc`,
  item_line_info.`creditmemo_reason`,
  item_line_info.`creditmemo_item_price`,
  item_line_info.`creditmemo_item_qty`,
  item_line_info.`creditmemo_item_discount`,
  item_line_info.`creditmemo_item_tax`,
  item_line_info.`creditmemo_shipping`,
  item_line_info.`creditmemo_shipping_tax`,
  item_line_info.`creditmemo_discount`,
  item_line_info.`creditmemo_tax`,
  item_line_info.`creditmemo_adjustment`,
  item_line_info.`creditmemo_refunded`,
  item_line_info.`creditmemo_store_credit`,
  item_line_info.`creditmemo_store_credit_refunded`,
  item_line_info.`external_line_id`,
  item_line_info.`farfetch_order_status_id`,
  item_line_info.`farfetch_order_status`,
  item_line_info.`external_tracking_number`,
  item_line_info.`external_return_id`,
  item_line_info.`external_return_creation_nyc`,
  item_line_info.`fulfillment_number`,
  item_line_info.`allocation_line_number`,
  item_line_info.`x3_order_serial`,
  item_line_info.`x3_order_warehouse`,
  item_line_info.`allocated_serial`,
  item_line_info.`allocation_type`,
  item_line_info.`pick_id`,
  item_line_info.`pick_line`,
  item_line_info.`x3_pick_creation_nyc`,
  item_line_info.`pick_update_nyc`,
  item_line_info.`lg_order_number`,
  item_line_info.`x3_ship_date`,
  item_line_info.`delivery_flag`,
  item_line_info.`delivery_id`,
  item_line_info.`delivery_line`,
  item_line_info.`delivery_creation_nyc`,
  item_line_info.`delivery_warehouse`,
  item_line_info.`delivery_shipping_description`,
  item_line_info.`x3_tracking_number`,
  item_line_info.`invoice_flag`,
  item_line_info.`last_invoice_line`,
  item_line_info.`x3_return_id`,
  item_line_info.`x3_return_line`,
  item_line_info.`x3_return_creation_nyc`,
  item_line_info.`x3_returned_serial`,
  item_line_info.`x3_creditmemo_id`,
  item_line_info.`x3_creditmemo_line`,
  item_line_info.`x3_creditmemo_creation_nyc`,
  item_line_info.`x3_creditmemo_line_refunded`,
  item_line_info.`x3_creditmemo_total_refunded`,
  item_line_info.`ether_rma_number`,
  item_line_info.`ether_rma_created_at`,
  item_line_info.`ether_rma_updated_at`,
  item_line_info.`ether_return_reason`,
  item_line_info.`ether_return_condition`,
  item_line_info.`ether_rma_item_status`,
  item_line_info.`ether_rma_item_resolved_at`,
  item_line_info.`pick_creation_nyc`,
  item_line_info.`_3pl_pick_creation_nyc`,
  item_line_info.`_3pl_pick_item_status`,
  item_line_info.`_3pl_pick_item_file_time`,
  item_line_info.`cap_shipping_file_nyc`,
  item_line_info.`cap_ship_date`,
  item_line_info.`ship_method`,
  item_line_info.`cap_ship_method`,
  item_line_info.`cap_tracking_number`,
  item_line_info.`cap_serial`,
  item_line_info.`_3pl_client_code`,
  item_line_info.`_3pl_carrier_code`,
  item_line_info.`dsco_order_id`,
  item_line_info.`dsco_order_status`,
  item_line_info.`dsco_ship_late_date`,
  item_line_info.`dsco_ship_date`,
  item_line_info.`dsco_tracking_number`,
  item_line_info.`dropship_inventory_cost`,
  item_line_info.`dropship_inventory_source`,
  item_line_info.`dropship_inventory_relationship`,
  item_line_info.`dropship_inventory_type`,
  item_line_info.`dropship_inventory_seller`,
  item_line_info.`dropship_order_paid_out`,
  item_line_info.`dropshipper_name`,
  item_line_info.`ship_date`,
  item_line_info.`shipping_timestamp_nyc`,
  item_line_info.`tracking_number`,
  item_line_info.`issued_serial`,
  item_line_info.`serial_number`,
  item_line_info.`crossdock_reference`,
  item_line_info.`tracking_number_from_fulfillment`

/* channel attributes */
  , channel.channel_or_gateway
  , channel.business_unit
  , channel.sales_channel
  , COALESCE(item_line_info.ga_channel_grouping, channel.sales_channel) AS marketing_channel
  , COALESCE(channel.sales_channel || ' order ' || item_line_info.external_order_id, 'Mag order ' || item_line_info.mag_order_id, 'X3 order ' || item_line_info.x3_order_id) AS order_id
  , CASE
      WHEN channel.channel_or_gateway = 'Farfetch Italy' THEN coalesce(item_line_info.ship_date, item_line_info.order_date)
      WHEN channel.dispatch_on_order_date THEN item_line_info.order_date
      ELSE coalesce(
          item_line_info.ship_date
        , CASE WHEN item_line_info.issued_serial IS NOT NULL THEN item_line_info.last_invoice_date END
      )
END AS dispatch_date
  , CAST(
    (CASE WHEN CASE
      WHEN channel.channel_or_gateway = 'Farfetch Italy' THEN coalesce(item_line_info.ship_date, item_line_info.order_date)
      WHEN channel.dispatch_on_order_date THEN item_line_info.order_date
      ELSE coalesce(
          item_line_info.ship_date
        , CASE WHEN item_line_info.issued_serial IS NOT NULL THEN item_line_info.last_invoice_date END
      )
END IS NULL THEN NULL
        ELSE COALESCE(
            item_line_info.delivery_warehouse
            , item_line_info.x3_order_warehouse
            , 
  CAST(regexp_replace(item_line_info.dropship_inventory_source, r'-', '_') AS string)



        ) END)
AS string) AS dispatch_warehouse
  , dispatch_countries.geography AS dispatch_country
  , SAFE_CAST(SAFE_CAST(

        datetime_add(
            cast( CASE WHEN channel.channel_or_gateway = 'Farfetch Italy'
THEN coalesce(item_line_info.ship_date, item_line_info.order_date)
WHEN channel.dispatch_on_order_date
THEN item_line_info.order_date
ELSE item_line_info.ship_date
END as datetime),
        interval coalesce(CAST(
  CAST(regexp_extract(CAST(channel.issue_date_delay AS string), 
  r'\d+'
) AS string)
 AS int64), 0) day
        )

 AS datetime) AS date) AS expected_issue_date
  , COALESCE(NULLIF(item_line_info.line_shipping_price, 0), free_shipping_value.free_shipping_value, 10) AS shipping_value_not_charged
  , CASE WHEN item_line_info.cash_payment THEN 0 ELSE coalesce(channel.fee_percentage, 0) END AS channel_fee_percentage
  , coalesce(upcharge_percentage.upcharge_value, 0) AS channel_upcharge_percentage
  , coalesce(upcharge_flat.upcharge_value, 0) AS channel_upcharge_flat

/* channel attributes */
  , COALESCE(channel.fee_flat, 0) AS channel_fee_flat
  , COALESCE(channel.riskified_percentage, 0) AS riskified_percentage
  , COALESCE(channel.agency_percentage, 0) AS agency_percentage
  , COALESCE(channel.return_refund_deduction, 0) AS return_refund_deduction
  , COALESCE(channel.fee_includes_ship_cost, False) AS fee_includes_ship_cost
  , COALESCE(channel.fee_includes_duties, False) AS fee_includes_duties
  , COALESCE(channel.receipt_date_is_dispatch_date, False) AS receipt_date_is_dispatch_date
  , COALESCE(channel.return_refund_threshold, 1) AS return_refund_threshold
  , coalesce(
        free_shipping_value.free_shipping_value
      , CASE WHEN item_line_info.order_timestamp < '2021-07-01 00:00:00-04:00' THEN 10 ELSE 12 END
    ) AS free_shipping_value
  , CASE
      WHEN channel.return_if_refunded IS TRUE AND item_line_info.order_date <= channel.return_if_refunded_cutoff_date
      THEN TRUE
      ELSE FALSE
    END AS return_if_refunded

/* product attributes */
  , products.x3_sku
  , products.configurable_sku
  , products.mfg_sku AS product_sku
  , products.size AS variant_size
  , products.brand AS product_brand
  , products.attribute_set AS product_attribute_set
  , products.name AS product_name
  , CASE WHEN item_line_info.delivery_warehouse = 'CAP' OR item_line_info.cap_serial IS NOT NULL
      THEN CASE WHEN products.x3_attribute_set IN ('Accessories', 'Apparel')
            THEN 2 ELSE 4 END
      ELSE 0 END AS cap_charge /* needs work */

/* order_status attr */
  , COALESCE(mag_order_status.magento_order_status, item_line_info.mag_order_status_raw) AS mag_order_status
  , (
  	    COALESCE(item_line_info.x3_order_status_closes_line, false)
  	    OR COALESCE(mag_order_status.closes_line, false)
  	    OR COALESCE(channel.closes_line, false)
  	    OR item_line_info.qty_canceled + item_line_info.qty_refunded + item_line_info.qty_shipped >= item_line_info.qty_ordered
    ) AS is_closed

/* shipping_region, shipping_country */
  , coalesce(shipping_region.geography_type, shipping_country.geography_type, 'Unknown') AS geography_type
  , COALESCE(shipping_region.geography, shipping_country.geography, item_line_info.customer_country, 'Unknown') AS geography

/* email_address, email_domain attributes */
  , coalesce(external_pricing.customer_email, item_line_info.customer_email) AS customer_email
  , CASE
      WHEN NOT COALESCE(email_domain.not_identifiable, false) AND NOT COALESCE(email_domain.not_unique, false) AND NOT COALESCE(email_domain.not_gmv, false) AND NOT COALESCE(email_address.is_order_channel, false)
      THEN item_line_info.customer_email
    END AS individual_email
  , CASE
      WHEN external_pricing.customer_email IS NOT NULL
      THEN external_pricing.customer_email
      WHEN NOT COALESCE(email_domain.not_unique, false) AND NOT COALESCE(email_domain.not_gmv, false) AND NOT COALESCE(email_address.is_order_channel, false)
      THEN item_line_info.customer_email
    END AS unique_email

/* customer attr */
  , (COALESCE(channel.gmv, false) AND NOT COALESCE(email_domain.not_gmv, false) AND NOT COALESCE(email_address.is_tester, false)) AS is_for_a_customer

/* external_pricing attributes */
  , CASE WHEN channel.use_external_item_price THEN external_pricing.external_order_total_item_price END AS external_order_total_item_price
  , CASE WHEN channel.use_external_item_tax THEN external_pricing.external_order_total_item_tax END AS external_order_total_item_tax
  , CASE WHEN channel.use_external_item_discount THEN external_pricing.external_order_total_item_discount END AS external_order_total_item_discount
  , CASE WHEN channel.use_external_shipping_price THEN external_pricing.external_order_shipping_price END AS external_order_shipping_price
  , CASE WHEN channel.use_external_shipping_tax THEN external_pricing.external_order_shipping_tax END AS external_order_shipping_tax
  , CASE WHEN channel.use_external_shipping_discount THEN external_pricing.external_order_shipping_discount END AS external_order_shipping_discount
  , CASE WHEN channel.use_external_duties THEN external_pricing.external_order_duties END AS external_order_duties
  , (external_pricing.external_order_total_item_discount <> 0) IS TRUE AS external_order_has_item_discount
  , (external_pricing.external_order_shipping_discount <> 0) IS TRUE AS external_order_has_shipping_discount

/* express shipping */
  , (order_shipping_descriptions.is_express IS TRUE) AS order_shipping_is_express
  , (ship_methods.is_express IS TRUE) AS ship_method_is_express

/* promo dates */
  , CASE
      WHEN channel.business_unit = 'DTC'
      THEN order_dates.marketing_promo_type
    END AS marketing_promo_type
  , CASE
      WHEN channel.business_unit = 'DTC'
      THEN order_dates.marketing_promo_description
    END AS marketing_promo_description

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info` AS item_line_info
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products ON products.simple_sku = item_line_info.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_external_pricing` AS external_pricing ON external_pricing.mag_order_id = item_line_info.mag_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_email_addresses` AS email_address ON email_address.email_address = item_line_info.customer_email
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_email_domains` AS email_domain ON email_domain.email_domain = item_line_info.email_domain
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_channels` AS channel ON channel.order_channel = item_line_info.order_channel

  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history` AS upcharge_flat
    ON channel.channel_or_gateway = upcharge_flat.channel_or_gateway
    AND item_line_info.order_timestamp BETWEEN upcharge_flat.valid_from AND upcharge_flat.valid_to
    AND upcharge_flat.upcharge_type = 'flat'
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history` AS upcharge_percentage
    ON channel.channel_or_gateway = upcharge_percentage.channel_or_gateway
    AND item_line_info.order_timestamp BETWEEN upcharge_percentage.valid_from AND upcharge_percentage.valid_to
    AND upcharge_percentage.upcharge_type = 'percentage'

  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS ether_warehouses
    ON CAST(
    (CASE WHEN CASE
      WHEN channel.channel_or_gateway = 'Farfetch Italy' THEN coalesce(item_line_info.ship_date, item_line_info.order_date)
      WHEN channel.dispatch_on_order_date THEN item_line_info.order_date
      ELSE coalesce(
          item_line_info.ship_date
        , CASE WHEN item_line_info.issued_serial IS NOT NULL THEN item_line_info.last_invoice_date END
      )
END IS NULL THEN NULL
        ELSE COALESCE(
            item_line_info.delivery_warehouse
            , item_line_info.x3_order_warehouse
            , 
  CAST(regexp_replace(item_line_info.dropship_inventory_source, r'-', '_') AS string)



        ) END)
AS string) = ether_warehouses.warehouse_code
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_shipping_countries` AS dispatch_countries
    ON ether_warehouses.country = dispatch_countries.shipping_country

  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_magento_order_statuses` AS mag_order_status ON mag_order_status.magento_order_status = item_line_info.mag_order_status_raw
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_shipping_regions` AS shipping_region ON shipping_region.shipping_country = item_line_info.customer_country AND shipping_region.shipping_region = item_line_info.customer_region
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_shipping_countries` AS shipping_country ON shipping_country.shipping_country = item_line_info.customer_country
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_order_shipping_descriptions` AS order_shipping_descriptions
    ON item_line_info.order_shipping_description = order_shipping_descriptions.order_shipping_description
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_ship_methods` AS ship_methods
    ON item_line_info.ship_method = ship_methods.ship_method
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_calendar_dates` AS order_dates
    ON item_line_info.order_date = order_dates.date_id

  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_free_shipping_value_history` AS free_shipping_value
    ON channel.channel_or_gateway = free_shipping_value.channel_or_gateway
    AND (order_shipping_descriptions.is_express IS TRUE) = free_shipping_value.shipping_is_express
    AND (coalesce(shipping_region.geography_type, shipping_country.geography_type, 'Unknown') <> 'Domestic') = free_shipping_value.shipping_is_international
    AND item_line_info.order_timestamp BETWEEN free_shipping_value.valid_from AND free_shipping_value.valid_to
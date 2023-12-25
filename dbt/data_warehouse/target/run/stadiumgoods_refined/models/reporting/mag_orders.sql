

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_orders`
  
  
  OPTIONS()
  as (
    

WITH mag_orders AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_orders`

), order_status_labels AS (

  SELECT
      order_status
    , order_status_label
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_order_status`

), dsco_orders AS (

  SELECT
      sales_flat_order_id
    , dsco_order_id
, safe_cast(datetime(safe_cast(dsco_ship_late_date AS timestamp), 'Etc/UTC') AS datetime) AS dsco_ship_late_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_dsco_order`

), order_transactions AS (

  SELECT
      sales_flat_order_id
    , array_agg(DISTINCT transaction_id) AS transaction_ids
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_payment_transaction` AS sales_payment_transaction
  WHERE NOT EXISTS (
    SELECT transaction_id
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo`
    WHERE transaction_id = sales_payment_transaction.transaction_id
  )
  GROUP BY 1

), coupon_codes AS (

  SELECT
      mag_orders.sales_flat_order_id
    , string_agg(DISTINCT salesrule_coupon.coupon_code, ', ') AS coupon_codes_created
    , sum(salesrule.discount_amount) AS coupon_code_value_created
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__salesrule_coupon` AS salesrule_coupon
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__salesrule` AS salesrule
    ON salesrule_coupon.salesrule_id = salesrule.salesrule_id
  INNER JOIN mag_orders
    ON substr(salesrule_coupon.coupon_code,1,6) = mag_orders.last_six_digits_of_mag_order_id
  WHERE 


  regexp_contains(salesrule_coupon.coupon_code, r'(?i)[0-9]{6}RMA')


  GROUP BY 1

), required_status_check AS (

  SELECT
      mag_orders.sales_flat_order_id
    , CASE
        WHEN count( CASE
            WHEN (mag_orders.channel  = 'tmall' AND status_history.order_status ='cs_tmall')
			OR (mag_orders.channel  = 'amazon_payments' AND status_history.order_status = 'verified')
            THEN 1 END
        ) > 0
        THEN 'Active'
        ELSE 'Passive'
      END AS checkout_type
  FROM mag_orders
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_status_history` AS status_history
    ON mag_orders.sales_flat_order_id = status_history.sales_flat_order_id
  WHERE mag_orders.channel IN ('tmall','amazon_payments')
  GROUP BY 1

), email_channels AS (

  SELECT DISTINCT
    email_address AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_email_addresses`
  WHERE is_order_channel = TRUE

), external_orders AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_external_orders`
  WHERE sales_flat_order_id IS NOT NULL

), order_addresses AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_addresses`

), item_qty AS (

  SELECT
      sales_flat_order_id
    , sum(item_qty_ordered) AS total_item_qty
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_items`
  GROUP BY 1

), order_invoices AS (

  SELECT
      sales_flat_order_id
    , string_agg(DISTINCT mag_invoice_id, ', ') AS mag_invoice_id
    , sum(base_grand_total) AS invoice_total_amount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_invoice`
  GROUP BY 1

)

SELECT
    mag_orders.sales_flat_order_id AS mag_order_entity_id
  , mag_orders.state AS mag_order_state
  , mag_orders.status AS mag_order_status
  , mag_orders.coupon_code AS mag_order_coupon_code
  , mag_orders.protect_code AS mag_order_protect_code
  , mag_orders.shipping_description AS mag_order_shipping_description
  , mag_orders.store_id AS mag_order_store_id
  , mag_orders.customer_id AS mag_order_customer_id
  , mag_orders.base_currency_code AS mag_order_base_currency
  , mag_orders.base_discount_amount AS mag_order_base_discount_amount
  , mag_orders.base_discount_canceled AS mag_order_base_discount_canceled
  , mag_orders.base_discount_invoiced AS mag_order_base_discount_invoiced
  , mag_orders.base_discount_refunded AS mag_order_base_discount_refunded
  , mag_orders.base_grand_total AS mag_order_base_grand_total
  , mag_orders.base_shipping_amount AS mag_order_base_shipping_amount
  , mag_orders.base_shipping_canceled AS mag_order_base_shipping_canceled
  , mag_orders.base_shipping_invoiced AS mag_order_base_shipping_invoiced
  , mag_orders.base_shipping_refunded AS mag_order_base_shipping_refunded
  , mag_orders.base_shipping_tax_amount AS mag_order_base_shipping_tax_amount
  , mag_orders.base_shipping_tax_refunded AS mag_order_base_shipping_tax_refunded
  , mag_orders.base_subtotal AS mag_order_base_subtotal
  , mag_orders.base_subtotal_canceled AS mag_order_base_subtotal_canceled
  , mag_orders.base_subtotal_invoiced AS mag_order_base_subtotal_invoiced
  , mag_orders.base_subtotal_refunded AS mag_order_base_subtotal_refunded
  , mag_orders.base_tax_amount AS mag_order_base_tax_amount
  , mag_orders.base_tax_canceled AS mag_order_base_tax_canceled
  , mag_orders.base_tax_invoiced AS mag_order_base_tax_invoiced
  , mag_orders.base_tax_refunded AS mag_order_base_tax_refunded
  , mag_orders.base_to_global_rate AS mag_order_base_to_global_rate
  , mag_orders.base_to_order_rate AS mag_order_base_to_order_rate
  , mag_orders.base_total_canceled AS mag_order_base_total_canceled
  , mag_orders.base_total_invoiced AS mag_order_base_total_invoiced
  , mag_orders.base_total_offline_refunded AS mag_order_base_total_offline_refunded
  , mag_orders.base_total_online_refunded AS mag_order_base_total_online_refunded
  , mag_orders.base_total_paid AS mag_order_base_total_paid
  , mag_orders.base_total_refunded AS mag_order_base_total_refunded
  , mag_orders.store_to_base_rate AS mag_order_store_to_base_rate
  , mag_orders.store_to_order_rate AS mag_order_store_to_order_rate
  , CAST(mag_orders.customer_is_guest AS int64) AS mag_order_customer_is_guest
  , CAST(mag_orders.customer_note_notify AS int64) AS mag_order_customer_note_notify
  , mag_orders.billing_address_id AS mag_order_billing_address_id
  , mag_orders.customer_group_id AS mag_order_customer_group_id
  , CAST(mag_orders.is_edit_increment AS int64) AS mag_order_edit_increment
  , CAST(mag_orders.is_email_sent AS int64) AS mag_order_email_sent
  , mag_orders.quote_id AS mag_order_quote_id
  , mag_orders.shipping_address_id AS mag_order_shipping_address_id
  , mag_orders.base_adjustment_negative AS mag_order_base_adjustment_negative
  , mag_orders.base_adjustment_positive AS mag_order_base_adjustment_positive
  , mag_orders.base_shipping_discount_amount AS mag_order_base_shipping_discount_amount
  , mag_orders.base_subtotal_incl_tax AS mag_order_base_subtotal_incl_tax
  , mag_orders.base_total_due AS mag_order_base_total_due
  , mag_orders.weight AS mag_order_weight
  , mag_orders.mag_order_id AS mag_order_increment_id
  , mag_orders.applied_rule_ids AS mag_order_applied_rule_ids
  , mag_orders.customer_firstname AS mag_order_customer_firstname
  , mag_orders.customer_lastname AS mag_order_customer_lastname
  , mag_orders.customer_middlename AS mag_order_customer_middlename
  , mag_orders.customer_prefix AS mag_order_customer_prefix
  , mag_orders.customer_suffix AS mag_order_customer_suffix
  , mag_orders.discount_description AS mag_order_discount_description
  , mag_orders.hold_before_state AS mag_order_hold_before_state
  , mag_orders.hold_before_status AS mag_order_hold_before_status
  , mag_orders.order_currency_code AS mag_order_order_currency_code
  , mag_orders.original_increment_id AS mag_order_original_increment_id
  , mag_orders.relation_child_id AS mag_order_relation_child_id
  , mag_orders.relation_child_real_id AS mag_order_relation_child_real_id
  , mag_orders.relation_parent_id AS mag_order_relation_parent_id
  , mag_orders.relation_parent_real_id AS mag_order_relation_parent_real_id
  , mag_orders.remote_ip AS mag_order_remote_ip
  , mag_orders.shipping_method AS mag_order_shipping_method
  , mag_orders.store_name AS mag_order_store_name
  , mag_orders.x_forwarded_for AS mag_order_x_forwarded_for
  , mag_orders.customer_note AS mag_order_customer_note
  , mag_orders.total_item_count AS mag_order_total_item_count
  , mag_orders.customer_gender AS mag_order_customer_gender
  , mag_orders.base_shipping_incl_tax AS mag_order_base_shipping_incl_tax
  , mag_orders.coupon_rule_name AS mag_order_coupon_rule_name
  , mag_orders.base_credit_amount AS mag_order_base_credit_amount
  , mag_orders.base_credit_invoiced AS mag_order_base_credit_invoiced
  , mag_orders.base_credit_refunded AS mag_order_base_credit_refunded
  , mag_orders.base_credit_total_refunded AS mag_order_base_credit_total_refunded
  , mag_orders.snap_cards AS mag_order_snap_cards
  , mag_orders.base_snap_cards_amount AS mag_order_base_snap_cards_amount
  , mag_orders.mag_order_customer_email
  , mag_orders.mag_order_id
  , mag_orders.mag_order_created_at
  , mag_orders.mag_order_updated_at
  , mag_orders.order_creation_nyc
  , mag_orders.total_shipping_price
  , mag_orders.total_shipping_tax
  , mag_orders.total_shipping_discount
  , mag_orders.total_payment_amount
  , mag_orders.total_credit_amount
  , mag_orders.total_payment_refunded
  , mag_orders.total_credit_refunded
  , mag_orders.total_invoiced_amount AS order_total_invoiced_amount
  , mag_orders.customer_name
  , mag_orders.mag_x3_order_id
  , mag_orders.mag_x3_status
  , order_addresses.shipping_address_entity_id
  , order_addresses.shipping_address_parent_id
  , order_addresses.shipping_address_customer_address_id
  , order_addresses.shipping_address_region_id
  , order_addresses.shipping_address_customer_id
  , order_addresses.shipping_address_fax
  , order_addresses.shipping_address_region
  , order_addresses.shipping_address_postcode
  , order_addresses.shipping_address_lastname
  , order_addresses.shipping_address_street
  , order_addresses.shipping_address_city
  , order_addresses.shipping_address_email
  , order_addresses.shipping_address_telephone
  , order_addresses.shipping_address_country_id
  , order_addresses.shipping_address_firstname
  , order_addresses.shipping_address_prefix
  , order_addresses.shipping_address_middlename
  , order_addresses.shipping_address_suffix
  , order_addresses.shipping_address_company
  , order_addresses.billing_customer_id
  , order_addresses.billing_country_id
  , order_addresses.billing_city
  , order_addresses.clean_country
  , order_addresses.clean_telephone
  , order_addresses.clean_postcode
  , order_addresses.clean_lastname
  , order_addresses.clean_firstname
  , order_addresses.shipping_name
  , order_addresses.shipping_address
, SAFE_CAST(external_orders.created_at AS timestamp) AS external_order_created_at
, DATETIME(SAFE_CAST(external_orders.created_at AS timestamp), 'America/New_York') AS external_order_creation_nyc
  , order_status_labels.order_status_label
  , dsco_orders.dsco_order_id
  , dsco_orders.dsco_ship_late_date
  , coupon_codes.coupon_codes_created
  , coupon_codes.coupon_code_value_created
  , coalesce(mag_orders.external_order_id, external_orders.external_order_id) AS mag_external_order_id
  , coalesce(
        email_channels.order_channel
      , mag_orders.order_channel
      , external_orders.order_channel
      , mag_orders.channel
    ) AS mag_order_channel
  , coalesce(
        mag_orders.clean_email
      , order_addresses.clean_email
    ) AS clean_email
  , coalesce(required_status_check.checkout_type, 'Active') AS checkout_type
  , coalesce(
        order_transactions.transaction_ids
      , ARRAY[coalesce(mag_orders.external_order_id, external_orders.external_order_id, mag_orders.mag_order_id)]
    ) AS order_transaction_ids
  , coalesce(mag_orders.total_qty_ordered, item_qty.total_item_qty) AS total_qty
  , order_invoices.mag_invoice_id
  , order_invoices.invoice_total_amount
  , current_timestamp AS rebuild_timestamp
FROM mag_orders
LEFT JOIN order_status_labels
  ON mag_orders.status = order_status_labels.order_status
LEFT JOIN dsco_orders
  ON mag_orders.sales_flat_order_id = dsco_orders.sales_flat_order_id
LEFT JOIN order_transactions
  ON mag_orders.sales_flat_order_id = order_transactions.sales_flat_order_id
LEFT JOIN coupon_codes
  ON mag_orders.sales_flat_order_id = coupon_codes.sales_flat_order_id
LEFT JOIN required_status_check
  ON mag_orders.sales_flat_order_id = required_status_check.sales_flat_order_id
LEFT JOIN email_channels
  ON mag_orders.mag_order_customer_email = email_channels.order_channel
LEFT JOIN external_orders
  ON mag_orders.sales_flat_order_id = external_orders.sales_flat_order_id
LEFT JOIN order_addresses
  ON mag_orders.sales_flat_order_id = order_addresses.sales_flat_order_id
LEFT JOIN item_qty
  ON mag_orders.sales_flat_order_id = item_qty.sales_flat_order_id
LEFT JOIN order_invoices
  ON mag_orders.sales_flat_order_id = order_invoices.sales_flat_order_id
  );
    
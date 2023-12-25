

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_orders`
  
  
  OPTIONS()
  as (
    SELECT
    ether_orders.`ether_oms_order_id`,
  ether_orders.`ether_order_number`,
  ether_orders.`order_type`,
  ether_orders.`order_date`,
  ether_orders.`customer_email`,
  ether_orders.`ecommerce_order_status`,
  ether_orders.`sales_channel_order_id`,
  ether_orders.`allocation_status`,
  ether_orders.`delivery_status`,
  ether_orders.`hold_status`,
  ether_orders.`shipping_name`,
  ether_orders.`shipping_phone`,
  ether_orders.`shipping_address_line_1`,
  ether_orders.`shipping_address_line_2`,
  ether_orders.`shipping_city`,
  ether_orders.`shipping_region_name`,
  ether_orders.`shipping_region_code`,
  ether_orders.`shipping_region`,
  ether_orders.`shipping_postcode`,
  ether_orders.`shipping_country_name`,
  ether_orders.`shipping_country_code`,
  ether_orders.`shipping_country`,
  ether_orders.`billing_name`,
  ether_orders.`billing_address_line_1`,
  ether_orders.`billing_address_line_2`,
  ether_orders.`billing_city`,
  ether_orders.`billing_region_name`,
  ether_orders.`billing_postcode`,
  ether_orders.`billing_country_name`,
  ether_orders.`created_at`,
  ether_orders.`updated_at`,
  ether_orders.`order_ship_date`,
  ether_orders.`order_status`,
  ether_orders.`total_qty`,
  ether_orders.`shipped_qty`,
  ether_orders.`closed_qty`,
  ether_orders.`shortage_qty`,
  ether_orders.`sla_fulfillment_deadline`,
  ether_orders.`locked_for_x3_update_at`,
  ether_orders.`ecommerce_customer_id`,
  ether_orders.`lock_version`,
  ether_orders.`is_exception`,
  ether_orders.`is_vip`,
  ether_orders.`reallocation_is_escalated`,
  ether_orders.`locked_for_fulfillment_at`,
  ether_orders.`is_hazardous`,
  ether_orders.`fulfillment_blocked_at`,
  ether_orders.`active_qty`,
  ether_orders.`billing_region_code`,
  ether_orders.`billing_country_code`,
  ether_orders.`shipping_price_base_amount`,
  ether_orders.`shipping_tax_base_amount`,
  ether_orders.`shipping_discount_base_amount`,
  ether_orders.`total_payment_base_amount`,
  ether_orders.`total_credit_base_amount`,
  ether_orders.`total_refunded_base_amount`,
  ether_orders.`credit_refunded_base_amount`,
  ether_orders.`total_invoiced_base_amount`,
  ether_orders.`ecommerce_shipping_method`,
  ether_orders.`fulfillment_channel`,
  ether_orders.`source_updated_at`,
  ether_orders.`ecommerce_discount_code`,
  ether_orders.`_synched_from_source_at`,
  ether_orders.`sent_to_farfetch_at`,
  ether_orders.`tax_source`,
  ether_orders.`tax_adjustment_base_amount`,
  ether_orders.`discount_adjustment_base_amount`,
  ether_orders.`base_currency`,
  ether_orders.`shipping_adjustment_base_amount`,
  ether_orders.`_raw_placed_at`
  , nullif(trim(substr(
    concat(
    
      coalesce(ether_orders.shipping_name|| chr(10) , '')
    
      , coalesce(ether_orders.shipping_address_line_1|| chr(10) , '')
    
      , coalesce(ether_orders.shipping_address_line_2|| chr(10) , '')
    
      , coalesce(substr(
    concat(
    
      coalesce(ether_orders.shipping_city|| ' ' , '')
    
      , coalesce(ether_orders.shipping_region|| ' ' , '')
    
      , coalesce(ether_orders.shipping_postcode|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(ether_orders.shipping_city|| ' ' , '')
    
      , coalesce(ether_orders.shipping_region|| ' ' , '')
    
      , coalesce(ether_orders.shipping_postcode|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(ether_orders.shipping_country|| chr(10) , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(ether_orders.shipping_name|| chr(10) , '')
    
      , coalesce(ether_orders.shipping_address_line_1|| chr(10) , '')
    
      , coalesce(ether_orders.shipping_address_line_2|| chr(10) , '')
    
      , coalesce(substr(
    concat(
    
      coalesce(ether_orders.shipping_city|| ' ' , '')
    
      , coalesce(ether_orders.shipping_region|| ' ' , '')
    
      , coalesce(ether_orders.shipping_postcode|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(ether_orders.shipping_city|| ' ' , '')
    
      , coalesce(ether_orders.shipping_region|| ' ' , '')
    
      , coalesce(ether_orders.shipping_postcode|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)|| chr(10) , '')
    
      , coalesce(ether_orders.shipping_country|| chr(10) , '')
    
  )) - length(chr(10))
      , 0
    )
)), '') AS shipping_address
  , ether_orders.ecommerce_sales_channel
  , sales_channels.sales_channel_code
  , coalesce(ether_orders.ecommerce_sales_channel, sales_channels.sales_channel_code) AS order_channel
  , ether_orders.carrier_code
  , delivery_methods.delivery_method_code
  , nullif(trim(substr(
    concat(
    
      coalesce(ether_orders.carrier_code|| ' ' , '')
    
      , coalesce(delivery_methods.delivery_method_code|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(ether_orders.carrier_code|| ' ' , '')
    
      , coalesce(delivery_methods.delivery_method_code|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)), '') AS shipping_description
  , ether_orders.created_by_employee_id
  , employees.employee_name AS created_by_employee_name
  , ether_orders.ecommerce_order_id
  , ether_orders.ecommerce_order_prefix
  , ether_orders.ecommerce_order_regex
  , coalesce(raw_magento_orders.mag_order_id, prefix_magento_orders.mag_order_id, regex_magento_orders.mag_order_id) AS mag_order_id
  , CASE
      WHEN raw_magento_orders.mag_order_id IS NOT NULL THEN cast('Standard' AS string)
      WHEN coalesce(raw_magento_orders.mag_order_id, prefix_magento_orders.mag_order_id, regex_magento_orders.mag_order_id) IS NOT NULL THEN cast('Non-Standard' AS string)
      ELSE cast('None' AS string)
    END AS mag_order_id_type
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_orders` AS ether_orders
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_sales_channels` AS sales_channels
  ON ether_orders.ether_oms_sales_channel_id = sales_channels.ether_oms_sales_channel_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_delivery_methods` AS delivery_methods
  ON ether_orders.ether_oms_delivery_method_id = delivery_methods.ether_oms_delivery_method_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS employees
  ON ether_orders.created_by_employee_id = employees.employee_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS raw_magento_orders
  ON ether_orders.ecommerce_order_id = raw_magento_orders.mag_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS prefix_magento_orders
  ON ether_orders.ecommerce_order_prefix = prefix_magento_orders.mag_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS regex_magento_orders
  ON ether_orders.ecommerce_order_regex = regex_magento_orders.mag_order_id
  );
    
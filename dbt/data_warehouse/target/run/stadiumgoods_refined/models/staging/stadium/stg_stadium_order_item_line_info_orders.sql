

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info_orders`
  
  
  OPTIONS()
  as (
    SELECT
/* Order-line identifiers */
    item_lines.stadium_order_id
  , item_lines.mag_order_id
  , item_lines.order_item_id
  , item_lines.ether_order_number
  , item_lines.ether_order_item_line_number
  , item_lines.x3_order_id
  , item_lines.x3_order_line
  , item_lines.data_source
  , item_lines.dsco_item_id
  , item_lines.dropship_source
  , item_lines.dropship_order_source_item_line

/* Magento/Ether/X3 attributes */
  , coalesce(
        mag_orders.total_qty
      , ether_orders.total_qty
      , x3_orders.total_qty
    ) AS order_total_qty
  , coalesce(
        mag_orders.mag_order_channel
      , ether_orders.order_channel
      , x3_orders.order_channel
    ) AS order_channel
  , coalesce(
        mag_orders.mag_order_status
      , ether_orders.ecommerce_order_status
      , x3_orders.mag_order_status
    ) AS mag_order_status_raw
  , coalesce(
      mag_orders.mag_order_shipping_description
    , ether_orders.shipping_description
    , x3_orders.order_shipping_description
  ) AS order_shipping_description
  , coalesce(
      mag_orders.shipping_address_country_id
    , ether_orders.shipping_country
    , x3_orders.shipping_country
  ) AS shipping_country
  , coalesce(
      mag_orders.shipping_address_region
    , ether_orders.shipping_region
    , x3_orders.shipping_region
  ) AS shipping_region
  , coalesce(
        mag_orders.shipping_address_postcode
      , ether_orders.shipping_postcode
      , x3_orders.shipping_postcode
    ) AS shipping_postcode
  , coalesce(
        mag_orders.shipping_address
      , ether_orders.shipping_address
      , x3_orders.shipping_address
    ) AS shipping_address
  , coalesce(
      mag_orders.mag_order_customer_email
    , ether_orders.customer_email
    , x3_orders.customer_email
  ) AS customer_email
  , coalesce(
        cast(mag_orders.mag_order_customer_id AS string)
      , ether_orders.ecommerce_customer_id
      , x3_orders.customer_id
    ) AS customer_id
  , initcap(trim(coalesce(
        mag_orders.shipping_address_city
      , ether_orders.shipping_city
      , x3_orders.shipping_city
    ))) AS shipping_city
  , 
  CAST(regexp_extract(coalesce(
      mag_orders.mag_order_customer_email
    , ether_orders.customer_email
    , x3_orders.customer_email
  ), 
  r'@(.*)$'
) AS string)
 AS email_domain
  , nullif(
     least(
      coalesce(x3_orders.order_date, CAST('9999-12-31' AS date))
      ,coalesce(ether_orders.order_date, CAST('9999-12-31' AS date))
      ,coalesce(
    safe_cast(nullif(
     least(
      coalesce(mag_orders.external_order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(nullif(
     least(
      coalesce(mag_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(safe_cast(datetime(safe_cast(ether_orders.created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ), CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) as date)
, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS order_date
  , SAFE_CAST(TIMESTAMP(SAFE_CAST(nullif(
     least(
      coalesce(mag_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(safe_cast(datetime(safe_cast(ether_orders.created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS datetime), 
  r'America/New_York'
) AS timestamp) AS order_timestamp
  , nullif(
     least(
      coalesce(mag_orders.external_order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(nullif(
     least(
      coalesce(mag_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(safe_cast(datetime(safe_cast(ether_orders.created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ), CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS order_creation_nyc
  , cast(nullif(
     least(
      coalesce(mag_orders.external_order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(nullif(
     least(
      coalesce(mag_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(safe_cast(datetime(safe_cast(ether_orders.created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ), CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS time) AS order_time_nyc
  , coalesce(
  	    CASE
          WHEN coalesce(
      mag_orders.mag_order_shipping_description
    , ether_orders.shipping_description
    , x3_orders.order_shipping_description
  ) = 'eBay Shipping - InternationalPriorityShipping'
          THEN mag_orders.clean_country
        END
  	  , coalesce(
      mag_orders.shipping_address_country_id
    , ether_orders.shipping_country
    , x3_orders.shipping_country
  )
    ) AS customer_country
  , CASE
  	  WHEN coalesce(
      mag_orders.mag_order_shipping_description
    , ether_orders.shipping_description
    , x3_orders.order_shipping_description
  ) = 'eBay Shipping - InternationalPriorityShipping'
  	  THEN NULL
  	  ELSE coalesce(
      mag_orders.shipping_address_region
    , ether_orders.shipping_region
    , x3_orders.shipping_region
  )
    END AS customer_region

/* Magento-only attributes */
  , mag_orders.billing_country_id AS billing_country
  , mag_orders.billing_city AS billing_city
  , coalesce(mag_orders.checkout_type, 'Active') AS checkout_type
  , coalesce(mag_orders.order_transaction_ids, ARRAY[item_lines.stadium_order_id]) AS order_transaction_ids
  , coalesce(mag_orders.clean_country || mag_orders.clean_telephone) AS customer_country_and_telephone
  , coalesce(mag_orders.clean_country || mag_orders.clean_postcode || mag_orders.clean_lastname) AS customer_country_and_postcode_and_lastname
  , coalesce(mag_orders.clean_firstname || mag_orders.clean_lastname) AS customer_firstname_and_lastname
  , nullif(mag_orders.mag_order_coupon_code, '') AS coupon_code
  , mag_orders.total_qty AS mag_order_total_qty
  , mag_orders.total_payment_amount AS mag_order_payment
  , mag_orders.total_credit_amount AS mag_order_store_credit_applied
  , mag_orders.total_payment_refunded AS mag_order_refunded
  , mag_orders.total_credit_refunded AS mag_order_store_credit
  , mag_orders.mag_external_order_id AS external_order_id
  , mag_orders.shipping_name AS shipping_name
  , mag_orders.order_creation_nyc AS mag_order_creation_nyc
  , mag_orders.mag_order_entity_id
  , mag_orders.external_order_creation_nyc
  , mag_orders.mag_order_channel
  , mag_orders.customer_name
  , mag_orders.dsco_order_id AS mag_dsco_order_id
  , mag_orders.dsco_ship_late_date AS mag_dsco_ship_late_date
  , ('https://www.stadiumgoods.com/index.php/orderhq/sales_order/view/order_id/' || CAST(mag_orders.mag_order_entity_id AS string)) AS magento_order_link

/* FPS/Magento/Ether attributes */
  , coalesce(
        fps_orders.base_currency
      , mag_orders.mag_order_base_currency
      , ether_orders.base_currency
      , 'USD'
    ) AS order_base_currency

/* Ether/X3 attributes */
  , coalesce(x3_orders.cash_payment, FALSE) AS cash_payment --not in Ether
  , coalesce(ether_orders.ecommerce_order_id, x3_orders.ymagord) AS x3_ymagord
  , nullif(
     least(
      coalesce(safe_cast(datetime(safe_cast(ether_orders.created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS x3_order_creation_nyc
  , nullif(
     least(
      coalesce(ether_orders.order_date, CAST('9999-12-31' AS date))
      ,coalesce(x3_orders.order_date, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS x3_order_date
  , coalesce(ether_orders.sales_channel_code, x3_orders.order_channel) AS x3_order_channel
  , coalesce(ether_orders.order_status = 'closed', x3_orders.closes_line) AS x3_order_status_closes_line
  , coalesce(ether_orders.total_qty, x3_orders.total_qty) AS x3_order_total_qty
  , coalesce(ether_orders.total_payment_base_amount, x3_orders.order_total) AS x3_order_total
  , coalesce(ether_orders.order_status, x3_orders.x3_order_status) AS x3_order_status

/* X3-only attributes */
  , x3_orders.delivery_status
  , x3_orders.last_invoice_id
  , x3_orders.order_invoice_status
  , x3_orders.last_invoice_date
  , x3_orders.last_invoice_status
  , x3_orders.credit_status

/* google analytics attr */
  , ga.channel_grouping AS ga_channel_grouping
  , ga.medium AS acquisition_medium
  , ga.source AS acquisition_source
  , ga.campaign AS acquisition_campaign
  , ga.device_category AS acquisition_device_category

/* linkshare attr */
  , coalesce(linkshare.total_commission, 0) AS order_total_affiliate_commission
  , coalesce(linkshare.total_commission, 0) AS linkshare_total_commission
  , linkshare.offer_name AS affiliate_offer
  , linkshare.publisher_name AS affiliate_publisher
  , linkshare.publisher_group_name AS affiliate_publisher_group

FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_lines` AS item_lines
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_orders` AS ether_orders
  ON item_lines.ether_order_number = ether_orders.ether_order_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_orders` AS mag_orders
  ON item_lines.mag_order_id = mag_orders.mag_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_orders` AS x3_orders
  ON item_lines.x3_order_id = x3_orders.x3_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_linkshare_commission_current` AS linkshare
  ON item_lines.mag_order_id = linkshare.mag_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`ga_transactions_current` AS ga
  ON item_lines.mag_order_id = ga.mag_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` AS fps_orders
  ON item_lines.mag_order_id = fps_orders.mag_order_id
  );
    
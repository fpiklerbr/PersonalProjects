

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order`
  OPTIONS()
  as 

    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_order_id` AS string)), '') AS string) END as string)
 AS `_magento_farfetch_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`point_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`point_code` AS string)), '') AS string) END as string)
 AS `_magento_fps_stock_point_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_code` AS string)), '') AS string) END as string)
 AS `_magento_promo_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_order_status` AS string)), '') AS string) END as string)
 AS `farfetch_order_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_order_status_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_order_status_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_status_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stockpoint_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stockpoint_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_stockpoint_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) END as string)
 AS `_magento_fps_tenant_id`
  , CAST(NULL AS string) AS `_magento_base_currency`
  , CAST(NULL AS numeric) AS `amount_paid`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_deprecated_original_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_deprecated_original_price` AS string)), '') AS string) END as numeric)
 AS `_deprecated_original_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_deprecated_original_price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_deprecated_original_price_currency` AS string)), '') AS string) END as string)
 AS `_deprecated_original_price_currency`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_magento_created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`raw_order_data` AS string)), '') AS string), 
  '\\u'
, 
  '\\\\u'
) IN ('Array','nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`raw_order_data` AS string)), '') AS string), 
  '\\u'
, 
  '\\\\u'
) END as string)
 AS `orders_headers_api_response`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`sent_no_stock_email_notication` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sent_no_stock_email_notication` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`sent_no_stock_email_notication` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sent_no_stock_email_notication` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `has_sent_no_stock_email_notication`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sent_no_stock_email_on` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sent_no_stock_email_on` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sent_no_stock_email_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_cancellation_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_cancellation_reason` AS string)), '') AS string) END as string)
 AS `sg_cancellation_reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_cancellation_error_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_cancellation_error_message` AS string)), '') AS string) END as string)
 AS `sg_cancellation_error_message`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_cancellation_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_cancellation_reason` AS string)), '') AS string) END as string)
 AS `ff_cancellation_reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at_step` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at_step` AS string)), '') AS string) END as string)
 AS `created_at_step`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_documents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_documents` AS string)), '') AS string) END as string)
 AS `shipping_documents`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`raw_order_data_management_api` AS string)), '') AS string), 
  '\\u'
, 
  '\\\\u'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`raw_order_data_management_api` AS string)), '') AS string), 
  '\\u'
, 
  '\\\\u'
) END as string)
 AS `order_management_api_response`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_info` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_info` AS string)), '') AS string) END as string)
 AS `shipping_info`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `currency_code` AS `_raw_currency_code`
  , `total` AS `_raw_total`
  , `total_without_shipping` AS `_raw_total_without_shipping`
  , `shipping_value` AS `_raw_shipping_value`
  , `tax_value` AS `_raw_tax_value`
  , `vat_included` AS `_raw_vat_included`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`

WHERE 1=1
AND entity_id NOT IN ('100570')
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    (JSON_EXTRACT_SCALAR(order_management_api_response, '$.values.currencyCode'
  ))
 AS `_order_management_base_currency`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.OrderCode'
  ))
 AS `_orders_headers_fps_order_code`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.OrderId'
  ))
 AS `_orders_headers_farfetch_order_id`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.PointCode'
  ))
 AS `_orders_headers_fps_stock_point_code`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.PointId'
  ))
 AS `_orders_headers_fps_stock_point_id`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.TenantId'
  ))
 AS `_orders_headers_fps_tenant_id`
  , 
    
    safe_cast(JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.DateCreated'
  ) as timestamp)
 AS `_orders_headers_created_at`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.PromoCode'
  ))
 AS `_orders_headers_promo_code`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.Shipping'
  ))
 AS `_orders_headers_shipping_price_base_amount`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.ShipTaxValue'
  ))
 AS `_orders_headers_shipping_tax_base_amount`
  , 
    
    safe_cast(
    safe_cast(JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.CustomerCountryId'
  ) as float64)
 as int64)
 AS `farfetch_country_id`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.CustomerEmail'
  ))
 AS `customer_email`
  , 
    (JSON_EXTRACT_SCALAR(orders_headers_api_response, '$.CustomerCountry'
  ))
 AS `farfetch_country_name`
  , 
    (JSON_EXTRACT_SCALAR(order_management_api_response, '$.orderId'
  ))
 AS `_order_management_fps_order_code`
  , 
    (JSON_EXTRACT_SCALAR(order_management_api_response, '$.id'
  ))
 AS `_order_management_fps_order_id`
  , 
    (JSON_EXTRACT_SCALAR(order_management_api_response, '$.stockPointCode'
  ))
 AS `_order_management_fps_stock_point_id`
  , 
    (JSON_EXTRACT_SCALAR(order_management_api_response, '$.tenantId'
  ))
 AS `_order_management_fps_tenant_id`
  , 
    
    safe_cast(JSON_EXTRACT_SCALAR(order_management_api_response, '$.createdDate'
  ) as timestamp)
 AS `_order_management_created_at`
FROM layer_0
WHERE 1=1
                     ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(_order_management_base_currency, _magento_base_currency) as string)
 AS `base_currency`
  , 
    safe_cast(coalesce(_order_management_fps_order_code, _orders_headers_fps_order_code) as string)
 AS `fps_order_code`
  , 
    safe_cast(coalesce(
    _order_management_fps_order_id
  , _orders_headers_fps_stock_point_code || _orders_headers_farfetch_order_id
  , _magento_fps_stock_point_code || _magento_farfetch_order_id
) as string)
 AS `fps_order_id`
  , 
    safe_cast(coalesce(
    substr(_order_management_fps_order_id, 4)
  , _orders_headers_farfetch_order_id
  , _magento_farfetch_order_id
) as string)
 AS `farfetch_order_id`
  , 
    safe_cast(coalesce(
    left(_order_management_fps_order_id, 3)
  , _orders_headers_fps_stock_point_code
  , _magento_fps_stock_point_code
) as string)
 AS `fps_stock_point_code`
  , 
    safe_cast(coalesce(_order_management_fps_stock_point_id, _orders_headers_fps_stock_point_id) as string)
 AS `fps_stock_point_id`
  , 
    safe_cast(coalesce(_orders_headers_fps_tenant_id, _order_management_fps_tenant_id, _magento_fps_tenant_id) as string)
 AS `fps_tenant_id`
  , 
    safe_cast(coalesce(_order_management_created_at, _orders_headers_created_at, _magento_created_at) as timestamp)
 AS `farfetch_order_created_at`
  , 
    safe_cast(coalesce(_orders_headers_promo_code, _magento_promo_code) as string)
 AS `promo_code`
  , 
    safe_cast(nullif(_orders_headers_shipping_price_base_amount, '[]') as numeric)
 AS `order_shipping_price_base_amount`
  , 
    safe_cast(nullif(_orders_headers_shipping_tax_base_amount, '[]') as numeric)
 AS `order_shipping_tax_base_amount`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `sg_farfetch_order_id` AS `sg_farfetch_order_id`
  , `_magento_farfetch_order_id` AS `_magento_farfetch_order_id`
  , `_magento_fps_stock_point_code` AS `_magento_fps_stock_point_code`
  , `_magento_promo_code` AS `_magento_promo_code`
  , `farfetch_order_status` AS `farfetch_order_status`
  , `farfetch_order_status_id` AS `farfetch_order_status_id`
  , `sales_flat_order_id` AS `sales_flat_order_id`
  , `sg_farfetch_stockpoint_id` AS `sg_farfetch_stockpoint_id`
  , `_magento_fps_tenant_id` AS `_magento_fps_tenant_id`
  , `_magento_base_currency` AS `_magento_base_currency`
  , `_order_management_base_currency` AS `_order_management_base_currency`
  , `base_currency` AS `base_currency`
  , `amount_paid` AS `amount_paid`
  , `_magento_created_at` AS `_magento_created_at`
  , `updated_at` AS `updated_at`
  , `orders_headers_api_response` AS `orders_headers_api_response`
  , `has_sent_no_stock_email_notication` AS `has_sent_no_stock_email_notication`
  , `sent_no_stock_email_at` AS `sent_no_stock_email_at`
  , `sg_cancellation_reason` AS `sg_cancellation_reason`
  , `sg_cancellation_error_message` AS `sg_cancellation_error_message`
  , `ff_cancellation_reason` AS `ff_cancellation_reason`
  , `created_at_step` AS `created_at_step`
  , `shipping_documents` AS `shipping_documents`
  , `order_management_api_response` AS `order_management_api_response`
  , `shipping_info` AS `shipping_info`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_orders_headers_fps_order_code` AS `_orders_headers_fps_order_code`
  , `_orders_headers_farfetch_order_id` AS `_orders_headers_farfetch_order_id`
  , `_orders_headers_fps_stock_point_code` AS `_orders_headers_fps_stock_point_code`
  , `_orders_headers_fps_stock_point_id` AS `_orders_headers_fps_stock_point_id`
  , `_orders_headers_fps_tenant_id` AS `_orders_headers_fps_tenant_id`
  , `_orders_headers_created_at` AS `_orders_headers_created_at`
  , `_orders_headers_promo_code` AS `_orders_headers_promo_code`
  , `_orders_headers_shipping_price_base_amount` AS `_orders_headers_shipping_price_base_amount`
  , `_orders_headers_shipping_tax_base_amount` AS `_orders_headers_shipping_tax_base_amount`
  , `farfetch_country_id` AS `farfetch_country_id`
  , `customer_email` AS `customer_email`
  , `farfetch_country_name` AS `farfetch_country_name`
  , `_order_management_fps_order_code` AS `_order_management_fps_order_code`
  , `_order_management_fps_order_id` AS `_order_management_fps_order_id`
  , `_order_management_fps_stock_point_id` AS `_order_management_fps_stock_point_id`
  , `_order_management_fps_tenant_id` AS `_order_management_fps_tenant_id`
  , `_order_management_created_at` AS `_order_management_created_at`
  , `fps_order_code` AS `fps_order_code`
  , `fps_order_id` AS `fps_order_id`
  , `farfetch_order_id` AS `farfetch_order_id`
  , `fps_stock_point_code` AS `fps_stock_point_code`
  , `fps_stock_point_id` AS `fps_stock_point_id`
  , `fps_tenant_id` AS `fps_tenant_id`
  , `farfetch_order_created_at` AS `farfetch_order_created_at`
  , `promo_code` AS `promo_code`
  , `order_shipping_price_base_amount` AS `order_shipping_price_base_amount`
  , `order_shipping_tax_base_amount` AS `order_shipping_tax_base_amount`
  , `_raw_currency_code` AS `_raw_currency_code`
  , `_raw_total` AS `_raw_total`
  , `_raw_total_without_shipping` AS `_raw_total_without_shipping`
  , `_raw_shipping_value` AS `_raw_shipping_value`
  , `_raw_tax_value` AS `_raw_tax_value`
  , `_raw_vat_included` AS `_raw_vat_included`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final ;


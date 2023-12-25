WITH magento_shipping_addresses AS (

  SELECT
      sg_farfetch_order_id
    , string_agg(DISTINCT farfetch_country_code, ', ') AS farfetch_country_code
    , string_agg(DISTINCT customer_email, ', ') AS customer_email
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order_address` AS sg_farfetch_order_address
  WHERE sg_farfetch_order_address.address_type = 'shipping'
  GROUP BY 1

), final AS (

  SELECT
      sg_farfetch_order.sg_farfetch_order_id
    , sg_farfetch_order.sg_farfetch_stockpoint_id
    , sg_farfetch_order.sales_flat_order_id
    , sg_farfetch_order.fps_tenant_id
    , sg_farfetch_order.farfetch_order_id
    , coalesce(sg_farfetch_order.fps_stock_point_id, sg_farfetch_stockpoint.fps_stock_point_id) AS fps_stock_point_id
    , sg_farfetch_order.farfetch_order_status_id
  	, sales_flat_order.mag_order_id
    , sg_farfetch_order.farfetch_order_created_at
    , sg_farfetch_order.order_shipping_price_base_amount
    , sales_flat_order.base_shipping_amount AS magento_order_shipping_price_base_amount
    , sg_farfetch_order.order_shipping_tax_base_amount
    , sales_flat_order.base_shipping_tax_amount AS magento_order_shipping_tax_base_amount
    , sg_farfetch_order.updated_at AS file_time
    , sg_farfetch_order.promo_code
    , sg_farfetch_order.fps_order_code
    , coalesce(sg_farfetch_order.customer_email, magento_shipping_addresses.customer_email) AS customer_email
    , coalesce(sg_farfetch_order.farfetch_country_id, sg_farfetch_country.farfetch_country_id) AS customer_country_id
    , magento_shipping_addresses.farfetch_country_code
    , coalesce(sg_farfetch_order.farfetch_country_name, sg_farfetch_country.farfetch_country_name) AS customer_country
    , coalesce(sg_farfetch_order.fps_stock_point_code, fps_stock_points.fps_stock_point_code) AS fps_stock_point_code
    , coalesce(
          sg_farfetch_order.fps_order_id
        , sales_flat_order.external_order_id
        , coalesce(sg_farfetch_order.fps_stock_point_code, fps_stock_points.fps_stock_point_code) || sg_farfetch_order.farfetch_order_id
      ) AS fps_order_id
    , sg_farfetch_order.base_currency
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order` AS sg_farfetch_order
  LEFT JOIN magento_shipping_addresses
    ON sg_farfetch_order.sg_farfetch_order_id = magento_shipping_addresses.sg_farfetch_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_country` AS sg_farfetch_country
    ON magento_shipping_addresses.farfetch_country_code = sg_farfetch_country.farfetch_country_code
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_stockpoint` AS sg_farfetch_stockpoint
    ON sg_farfetch_order.sg_farfetch_stockpoint_id = sg_farfetch_stockpoint.sg_farfetch_stockpoint_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sales_flat_order
    ON sg_farfetch_order.sales_flat_order_id = sales_flat_order.sales_flat_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_stock_points` AS fps_stock_points
    ON coalesce(sg_farfetch_order.fps_stock_point_id, sg_farfetch_stockpoint.fps_stock_point_id) = fps_stock_points.fps_stock_point_id

)

SELECT * FROM final
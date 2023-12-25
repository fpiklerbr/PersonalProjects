
   
  SELECT customer.unique_email
    , SAFE_CAST(SAFE_CAST(coalesce(customer.first_order_creation_nyc, finance_lines.order_creation_nyc) AS datetime) AS date) AS  acquisition_date
    , coalesce(customer.first_order_id, finance_lines.stadium_order_id) acquisition_order
    , coalesce(customer.acquisition_channel, 'Anonymous') acquisition_channel
    , coalesce(customer.default_channel_grouping, 'Anonymous') default_channel_grouping
    , finance_lines.stadium_order_id
    , SAFE_CAST(SAFE_CAST(finance_lines.order_creation_nyc AS datetime) AS date) AS order_date
    , finance_lines.simple_sku
    , finance_lines.product_sku
    , finance_lines.variant_size
    , finance_lines.serial_source
    , finance_lines.order_sku_size_source_line
    , finance_lines.gtv_total
    , gtv_item_discounts + gtv_shipping_discounts promo_gtv
    , finance_lines.marketing_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` finance_lines
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_customer_acquisition` customer USING (unique_email)
  WHERE finance_lines.sales_channel IN ('SG App', 'SG Web', 'FPS DTC')
    AND finance_lines.channel_or_gateway <> 'Beyond'
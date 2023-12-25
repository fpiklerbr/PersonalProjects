
   
SELECT coalesce(customer.unique_email, finance_lines.unique_email) unique_email
    , SAFE_CAST(SAFE_CAST(coalesce(customer.first_order_creation_nyc, min(finance_lines.order_creation_nyc) OVER (PARTITION BY coalesce(customer.unique_email, finance_lines.unique_email, finance_lines.stadium_order_id))) AS datetime) AS date) AS acquisition_date
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
   , finance_lines.gtv_total revenue
   , gtv_item_discounts + gtv_shipping_discounts promo_gtv
   , finance_lines.coupon_code
   , finance_lines.sales_channel
   , finance_lines.business_unit
   , finance_lines.channel_or_gateway
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` finance_lines
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_customer_acquisition` customer USING (unique_email)
WHERE finance_lines.business_unit IN ('DTC', 'Omnichannel')
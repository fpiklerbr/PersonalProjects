

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_sell_thru`
  
  
  OPTIONS()
  as (
    

WITH sales_stock AS (

  SELECT
    simple_sku
  , serial_relationship inventory_relationship
  , serial_inventory inventory_type
  , serial_number
  , original_intake_date
  , first_available_date
  , last_available_date
  , price serial_price
  , serial_cost inventory_cost
  , warehouse
  , yseristatus_consignment_status
  , mag_status
  , conditions
  , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS  order_date
  , CAST(NULL AS int64 ) AS gtv_qty
  , CAST(NULL AS int64 ) AS gmv_qty
  , CAST(NULL AS float64) AS  item_value
  , CAST(NULL AS float64) AS  item_paid
  , CAST(NULL AS float64) AS  item_discount
  , CAST(NULL AS string ) AS business_unit
  , CAST(NULL AS string ) AS sales_channel
  , CAST(NULL AS string ) AS channel_or_gateway
  , CAST(NULL AS string ) AS geography_type
  , CAST(NULL AS string ) AS geography
  , consignor_id
  , vendor_number
  , CAST(NULL AS float64) as  cogs
  , seller_id inventory_seller
  , parent_company
  , CAST(NULL AS string ) as  reporting_status
  , CAST(NULL AS float64) as  gmv_total
  , CAST(NULL AS float64) as  gross_profit
  , CAST(NULL AS float64) as  gtv_total
  , CAST(NULL AS float64) as  gtv_paid
  , CAST(NULL AS float64) as  order_serial_price
  , CAST(NULL AS float64) as  net_sales
  , CAST(NULL AS float64) as  consignor_payouts_payable
  , CAST(NULL AS float64) as  consignor_payouts_returned
  , CAST(NULL AS float64) as  consignor_payouts_total
  , CAST(NULL AS date ) as reporting_date
  , CAST(NULL as float64) as revenue_commissions
  , CAST(NULL as float64) as cogs_total
  , CAST(NULL as string ) as private_customer_status
  , CAST(NULL as string ) as private_customer_stylist
  , CAST(NULL AS string ) as unique_email 
  , CAST(NULL AS boolean) as serial_order_match
  , CAST(NULL AS string ) as coupon_code
  , CAST(NULL AS float64) as gtv_item_discounts
  , CAST(NULL AS float64) as gtv_shipping_discounts
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  UNION ALL
  SELECT
    sfl.simple_sku
  , sfl.inventory_relationship
  , sfl.inventory_type
  , CAST(NULL AS string ) as serial_number
  , CAST(NULL AS date ) as original_intake_date
  , CAST(NULL AS date ) as first_available_date
  , CAST(NULL AS date ) as last_available_date
  , CAST(NULL AS float64) as serial_price
  , CAST(NULL AS float64) as inventory_cost
  , sol.x3_order_warehouse as warehouse
  , CAST(NULL AS string ) as yseristatus_consignment_status
  , CAST(NULL AS string ) as mag_status
  , ss.conditions
  , sfl.order_date
  , 1 gtv_qty
  , gmv_qty
  , sfl.line_item_price_paid + sfl.line_item_store_credit_applied + sfl.line_item_discount item_value
  , sfl.line_item_price_paid + sfl.line_item_store_credit_applied item_paid
  , sfl.line_item_discount item_discount
  , sfl.business_unit
  , sfl.sales_channel
  , sfl.channel_or_gateway
  , sfl.geography_type
  , sfl.geography
  , CAST(NULL AS string) AS consignor_id
  , CAST(NULL AS string) AS vendor_number
  , sfl.inventory_cost cogs
  , sfl.inventory_seller
  , ss.parent_company
  , sfl.reporting_status
  , sfl.gmv_total
  , sfl.gross_profit
  , sfl.gtv_total
  , sfl.gtv_paid
  , sfl.order_serial_price
  , sfl.net_sales
  , sfl.consignor_payouts_payable
  , sfl.consignor_payouts_returned
  , sfl.consignor_payouts_total
  , sfl.reporting_date
  , sfl.revenue_commissions
  , sfl.cogs_total
  , sfl.private_customer_status
  , sfl.private_customer_stylist
  , sfl.unique_email
  , sfl.serial_order_match
  , sfl.coupon_code
  , sfl.gtv_item_discounts
  , sfl.gtv_shipping_discounts
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
  ON sfl.serial_number = ss.serial_number
  left join `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` sol
  ON sfl.fulfillment_number = sol.fulfillment_number and sfl.allocation_line_number = sol.allocation_line_number

), products AS (

  SELECT
    simple_sku
  , configurable_sku AS `configurable_sku`
  , brand AS `Brand`
  , mfg_sku AS `mfg_sku`
  , size AS `Size`
  , name AS `product_name`
  , coalesce(nickname, colorway) AS `Colorway`
  , gender AS `Gender`
  , x3_sku AS `x3_sku`
  , x3_attribute_set AS `attribute_type`
  , merch_division
  , merch_department
  , fps_parent_product_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`

), final AS (

  SELECT
    sales_stock.*
  , `configurable_sku`
  , `Brand`
  , `mfg_sku`
  , `Size`
  , `product_name`
  , `Colorway`
  , `Gender`
  , `x3_sku`
  , `attribute_type`
  , products.merch_division
  , products.merch_department
  , products.fps_parent_product_id
  , sc.is_enterprise
  , sc.seller_tier
  FROM sales_stock
  LEFT JOIN products ON products.simple_sku = sales_stock.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_consignors` sc on sales_stock.inventory_seller = sc.consignor_id

)

SELECT * FROM final
  );
    
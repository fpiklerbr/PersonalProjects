


WITH update_timestamps AS (

  SELECT
      order_line_id
    , max(transaction_date) AS update_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_line_transactions`
  GROUP BY 1

), sales AS (

  SELECT DISTINCT
      transactions.order_line_id
    , transactions.transaction_type
    , coalesce(transactions.simple_sku, serials.simple_sku) AS variant_id
    , serials.serial_inventory AS FOB
    , coalesce(transactions.business_entity, serials.business_entity) AS BE
    , finance_lines.coupon_code AS discount_code
    , (-1 * transactions.shipping_promo) AS shipping_promo
    , finance_lines.promo_type
    , transactions.order_date
    , finance_lines.sales_channel
    , 
CASE WHEN finance_lines.private_customer_source = 'Private Client' THEN 'PC'
  ELSE
        CASE WHEN finance_lines.business_unit = 'Store' THEN 'RETAIL'
             WHEN finance_lines.sales_channel = 'Farfetch' THEN 'FARFETCH'
             WHEN (finance_lines.sales_channel != 'Farfetch' AND finance_lines.business_unit = 'Omnichannel') THEN 'OMNI'
        ELSE finance_lines.business_unit
        END
END AS cpsc
    , transactions.inventory_relationship
    , CASE
        WHEN transactions.reporting_status <> 'Cancelled'
        THEN transactions.quantity
        ELSE 0
      END AS sales_units
    , CASE
        WHEN transactions.reporting_status <> 'Cancelled'
        THEN -1 * cast(coalesce(transactions._1p_cogs, transactions._3p_consignor_payout) AS numeric)
      END AS sales_cost
    , transactions.item_basket_price_ex_tax AS sales_retail
    , -1 * cast(transactions.basket_promo AS numeric) AS discount
    , serials.original_price - transactions.serial_price AS markdown
    , transactions.product_sales_price
    , 
transactions.item_basket_price_ex_tax
+ (transactions.shipping_revenue + transactions.shipping_promo)
+ transactions.sales_tax
+ (-1 * transactions.basket_promo)
+ (-1 * transactions.shipping_promo) AS gtv_total
    , 
(transactions.shipping_revenue + transactions.shipping_promo)
+ transactions.sales_tax
+ (-1 * transactions.shipping_promo) AS non_merchandise_gtv
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_line_transactions` AS transactions
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serials
    ON transactions.serial_number = serials.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS finance_lines
    ON transactions.order_line_id = finance_lines.order_line_id
  WHERE transactions.transaction_type = 'Sale'
  AND finance_lines.business_unit != 'DTC, Omnichannel'

), returns_and_refunds AS (

  SELECT
      order_line_id
    , min(transaction_date) AS timestamp
    , sum(CASE WHEN transaction_type = 'Returned Inventory' THEN 1 END) AS returns_units
    , sum(cast(coalesce(_1p_cogs, _3p_consignor_payout) AS numeric)) AS returns_cost
    , sum(-1 * cast(item_basket_price_ex_tax AS numeric)) AS returns_retail
    , sum(CASE WHEN transaction_type = 'Refunded Payment' THEN 1 ELSE 0 END) > 0 AS has_refund
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_line_transactions`
  WHERE transaction_type IN ('Refunded Payment', 'Returned Inventory')
  GROUP BY 1

), unioned AS (

  SELECT
      order_line_id
    , transaction_type
    , order_date AS timestamp
    , sales_units
    , sales_cost
    , sales_retail
    , discount
    , shipping_promo
    , markdown
    , cast(NULL AS int64) AS returns_units
    , cast(NULL AS numeric) AS returns_cost
    , cast(NULL AS numeric) AS returns_retail
    , cast(NULL AS numeric) AS returns_ticket
    , gtv_total
    , non_merchandise_gtv
  FROM sales
  UNION DISTINCT
  SELECT
      returns_and_refunds.order_line_id
    , cast('Returns & Refunds' AS string) AS transaction_type
    , returns_and_refunds.timestamp
    , cast(0 AS int64) AS sales_units
    , cast(NULL AS numeric) AS sales_cost
    , cast(NULL AS numeric) AS sales_retail
    , cast(NULL AS numeric) AS discount
    , cast(NULL AS numeric) AS shipping_promo
    , cast(NULL AS numeric) AS markdown
    , returns_and_refunds.returns_units
    , returns_and_refunds.returns_cost
    , returns_and_refunds.returns_retail
    , CASE
        WHEN returns_and_refunds.has_refund
        THEN sales.product_sales_price
      END AS returns_ticket
    , cast(NULL AS numeric) AS gtv_total
    , cast(NULL AS numeric) AS non_merchandise_gtv
  FROM returns_and_refunds
  INNER JOIN sales
    ON returns_and_refunds.order_line_id = sales.order_line_id

), joined AS (

  SELECT DISTINCT
      substr(
    concat(
    
      coalesce(unioned.order_line_id|| '-' , '')
    
      , coalesce(left(unioned.transaction_type, 1)|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(unioned.order_line_id|| '-' , '')
    
      , coalesce(left(unioned.transaction_type, 1)|| '-' , '')
    
  )) - length('-')
      , 0
    )
) AS sale_id
    , unioned.timestamp
    , sales.variant_id
    , sales.FOB
    , sales.BE
    , unioned.transaction_type
    , sales.order_date
    , sales.sales_channel
    , sales.cpsc
    , sales.inventory_relationship
    , unioned.sales_units
    , unioned.sales_cost
    , unioned.sales_retail
    , unioned.discount
    , unioned.shipping_promo AS shipping_discount
    , unioned.markdown
    , unioned.returns_units
    , unioned.returns_cost
    , unioned.returns_retail
    , unioned.returns_ticket
    , unioned.gtv_total
    , unioned.non_merchandise_gtv
    , update_timestamps.update_timestamp
    , sales.discount_code
    , sales.promo_type
  FROM unioned
  INNER JOIN sales
    ON unioned.order_line_id = sales.order_line_id
  INNER JOIN update_timestamps
    ON unioned.order_line_id = update_timestamps.order_line_id

)

SELECT * FROM joined
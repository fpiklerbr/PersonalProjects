WITH products AS (

  SELECT
    simple_sku
  , attribute_set
  , size
  , brand
  , mfg_sku
  , brand_subcategory
  , name
  , colorway
  , nickname
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`

), finance_lines AS (

--Stadium Finance Lines GMV and shipping.
  SELECT
    stadium_order_id
  , serial_number
  , gmv_total
  , gtv_total
  , sales_tax
  , revenue_shipping
  , net_sales
  , cogs_total
  , revenue_commissions
  , line_item_discount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`

), otb_serial_events AS (

  SELECT DISTINCT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_otb_serials`

), inventory_agg AS (

/* end of day, availability metrics */
  SELECT
    inventory_date
  , simple_sku
  , business_entity
  , serial_relationship
  , serial_inventory
  , warehouse
  , inventory_age_bucket
  , SUM(CASE WHEN availability > 0 AND inventory_date <> next_transaction_date THEN 1 ELSE 0 END) as eod_on_hand_units
  , SUM(CASE WHEN availability > 0 AND inventory_date <> next_transaction_date THEN price ELSE 0 END) as eod_on_hand_retail
  , SUM(CASE WHEN availability > 0 AND inventory_date <> next_transaction_date THEN cost ELSE 0 END) as eod_on_hand_cost
  , SUM(CASE WHEN availability > 0 AND inventory_date <> next_transaction_date THEN original_price ELSE 0 END) as eod_on_hand_intake
  , AVG(CASE WHEN inventory_date <> next_transaction_date THEN inventory_age END) AS eod_avg_inventory_age
  , MAX(CASE WHEN inventory_date <> next_transaction_date THEN inventory_age END) AS eod_max_inventory_age
  , MIN(CASE WHEN inventory_date <> next_transaction_date THEN inventory_age END) AS eod_min_inventory_age
  FROM otb_serial_events
  GROUP BY 1, 2, 3, 4, 5, 6, 7

), otb_serials_with_finance AS (

  SELECT
    otb_serials.*
  , finance_lines.gmv_total
  , finance_lines.gtv_total
  , finance_lines.sales_tax
  , finance_lines.revenue_shipping
  , finance_lines.net_sales
  , finance_lines.cogs_total
  , finance_lines.revenue_commissions
  , finance_lines.line_item_discount
  FROM (
    SELECT * FROM otb_serial_events --distinct to dedup
    WHERE inventory_date = transaction_date
  ) otb_serials
  LEFT JOIN finance_lines
  ON  finance_lines.serial_number = otb_serials.serial_number
  AND finance_lines.stadium_order_id = otb_serials.event_class_reference
  AND otb_serials.qty_commercial = -1
  AND otb_serials.event_class in ('Sale','Return')

), key_events_agg AS(

/* key event metrics, such as sale, intake, withdrawal, return, mpp */
  SELECT
    inventory_date
  , simple_sku
  , business_entity
  , serial_relationship
  , serial_inventory
  , warehouse
  , inventory_age_bucket
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN 1 ELSE 0 END) as sold_units
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN gtv_total - sales_tax ELSE 0 END) as sold_gmv_returns_ignored
  , SUM(CASE WHEN event_class in ('Sale','Return') THEN gtv_total ELSE 0 END) as sold_gtv
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN gmv_total ELSE 0 END) as sold_gmv
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN price ELSE 0 END) as sold_retail_price
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN cost ELSE 0 END) as sold_cost
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN revenue_shipping ELSE 0 END) as sold_shipping_revenue
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN net_sales ELSE 0 END) as net_sales
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN cogs_total ELSE 0 END) as cogs_total
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN revenue_commissions ELSE 0 END) as revenue_commissions
  , SUM(CASE WHEN event_class = 'Sale' AND qty_commercial = -1 THEN line_item_discount ELSE 0 END) as line_item_discount

  , SUM(CASE WHEN event_class = 'Intake' AND qty_commercial = 1 THEN 1 ELSE 0 END) as intake_units
  , SUM(CASE WHEN event_class = 'Intake' AND qty_commercial = 1 THEN price ELSE 0 END) as intake_retail
  , SUM(CASE WHEN event_class = 'Intake' AND qty_commercial = 1 THEN cost ELSE 0 END) as intake_cost

  , SUM(CASE WHEN event_class IN ('Withdrawal','Misc') AND qty_commercial = -1 THEN 1 ELSE 0 END) as withdrawal_units
  , SUM(CASE WHEN event_class IN ('Withdrawal','Misc') AND qty_commercial = -1 THEN price ELSE 0 END) as withdrawal_retail
  , SUM(CASE WHEN event_class IN ('Withdrawal','Misc') AND qty_commercial = -1 THEN cost ELSE 0 END) as withdrawal_cost

  , SUM(CASE WHEN event_class = 'Return' AND qty_commercial = 1 THEN 1 ELSE 0 END) as return_units
  , SUM(CASE WHEN event_class = 'Return' AND qty_commercial = 1 THEN price ELSE 0 END) as return_retail
  , SUM(CASE WHEN event_class = 'Return' AND qty_commercial = 1 THEN cost ELSE 0 END) as return_cost

  , SUM(CASE WHEN event_class = 'MPP' AND qty_commercial = -1 THEN 1 ELSE 0 END) as mpp_units
  , SUM(CASE WHEN event_class = 'MPP' AND qty_commercial = -1 THEN price ELSE 0 END) as mpp_retail
  , SUM(CASE WHEN event_class = 'MPP' AND qty_commercial = -1 THEN cost ELSE 0 END) as mpp_cost

  FROM otb_serials_with_finance
  WHERE inventory_date > DATE_SUB(CURRENT_DATE('America/New_York'), INTERVAL 2 YEAR)
  GROUP BY 1, 2, 3, 4, 5, 6, 7

), join_table AS (

  SELECT *
  FROM inventory_agg
  LEFT JOIN key_events_agg
  USING (inventory_date, simple_sku, business_entity, serial_relationship, serial_inventory, warehouse, inventory_age_bucket)
  LEFT JOIN products
  USING (simple_sku)

), final AS (

  SELECT
    simple_sku
  , inventory_date
  , business_entity
  , CASE WHEN serial_inventory = 'Dropship' THEN 'DSS' ELSE serial_relationship END AS serial_relationship --At Kevin's Request, Seperate DSS serials.
  , serial_inventory
  , warehouse
  , inventory_age_bucket
  , eod_on_hand_units
  , eod_on_hand_retail
  , eod_on_hand_cost
  , eod_on_hand_intake
  , eod_avg_inventory_age
  , eod_max_inventory_age
  , eod_min_inventory_age
  , COALESCE(sold_units,0) sold_units
  , COALESCE(sold_gmv,0) sold_gmv
  , COALESCE(sold_gtv,0) sold_gtv
  , COALESCE(sold_gmv_returns_ignored,0) sold_gmv_returns_ignored
  , COALESCE(sold_retail_price,0) sold_retail_price
  , COALESCE(sold_cost,0) sold_cost
  , COALESCE(sold_shipping_revenue,0) sold_shipping_revenue
  , COALESCE(net_sales,0) net_sales
  , COALESCE(cogs_total,0) cogs_total
  , COALESCE(revenue_commissions,0) revenue_commissions
  , COALESCE(line_item_discount,0) item_discount
  , COALESCE(intake_units,0) intake_units
  , COALESCE(intake_retail,0) intake_retail
  , COALESCE(intake_cost,0) intake_cost
  , COALESCE(withdrawal_units,0) withdrawal_units
  , COALESCE(withdrawal_retail,0) withdrawal_retail
  , COALESCE(withdrawal_cost,0) withdrawal_cost
  , COALESCE(return_units,0) return_units
  , COALESCE(return_retail,0) return_retail
  , COALESCE(return_cost,0) return_cost
  , COALESCE(mpp_units,0) mpp_units
  , COALESCE(mpp_retail,0) mpp_retail
  , COALESCE(mpp_cost,0) mpp_cost
  , attribute_set
  , size
  , brand
  , mfg_sku
  , brand_subcategory
  , name
  , colorway
  , nickname
  FROM join_table

)

SELECT *
FROM final
WHERE --Filters out useless rows
eod_on_hand_units +
eod_on_hand_retail +
eod_on_hand_cost +
sold_units +
sold_gmv +
sold_gtv +
sold_gmv_returns_ignored +
sold_retail_price +
sold_cost +
sold_shipping_revenue +
net_sales +
cogs_total +
revenue_commissions +
item_discount +
intake_units +
intake_retail +
intake_cost +
withdrawal_units +
withdrawal_retail +
withdrawal_cost +
mpp_units +
mpp_retail +
mpp_cost <> 0
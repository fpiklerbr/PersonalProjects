/*
TODO for DE-3487: update docs
*/

{% macro finance_line_transactions_transformation(build_from_snapshots=false, use_base_amounts=false) %}

{% if execute and build_from_snapshots == true %}
    {%- set last_close_date_info = get_last_close_date_info() -%}
    {%- set stadium_finance_lines = source('finance_snapshots', 'stadium_finance_lines_' ~ last_close_date_info.close_date.strftime('%Y%m%d')) -%}
    {%- set month_start = last_close_date_info.month_beginning.strftime('%Y-%m-%d') -%}
    {%- set month_end = last_close_date_info.month_ending.strftime('%Y-%m-%d') -%}
    {%- set snapshot_date = last_close_date_info.close_date.strftime('%Y-%m-%d') -%}

{%- else -%}
    {%- set stadium_finance_lines = ref('stadium_finance_lines') -%}
    {%- set month_start = run_started_at.strftime('%Y-%m-01') -%}
    {%- set month_end = run_started_at.strftime('%Y-%m-%d') -%}
    {%- set snapshot_date = run_started_at.strftime('%Y-%m-%d') -%}

{%- endif -%}

{%- set currency = 'order_base_currency' if use_base_amounts else string_literal('USD') -%}
{%- set currency_tag = '_base_amount' if use_base_amounts else '' -%}

{%- set currency_column_aliases = [
  'serial_cost',
  'order_serial_price',
  'line_item_price_before_upcharge',
  'line_item_upcharge',
  'line_item_price_paid',
  'line_item_store_credit_applied',
  'line_item_discount',
  'line_shipping_price_paid',
  'line_shipping_store_credit_applied',
  'line_shipping_discount',
  'line_item_tax_paid',
  'line_shipping_tax_paid',
  'line_item_price_refunded',
  'line_item_price_credited',
  'line_shipping_price_refunded',
  'line_shipping_price_credited',
  'line_item_tax_refunded',
  'line_item_tax_credited',
  'line_shipping_tax_refunded',
  'line_shipping_tax_credited',
  'payment_total_shipping_subsidy',
  'line_payment_shipping_subsidy',
  'refund_total_shipping_subsidy',
  'line_refund_shipping_subsidy',
  'return_refund_expected',
] -%}

{%- set currency_columns = {} -%}
{%- for currency_column in currency_column_aliases -%}
  {%- if currency_column == 'return_refund_expected' and modules.datetime.datetime.strptime(snapshot_date, '%Y-%m-%d') < modules.datetime.datetime.strptime('2023-05-26', '%Y-%m-%d') -%}
    {%- set column_expression = dbt_utils.safe_cast('NULL', data_type('decimal')) -%}
  {%- else -%}
    {%- set column_expression = 'round(' ~ currency_column ~ currency_tag ~ ', 2)' -%}
  {%- endif -%}
  {%- do currency_columns.update({
    currency_column: column_expression
  }) -%}
{%- endfor -%}

{%- set item_basket_price_ex_tax -%}
(item_price_paid)
{%- endset -%}

{%- set total_amount_refunded -%}
(item_price_refunded + shipping_price_refunded + tax_refunded)
{%- endset -%}

{%- set sales_tax_refunded -%}
{{- greatest('decimal', ['tax_paid * -1', total_amount_refunded]) -}}
{%- endset -%}

{%- set basket_price_ex_tax_refunded -%}
( {{- total_amount_refunded }} - {{ sales_tax_refunded -}} )
{%- endset -%}

{%- set item_basket_price_ex_tax_refunded -%}
{{- greatest('decimal', [item_basket_price_ex_tax ~' * -1' , basket_price_ex_tax_refunded]) -}}
{%- endset -%}

{%- set shipping_revenue_refunded -%}
( {{- basket_price_ex_tax_refunded }} - {{ item_basket_price_ex_tax_refunded -}} )
{%- endset -%}


WITH finance_lines AS (

  SELECT
      stadium_order_id
    , order_date
    , financial_reporting_unit AS sales_channel_level_1
    , channel_or_gateway AS sales_channel_level_2
    , payment_id
    , order_line_id
    , geography_type
    , CASE WHEN geography_type = 'Domestic' THEN geography END AS us_state
    , CASE WHEN geography_type = 'Domestic' THEN COALESCE({{regexp_extract('customer_city', '(.*),')}}, customer_city) END AS us_city
    , CASE WHEN geography_type = 'Domestic' THEN shipping_postcode END AS us_postcode
    , serial_number
    , reporting_status
    , reporting_date
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , refund_date
    , refund_id
    , return_date
    , return_outcome
    , serial_order_match
    , return_intake_creation_nyc
    , return_intake_id
    , new_serial_from_return
    , new_serial_inventory_relationship
    , x3_return_creation_nyc
    , x3_return_id
    , rma_package_approved_nyc
    , rma_closed_nyc
    , mag_rma_ids
    , rma_statuses
    , issued_serial_next_journal_date_after_dispatch_date
    , issued_serial_next_journal_document_id_after_dispatch_date
    , cast(1 AS {{ data_type('int') -}} ) AS quantity
    , {{ currency }} AS currency
    , {{ currency_columns.get('order_serial_price') }} AS order_serial_price
    , {{ currency_columns.get('line_item_price_before_upcharge') }} AS item_price_before_upcharge
    , {{ currency_columns.get('line_item_upcharge') }} AS channel_upcharge
    , (
        {{ currency_columns.get('line_item_price_paid') }}
        + {{ currency_columns.get('line_item_store_credit_applied') }}
      ) AS item_price_paid
    , -1 * {{ currency_columns.get('line_item_discount') }} AS item_discount
    , (
        {{ currency_columns.get('line_shipping_price_paid') }}
        + {{ currency_columns.get('line_shipping_store_credit_applied') }}
      ) AS shipping_price_paid
    , -1 * {{ currency_columns.get('line_shipping_discount') }} AS shipping_discount
    , ( {{ currency_columns.get('line_item_tax_paid') }} +
        CASE WHEN business_entity = 'STADIUM GOODS EU' THEN 0
        ELSE {{ currency_columns.get('line_shipping_tax_paid') }}
        END ) AS tax_paid
    , -1 * (
        {{ currency_columns.get('line_item_price_refunded') }}
        + {{ currency_columns.get('line_item_price_credited') }}
      ) AS item_price_refunded
    , -1 * (
        {{ currency_columns.get('line_shipping_price_refunded') }}
        + {{ currency_columns.get('line_shipping_price_credited') }}
      ) AS shipping_price_refunded
    , -1 * (
        {{ currency_columns.get('line_item_tax_refunded') }}
        + {{ currency_columns.get('line_item_tax_credited') }}
        + CASE WHEN business_entity = 'STADIUM GOODS EU' THEN 0
            ELSE ({{ currency_columns.get('line_shipping_tax_refunded') }}+ {{ currency_columns.get('line_shipping_tax_credited') }})
            END
      ) AS tax_refunded
    , {{ currency_columns.get('return_refund_expected') }} AS return_refund_expected
    , -1 * {{ currency_columns.get('serial_cost') }} AS serial_cost
    , {{ currency_columns.get('payment_total_shipping_subsidy') }} AS payment_total_shipping_subsidy
    , {{ currency_columns.get('line_payment_shipping_subsidy') }} AS line_payment_shipping_subsidy
    , {{ currency_columns.get('refund_total_shipping_subsidy') }} AS refund_total_shipping_subsidy
    , {{ currency_columns.get('line_refund_shipping_subsidy') }} AS line_refund_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM {{ stadium_finance_lines }}
  WHERE reporting_status IN ('Returned', 'Dispatched', 'Cancelled', 'Deferred')

), lines_with_calculations AS (

SELECT
    *
  , CASE WHEN business_entity = 'STADIUM GOODS USA'
    THEN {{ greatest('decimal', ['(item_price_paid - channel_upcharge - item_discount)', 'order_serial_price']) }}
    WHEN business_entity = 'STADIUM GOODS EU'
    THEN ({{ item_basket_price_ex_tax }} - item_discount - channel_upcharge)
     END AS serial_price
  , CASE WHEN business_entity = 'STADIUM GOODS USA'
    THEN {{ greatest('decimal', ['(item_price_paid - channel_upcharge - item_discount)', 'order_serial_price']) }} + channel_upcharge
    WHEN business_entity = 'STADIUM GOODS EU'
    THEN ({{ item_basket_price_ex_tax }} - item_discount)
     END AS product_sales_price
  , item_discount AS basket_promo
  , {{ item_basket_price_ex_tax }} AS item_basket_price_ex_tax
  , (shipping_price_paid - shipping_discount) AS shipping_revenue
  , shipping_discount AS shipping_promo
  , (item_price_paid + shipping_price_paid) AS basket_price_ex_tax
  , tax_paid AS sales_tax
  , (item_price_paid + shipping_price_paid + tax_paid) AS total_amount_paid
  , {{ total_amount_refunded }} AS total_amount_refunded
  , {{ sales_tax_refunded }} AS sales_tax_refunded
  , {{ basket_price_ex_tax_refunded }} AS basket_price_ex_tax_refunded
  , {{ item_basket_price_ex_tax_refunded }} AS item_basket_price_ex_tax_refunded
  , {{ shipping_revenue_refunded }} AS shipping_revenue_refunded
  , CASE WHEN inventory_relationship = '1P'  AND reporting_status <> 'Cancelled' THEN serial_cost END AS _1p_cogs
  , CASE WHEN inventory_relationship <> '1P' AND reporting_status <> 'Cancelled' THEN serial_cost END AS _3p_consignor_payout
FROM finance_lines

), sale_transactions AS (

  SELECT
      stadium_order_id
    , order_line_id
    , serial_number
    , cast('Sale' AS {{ data_type('text') -}} ) AS transaction_type
    , reporting_date AS transaction_date
    , order_date
    , sales_channel_level_1
    , sales_channel_level_2
    , payment_id
    , geography_type
    , us_state
    , us_city
    , us_postcode
    , reporting_status
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , quantity
    , currency
    , serial_price
    , channel_upcharge
    , product_sales_price
    , basket_promo
    , item_basket_price_ex_tax
    , shipping_revenue
    , shipping_promo
    , basket_price_ex_tax
    , sales_tax
    , total_amount_paid
    , _1p_cogs
    , _3p_consignor_payout
    , cast(NULL AS {{ data_type('date') -}} ) AS refund_date
    , cast(NULL AS {{ data_type('text') -}} ) AS refund_id
    , cast(NULL AS {{ data_type('decimal') -}} ) AS returned_refunds_accrual
    , cast(NULL AS {{ data_type('date') -}} ) AS return_date
    , cast(NULL AS {{ data_type('text') -}} ) AS return_outcome
    , cast(NULL AS {{ data_type('boolean') -}} ) AS serial_order_match
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS return_intake_creation_nyc
    , cast(NULL AS {{ data_type('text') -}} ) AS return_intake_id
    , cast(NULL AS {{ data_type('text') -}} ) AS new_serial_from_return
    , cast(NULL AS {{ data_type('text') -}} ) AS new_serial_inventory_relationship
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS x3_return_creation_nyc
    , cast(NULL AS {{ data_type('text') -}} ) AS x3_return_id
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS rma_package_approved_nyc
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS rma_closed_nyc
    , cast(NULL AS {{ data_type('text') -}} ) AS mag_rma_ids
    , cast(NULL AS {{ data_type('text') -}} ) AS rma_statuses
    , cast(NULL AS {{ data_type('date') -}} ) AS issued_serial_next_journal_date_after_dispatch_date
    , cast(NULL AS {{ data_type('text') -}} ) AS issued_serial_next_journal_document_id_after_dispatch_date
    , reporting_date
    , payment_total_shipping_subsidy AS order_total_shipping_subsidy
    , line_payment_shipping_subsidy AS line_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM lines_with_calculations
  WHERE reporting_status IN ('Returned', 'Dispatched','Cancelled','Deferred')

), return_transactions AS (

  SELECT
      stadium_order_id
    , order_line_id
    , serial_number
    , cast('Returned Inventory' AS {{ data_type('text') -}} ) AS transaction_type
    , return_date AS transaction_date
    , order_date
    , sales_channel_level_1
    , sales_channel_level_2
    , payment_id
    , geography_type
    , us_state
    , us_city
    , us_postcode
    , reporting_status
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , cast(NULL AS {{ data_type('int') -}} ) AS quantity
    , currency
    , cast(NULL AS {{ data_type('decimal') -}} ) AS serial_price
    , cast(NULL AS {{ data_type('decimal') -}} ) AS channel_upcharge
    , cast(NULL AS {{ data_type('decimal') -}} ) AS product_sales_price
    , cast(NULL AS {{ data_type('decimal') -}} ) AS basket_promo
    , cast(NULL AS {{ data_type('decimal') -}} ) AS item_basket_price_ex_tax
    , cast(NULL AS {{ data_type('decimal') -}} ) AS shipping_revenue
    , cast(NULL AS {{ data_type('decimal') -}} ) AS shipping_promo
    , cast(NULL AS {{ data_type('decimal') -}} ) AS basket_price_ex_tax
    , cast(NULL AS {{ data_type('decimal') -}} ) AS sales_tax
    , cast(NULL AS {{ data_type('decimal') -}} ) AS total_amount_paid
    , -1 * _1p_cogs AS _1p_cogs
    , -1 * _3p_consignor_payout AS _3p_consignor_payout
    , cast(NULL AS {{ data_type('date') -}} ) AS refund_date
    , cast(NULL AS {{ data_type('text') -}} ) AS refund_id
    , -1 * return_refund_expected AS returned_refunds_accrual
    , return_date
    , return_outcome
    , serial_order_match
    , return_intake_creation_nyc
    , return_intake_id
    , new_serial_from_return
    , new_serial_inventory_relationship
    , x3_return_creation_nyc
    , x3_return_id
    , rma_package_approved_nyc
    , rma_closed_nyc
    , mag_rma_ids
    , rma_statuses
    , issued_serial_next_journal_date_after_dispatch_date
    , issued_serial_next_journal_document_id_after_dispatch_date
    , reporting_date
    , cast(NULL AS {{ data_type('decimal') -}} ) AS order_total_shipping_subsidy
    , cast(NULL AS {{ data_type('decimal') -}} ) AS line_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM lines_with_calculations
  WHERE return_date IS NOT NULL

), refund_transactions AS (

  SELECT
      stadium_order_id
    , order_line_id
    , serial_number
    , cast('Refunded Payment' AS {{ data_type('text') -}} ) AS transaction_type
    , refund_date AS transaction_date
    , order_date
    , sales_channel_level_1
    , sales_channel_level_2
    , payment_id
    , geography_type
    , us_state
    , us_city
    , us_postcode
    , reporting_status
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , cast(NULL AS {{ data_type('int') -}} ) AS quantity
    , currency
    , cast(NULL AS {{ data_type('decimal') -}} ) AS serial_price
    , cast(NULL AS {{ data_type('decimal') -}} ) AS channel_upcharge
    , cast(NULL AS {{ data_type('decimal') -}} ) AS product_sales_price
    , -1 * basket_promo AS basket_promo
    , item_basket_price_ex_tax_refunded AS item_basket_price_ex_tax
    , shipping_revenue_refunded AS shipping_revenue
    , -1 * shipping_promo AS shipping_promo
    , basket_price_ex_tax_refunded AS basket_price_ex_tax
    , sales_tax_refunded AS sales_tax
    , total_amount_refunded AS total_amount_paid
    , cast(NULL AS {{ data_type('decimal') -}} ) AS _1p_cogs
    , cast(NULL AS {{ data_type('decimal') -}} ) AS _3p_consignor_payout
    , refund_date
    , refund_id
    , return_refund_expected AS returned_refunds_accrual
    , cast(NULL AS {{ data_type('date') -}} ) AS return_date
    , cast(NULL AS {{ data_type('text') -}} ) AS return_outcome
    , cast(NULL AS {{ data_type('boolean') -}} ) AS serial_order_match
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS return_intake_creation_nyc
    , cast(NULL AS {{ data_type('text') -}} ) AS return_intake_id
    , cast(NULL AS {{ data_type('text') -}} ) AS new_serial_from_return
    , cast(NULL AS {{ data_type('text') -}} ) AS new_serial_inventory_relationship
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS x3_return_creation_nyc
    , cast(NULL AS {{ data_type('text') -}} ) AS x3_return_id
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS rma_package_approved_nyc
    , cast(NULL AS {{ data_type('timestamp') -}} ) AS rma_closed_nyc
    , cast(NULL AS {{ data_type('text') -}} ) AS mag_rma_ids
    , cast(NULL AS {{ data_type('text') -}} ) AS rma_statuses
    , cast(NULL AS {{ data_type('date') -}} ) AS issued_serial_next_journal_date_after_dispatch_date
    , cast(NULL AS {{ data_type('text') -}} ) AS issued_serial_next_journal_document_id_after_dispatch_date
    , reporting_date
    , refund_total_shipping_subsidy AS order_total_shipping_subsidy
    , line_refund_shipping_subsidy AS line_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM lines_with_calculations
  WHERE refund_date IS NOT NULL

), finance_line_transactions AS (

  SELECT
      *
  FROM sale_transactions
  UNION ALL
  SELECT
      *
  FROM return_transactions
  UNION ALL
  SELECT
      *
  FROM refund_transactions

), order_lines_with_transactions_in_month AS (

  SELECT DISTINCT order_line_id
  FROM finance_line_transactions
  WHERE transaction_date BETWEEN '{{ month_start }}' AND '{{ month_end }}'

), final AS (

SELECT
    cast( {{- dbt_utils.date_trunc('month', 'transaction_date') }} AS {{ data_type('date') -}} ) AS transaction_month
  , transaction_date BETWEEN '{{ month_start }}' AND '{{ month_end }}' AS transaction_is_in_reporting_month
  , finance_line_transactions.stadium_order_id
  , finance_line_transactions.order_line_id
  , finance_line_transactions.serial_number
  , finance_line_transactions.transaction_type
  , finance_line_transactions.transaction_date
  , finance_line_transactions.order_date
  , finance_line_transactions.sales_channel_level_1
  , finance_line_transactions.sales_channel_level_2
  , CASE WHEN finance_line_transactions.payment_id IS NULL THEN trans.transaction_id ELSE finance_line_transactions.payment_id END AS payment_id
  , finance_line_transactions.geography_type
  , finance_line_transactions.us_state
  , finance_line_transactions.us_city
  , finance_line_transactions.us_postcode
  , finance_line_transactions.reporting_status
  , finance_line_transactions.inventory_relationship
  , finance_line_transactions.inventory_type
  , finance_line_transactions.inventory_seller
  , finance_line_transactions.product_sku
  , finance_line_transactions.simple_sku
  , finance_line_transactions.product_brand
  , finance_line_transactions.quantity
  , finance_line_transactions.currency
  , finance_line_transactions.serial_price
  , finance_line_transactions.channel_upcharge
  , finance_line_transactions.product_sales_price
  , finance_line_transactions.basket_promo
  , finance_line_transactions.item_basket_price_ex_tax
  , finance_line_transactions.shipping_revenue
  , finance_line_transactions.shipping_promo
  , finance_line_transactions.basket_price_ex_tax
  , finance_line_transactions.sales_tax
  , finance_line_transactions.total_amount_paid
  , finance_line_transactions._1p_cogs
  , finance_line_transactions._3p_consignor_payout
  , finance_line_transactions.refund_date
  , finance_line_transactions.refund_id
  , finance_line_transactions.returned_refunds_accrual
  , finance_line_transactions.return_date
  , finance_line_transactions.return_outcome
  , finance_line_transactions.serial_order_match
  , finance_line_transactions.return_intake_creation_nyc
  , finance_line_transactions.return_intake_id
  , finance_line_transactions.new_serial_from_return
  , finance_line_transactions.new_serial_inventory_relationship
  , finance_line_transactions.x3_return_creation_nyc
  , finance_line_transactions.x3_return_id
  , finance_line_transactions.rma_package_approved_nyc
  , finance_line_transactions.rma_closed_nyc
  , finance_line_transactions.mag_rma_ids
  , finance_line_transactions.rma_statuses
  , finance_line_transactions.issued_serial_next_journal_date_after_dispatch_date
  , finance_line_transactions.issued_serial_next_journal_document_id_after_dispatch_date
  , finance_line_transactions.reporting_date
  , finance_line_transactions.order_total_shipping_subsidy
  , finance_line_transactions.line_shipping_subsidy
  , finance_line_transactions.fps_stock_point_id
  , finance_line_transactions.business_entity
  , finance_line_transactions.payment_currency_conversion_rate
  , cast('{{ month_end }}' AS {{ data_type('date') -}} ) AS month_ending
  , cast('{{ snapshot_date }}' AS {{ data_type('date') -}} ) AS snapshot_date
  , (order_lines_with_transactions_in_month.order_line_id IS NOT NULL) AS order_line_has_transaction_in_reporting_month
FROM finance_line_transactions
LEFT JOIN order_lines_with_transactions_in_month
  ON finance_line_transactions.order_line_id = order_lines_with_transactions_in_month.order_line_id
LEFT JOIN {{ ref('stadium_transactions') }} trans 
  ON finance_line_transactions.stadium_order_id = trans.mag_order_id
{%- if target.type == 'bigquery' %}

{%- else %}
ORDER BY order_line_id, transaction_date, transaction_type
{%- endif %}

)

SELECT * FROM final


{% endmacro %}

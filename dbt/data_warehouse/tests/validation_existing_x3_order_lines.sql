{{
  config({
    'severity': 'warn'
    })
}}

-- depends_on: {{ ref('stg_stadium_finance_snapshots_close_dates') }}
{% if execute -%}
  {%- set last_close_date_info = get_last_close_date_info() -%}
  {%- set snapshot_table = source('finance_snapshots', 'stadium_finance_lines_' ~ last_close_date_info.close_date.strftime('%Y%m%d')) -%}
{%- else -%}
  {%- set snapshot_table = ref('stadium_finance_lines') -%}
{%- endif -%}

{%- set check_columns = [
  'stadium_order_id',
  'serial_number',
  'simple_sku',
  'order_date',
  'sales_channel',
] -%}

WITH final as (

{% for check_column in check_columns %}
  {{ 'UNION ALL' if not loop.first else '' }}
  SELECT
      order_line_id
    , cast('{{ check_column }}' AS {{ data_type('text') -}} ) AS check_column
    , cast(live.{{ check_column }} AS {{ data_type('text') -}} ) AS live_value
    , cast(snapshot.{{ check_column }} AS {{ data_type('text') -}} ) AS snapshot_value
  FROM {{ ref('stadium_finance_lines') }} AS live
  INNER JOIN {{ snapshot_table }} AS snapshot
    USING (order_line_id)
  WHERE live.{{ check_column }} <> snapshot.{{ check_column }}
    OR (live.{{ check_column }} IS NULL) <> (snapshot.{{ check_column }} IS NULL)
{% endfor %}

)

SELECT * FROM final

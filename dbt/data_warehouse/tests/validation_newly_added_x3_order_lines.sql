{{
  config({
    'severity': 'warn'
  })
}}

-- depends_on: {{ ref('stg_stadium_finance_snapshots_close_dates') }}
{% if execute -%}
  {%- set last_close_date_info = get_last_close_date_info() -%}
  {%- set snapshot_table = source('finance_snapshots', 'stadium_finance_lines_' ~ last_close_date_info.close_date.strftime('%Y%m%d')) -%}
  {%- set close_date = last_close_date_info.close_date.strftime('%Y-%m-%d') -%}
{%- else -%}
  {%- set snapshot_table = ref('stadium_finance_lines') -%}
  {%- set close_date = modules.datetime.datetime.now().strftime('%Y-%m-%d') -%}
{%- endif -%}

WITH final AS (

  SELECT
      order_line_id
    , stadium_order_id
    , serial_number
    , channel_or_gateway
    , order_date
    , reporting_date
  FROM {{ ref('stadium_finance_lines') }} AS live
  WHERE NOT EXISTS (
    SELECT *
    FROM {{ snapshot_table }} AS snapshot
    WHERE order_line_id = live.order_line_id
  )
  	AND (
      order_date < '{{ close_date }}'
      OR reporting_date <  '{{ close_date }}'
    )
)

SELECT * FROM final

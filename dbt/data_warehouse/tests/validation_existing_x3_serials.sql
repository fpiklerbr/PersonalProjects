{{
  config({
    'severity': 'warn'
    })
}}

{% set snapshot_dates = dbt_utils.get_column_values(
  table = source('finance_snapshots', 'inventory_dates'),
  column = 'inventory_date',
)|sort %}

{% if execute -%}
  {%- set snapshot_table = source('finance_snapshots', 'stadium_serials_' ~ snapshot_dates[-1].strftime('%Y%m%d')) -%}
{%- else -%}
  {%- set snapshot_table = ref('stadium_serials') -%}
{%- endif -%}

{%- set check_columns = [
  'consignor_id',
  'original_intake_date',
] -%}

WITH final as (

{% for check_column in check_columns %}
  {{ 'UNION ALL' if not loop.first else '' }}
  SELECT
      serial_number
    , cast('{{ check_column }}' AS {{ data_type('text') -}} ) AS check_column
    , cast(live.{{ check_column }} AS {{ data_type('text') -}} ) AS live_value
    , cast(snapshot.{{ check_column }} AS {{ data_type('text') -}} ) AS snapshot_value
  FROM {{ ref('stadium_serials') }} AS live
  INNER JOIN {{ snapshot_table }} AS snapshot
    USING (serial_number)
  WHERE live.{{ check_column }} <> snapshot.{{ check_column }}
    OR (live.{{ check_column }} IS NULL) <> (snapshot.{{ check_column }} IS NULL)
{% endfor %}

)

SELECT * FROM final

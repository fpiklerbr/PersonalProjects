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
  {%- set close_date = snapshot_dates[0].strftime('%Y-%m-%d') -%}
{%- else -%}
  {%- set snapshot_table = ref('stadium_serials') -%}
  {%- set close_date = modules.datetime.datetime.now().strftime('%Y-%m-%d') -%}
{%- endif -%}

WITH final AS (

  SELECT
      serial_number
    , intake_date
    , last_journal_date
    , document_date
  FROM {{ ref('stadium_serials') }} AS live
  WHERE NOT EXISTS (
    SELECT *
    FROM {{ snapshot_table }} AS snapshot
    WHERE serial_number = live.serial_number
  )
    AND (
      original_intake_date < '{{ close_date }}'
      OR document_date < '{{ close_date }}'
      OR last_journal_date < '{{ close_date }}'

    )

)

SELECT * FROM final

{%- macro create_interval(count, period) -%}
  {{ adapter.dispatch('create_interval')(count, period) }}
{%- endmacro -%}

{%- macro default__create_interval(count, period) -%}

cast(
  nullif( {{- concat_ws(' ', [count, period]) -}} , '')
  AS {{ data_type('interval') }}
)

{%- endmacro -%}

{%- macro bigquery__create_interval(count, period) -%}

cast(
  CASE 
    WHEN {{ count }} IS NULL THEN NULL
    WHEN {{ period }} = 'year' THEN {{ count }} || '-0'
    WHEN {{ period }} = 'month' THEN '0-' || {{ count }}
    WHEN {{ period }} = 'day' THEN '0-0 ' || {{ count }}
    WHEN {{ period }} = 'hour' THEN '0-0 0 ' || {{ count }} || ':0:0'
    WHEN {{ period }} = 'minute' THEN '0-0 0 0:' || {{ count }} || ':0'
    WHEN {{ period }} = 'second' THEN '0-0 0 0:0:' || {{ count }}
    ELSE NULL
  END
  AS interval
)

{%- endmacro -%}

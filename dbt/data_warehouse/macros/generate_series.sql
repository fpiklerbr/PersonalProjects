{% macro generate_series(start, end, step, mode) %}
  {{adapter.dispatch('generate_series')(start, end, step, mode)}}
{% endmacro %}

{%- macro default__generate_series(start, end, step, mode)  -%}
    generate_series({{start}},  {{end}}, {{step}})
{%- endmacro -%}


{%- macro bigquery__generate_series(start, end, step, mode) -%}

{%- if mode == 'number' -%}
{%-  set generate_array_func = 'generate_array' -%}
{%- elif mode == 'date' -%}
{%-  set generate_array_func = 'generate_date_array' -%}
{%- elif mode == 'timestamp' -%}
{%-  set generate_array_func = 'generate_timestamp_array' -%}
{%- endif -%}
    UNNEST( {{generate_array_func}}({{start}},  {{end}}, {{step| replace("'","")}}) )

{%- endmacro -%}
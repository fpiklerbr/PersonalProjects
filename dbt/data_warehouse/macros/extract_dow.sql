{% macro extract_dow(date, mode) %}
  {{adapter.dispatch('extract_dow')(date, mode)}}
{% endmacro %}

{% macro default__extract_dow(date, mode) %}

{%- if mode == 'iso' -%}
    extract('isodow' FROM {{date}})
{%- else -%}
    extract('dow' FROM {{date}})
{%- endif -%}

{% endmacro %}

{% macro bigquery__extract_dow(date, mode) %}

{%- if mode == 'iso' -%}
    MOD(EXTRACT(DAYOFWEEK FROM {{date}}) + 5, 7) + 1
{%- else -%}
    extract(DAYOFWEEK FROM {{date}}) -1
{%- endif -%}

{% endmacro %}

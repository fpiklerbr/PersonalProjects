{% macro make_date(year, month, day) %}

{{ adapter.dispatch('make_date')(year, month, day) }}

{% endmacro %}

{%- macro default__make_date(year, month, day) -%}

make_date( {{- year -}} , {{ month -}} , {{ day -}} )

{%- endmacro %}

{% macro bigquery__make_date(year, month, day) %}

date( {{- year -}} , {{ month -}} , {{ day -}} )

{% endmacro %}

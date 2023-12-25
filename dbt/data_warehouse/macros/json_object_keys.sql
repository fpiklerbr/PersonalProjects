{#
-- Postgres: json_object_keys('{"f1":"abc","f2":{"f3":"a", "f4":"b"}}')
-- BQ:  xud_dbt_sources.json_object_keys('{"f1":"abc","f2":{"f3":"a", "f4":"b"}}')
-- PG returns setof
-- BQ returns array
-- dbt cannot recognize correct schema (dataset)
#}

{% macro json_object_keys(json_row) %}
  {{ adapter.dispatch('json_object_keys')(json_row) }}
{% endmacro %}

{%- macro default__json_object_keys(json_row) -%}

json_object_keys( {{- json_row -}} )

{%- endmacro -%}

{%- macro bigquery__json_object_keys(json_row) -%}

unnest( {{- target.schema ~ '_reporting' -}}.json_object_keys_array( {{- json_row -}} ))

{%- endmacro -%}

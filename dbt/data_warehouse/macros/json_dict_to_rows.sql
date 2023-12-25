
{% macro json_dict_to_rows(json_dict, table_reference, table_pk) %}
  {{ adapter.dispatch('json_dict_to_rows')(json_dict, table_reference, table_pk) }}
{% endmacro %}

{%- macro default__json_dict_to_rows(json_dict, table_reference, table_pk) -%}

SELECT
    table_reference.{{ table_pk }}
  , json_each_results.key
  , json_each_results.value
FROM {{ table_reference }} AS table_reference
, json_each( {{- json_dict -}} ) AS json_each_results

{%- endmacro -%}

{%- macro bigquery__json_dict_to_rows(json_dict, table_reference, table_pk) -%}

SELECT
    table_reference.{{ table_pk }}
  , JSON_EXTRACT_SCALAR(json_list_from_dict, '$.key') AS key
  , JSON_EXTRACT(json_list_from_dict, '$.value') AS value
FROM {{ table_reference }} AS table_reference
, UNNEST(JSON_EXTRACT_ARRAY(
    {{ target.schema ~ '_reporting' }}.json_dict_to_list( {{- json_dict -}} )
  )) AS json_list_from_dict

{%- endmacro -%}

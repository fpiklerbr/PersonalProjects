{% macro create_udfs() %}
  {{ adapter.dispatch('create_udfs')() }}
{% endmacro %}

{% macro default__create_udfs() %}

CREATE SCHEMA IF NOT EXISTS {{ target.schema }};

GRANT ALL ON SCHEMA {{ target.schema }} TO root;

{{ create_f_get_stat_activity() }}

{% endmacro %}

{% macro bigquery__create_udfs() %}

{{ create_f_json_object_keys_array() }}

{{ create_f_json_dict_to_list() }}

{% endmacro %}

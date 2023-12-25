/*
This macro creates indexes on PG, and does nothing on BQ

Arguments
  - model: dbt model reference
  - index_columns: list of columns to include in the index
  - is_unique: indicates whether the index should be UNIQUE
  - config_schema: custom schema from config if present (to get around dbt bug)
  - config_alias: custom schema from config if present (to get around dbt bug)
*/

{% macro create_index(model, index_columns, is_unique = False, config_schema = None, config_alias = None) %}

{% if target.type == 'postgres' %}

  {% if target.name == 'prod' %}
    {% set model_schema = model.schema %}
    {% set model_table = config_alias if config_alias else model.identifier %}
  {% else %}
    {% set model_schema = model.schema ~ '_' ~ config_schema if config_schema else model.schema %}
    {% set model_table = model.identifier %}
  {% endif %}

{%- set index_name -%}
{{ model_table }}_index_on_{%- for index_column in index_columns -%}{{ index_column }}{%- if not loop.last -%}_and_{%- endif %}{%- endfor -%}
{%- endset -%}

{%- set dummy_statements %}
DROP INDEX IF EXISTS {{ adapter.quote(model.database) }}.{{ adapter.quote(model_schema) }}.{{ adapter.quote(index_name) }}
;

CREATE {% if is_unique == True %}UNIQUE {% endif %}INDEX {{ adapter.quote(index_name) }}
  ON {{ adapter.quote(model.database) }}.{{ adapter.quote(model_schema) }}.{{ adapter.quote(model_table) }} (
{%- for index_column in index_columns -%}
{{ adapter.quote(index_column) }}{%- if not loop.last -%}, {% endif -%}
{%- endfor -%}
  )
;
{%- endset %}

{{ dummy_statements }}

{% endif %}

{% endmacro %}

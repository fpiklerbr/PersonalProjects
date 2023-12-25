{%- macro source_model_filter(source_name, table_name) -%}

{%- if execute -%}

{%- set source_docs = source_table_docs(source_name, table_name) -%}

{%- set filters = ['1=1'] -%}
{%- set exclusions = source_docs.meta.get('exclusions') if source_docs.meta.get('exclusions') else {} -%}
{%- set incremental_logic = source_docs.meta.get('incremental_logic') -%}
{%- set base_limit = var('base_limit')|int -%}

{%- for column_name, excluded_values in exclusions.items() -%}
  {%- set exclusion -%}
    {{- column_name }} NOT IN (
      {%- for excluded_value in excluded_values -%}
      '{{ excluded_value }}'{{- '' if loop.last else ', ' -}}
      {%- endfor -%}
    )
  {%- endset -%}
  {%- do filters.append(exclusion) -%}
{% endfor -%}

{%- if incremental_logic -%}
  {%- set all_columns = source_model_columns(source_name, table_name) -%}
  {%- set column = all_columns.get(incremental_logic.get('column')) -%}
  {%- set operator = incremental_logic.get('operator') if incremental_logic.get('operator') else '>' -%}
  {%- set aggregation = incremental_logic.get('aggregation') if incremental_logic.get('aggregation') else 'max' -%}
  {%- set order_by -%}
      ORDER BY {{ column.name if target.type == 'postgres' else column.expression }}{{ '' if operator == '>' else ' DESC' }}
  {%- endset -%}

  {%- if is_incremental() -%}
    {%- set incremental_filter -%}
      {{- column.name if target.type == 'postgres' else column.expression }} {{ operator }} (SELECT {{ aggregation -}} ( {{- column.alias -}} ) FROM {{ this -}} )
    {%- endset -%}
    {%- do filters.append(incremental_filter) -%}
  {%- endif -%}
{%- endif -%}

{%- for filter in filters %}
{{ 'WHERE' if loop.first else 'AND' }} {{ filter }}
{%- endfor -%}

{%- if base_limit >= 0 -%}
  {%- if source_docs.loaded_at_field and not incremental_logic -%}
    {%- set order_by -%}
      ORDER BY {{ source_docs.loaded_at_field }} DESC
    {%- endset -%}
  {%- endif %}
{{ order_by if order_by else '' }}
LIMIT {{ base_limit }}
{% endif -%}

{%- endif -%}

{%- endmacro -%}
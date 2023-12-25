/* the_new_macro(column = 'col_a', data_type = data_type('int')) */

{%- macro double_cast(column, data_type) -%}
  {{adapter.dispatch('double_cast')(column, data_type)}}
{%- endmacro -%}

{%- macro default__double_cast(column, data_type) -%}
{%- if data_type == 'boolean' -%}
CAST(CAST({{column}} AS int) AS boolean)
{%- else -%}
CAST({{column}} AS {{data_type}})
{%- endif -%}
{%- endmacro -%}

{%- macro bigquery__double_cast(column, data_type) -%}
{%- if data_type == 'int64' -%}
CAST(CAST({{column}} AS float64) AS int64)
{%- elif data_type == 'boolean' -%}
CAST(CAST(CAST({{column}} AS float64) AS int64) AS boolean)
{%- endif -%}
{%- endmacro -%}
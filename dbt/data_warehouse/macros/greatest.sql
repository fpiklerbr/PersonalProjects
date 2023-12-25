{#
-- args:
--     1) data type
--     2) list of column names / sql expressions
--
-- compiled like:
-- nullif(greatest/least(
-- {% for column_name in column_names %}
-- coalesce( {{ column_name }}, {{ a very small/large constant appropriate to the data type }} )
-- {% endfor %}
-- ), {{ the very small/large value }} )
#}

{%- macro greatest(col_type, col_name_list) -%}
  {{adapter.dispatch('greatest')(col_type, col_name_list)}}
{%- endmacro -%}

{%- macro default__greatest(col_type, col_name_list) -%}

    greatest(
     {% for col_name in col_name_list %}
        {%- if not loop.first -%}, {%- endif -%} {{col_name}}
     {% endfor %}
     )

{%- endmacro -%}

{%- macro bigquery__greatest(col_type, col_name_list) -%}

    {%- if col_type in ['float', 'decimal', 'numeric'] -%}
        {%- set small_value = '-9.9999999999999999999999999999999999999E+28' -%}
    {%- elif col_type == 'integer' -%}
        {%- set small_value = '-9223372036854775808' -%}
    {%- elif col_type in ['timestamp', 'timestamptz'] -%}
        {%- set small_value = '0001-01-01 00:00:00' -%}
    {%- elif col_type == 'date' -%}
        {%- set small_value = '0001-01-01' -%}
    {%- endif -%}

  nullif(
     greatest(
      {% for col_name in col_name_list %}
         {%- if not loop.first -%}, {%- endif -%} coalesce({{col_name}}, CAST('{{small_value}}' AS {{data_type(col_type)}}))
      {% endfor %}
      )
     , CAST('{{small_value}}' AS {{data_type(col_type)}})
  )

{%- endmacro -%}
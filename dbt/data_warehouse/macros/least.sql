{%- macro least(col_type, col_name_list) -%}
  {{adapter.dispatch('least')(col_type, col_name_list)}}
{%- endmacro -%}

{%- macro default__least(col_type, col_name_list) -%}

    least(
     {% for col_name in col_name_list %}
        {%- if not loop.first -%}, {%- endif -%} {{col_name}}
     {% endfor %}
     )

{%- endmacro -%}

{%- macro bigquery__least(col_type, col_name_list) -%}

    {%- if col_type in ['float', 'decimal', 'numeric'] -%}
        {%- set large_value = '9.9999999999999999999999999999999999999E+28' -%}
    {%- elif col_type == 'integer' -%}
        {%- set large_value = '9223372036854775807' -%}
    {%- elif col_type in ['timestamp', 'timestamptz'] -%}
        {%- set large_value = '9999-12-31 23:59:59' -%}
    {%- elif col_type == 'date' -%}
        {%- set large_value = '9999-12-31' -%}
    {%- endif -%}

  nullif(
     least(
      {% for col_name in col_name_list %}
         {%- if not loop.first -%}, {%- endif -%} coalesce({{col_name}}, CAST('{{large_value}}' AS {{data_type(col_type)}}))
      {% endfor %}
      )
     , CAST('{{large_value}}' AS {{data_type(col_type)}})
  )

{%- endmacro -%}
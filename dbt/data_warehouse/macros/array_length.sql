{%- macro array_length(col_name) -%}
  {{adapter.dispatch('array_length')(col_name)}}
{%- endmacro -%}

{%- macro default__array_length(col_name) -%}

array_length({{col_name}}, 1)

{%- endmacro -%}

{%- macro bigquery__array_length(col_name) -%}

array_length({{col_name}})

{%- endmacro -%}


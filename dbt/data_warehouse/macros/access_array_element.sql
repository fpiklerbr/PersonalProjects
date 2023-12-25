{%- macro access_array_element(col_name, index) -%}
  {{adapter.dispatch('access_array_element')(col_name, index)}}
{%- endmacro -%}

{%- macro default__access_array_element(col_name, index) -%}

{{col_name}}[{{index}}]

{%- endmacro -%}

{%- macro bigquery__access_array_element(col_name, index) -%}

{{col_name}}[ORDINAL({{index}})]

{%- endmacro -%}


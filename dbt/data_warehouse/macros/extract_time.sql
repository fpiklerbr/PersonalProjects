{%- macro extract_time(col_name) -%}
  {{adapter.dispatch('extract_time')(col_name)}}
{%- endmacro -%}

{%- macro default__extract_time(col_name) -%}

    CAST({{col_name}} AS time)

{%- endmacro -%}

{%- macro bigquery__extract_time(col_name) -%}

    EXTRACT(TIME from {{col_name}})

{%- endmacro -%}

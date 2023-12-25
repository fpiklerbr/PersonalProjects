{%- macro unnest_json(col_name, json_type) -%}
  {{adapter.dispatch('unnest_json')(col_name, json_type)}}
{%- endmacro -%}

{%- macro default__unnest_json(col_name, json_type) -%}
    {%- if json_type == 'jsonb' -%}
        {%- set json_elements = "jsonb_array_elements_text" -%}
    {%- else -%}
        {%- set json_elements = "json_array_elements_text" -%}
    {%- endif -%}
    {{json_elements}}({{col_name}})

{%- endmacro -%}

{%- macro bigquery__unnest_json(col_name, json_type) -%}

UNNEST(JSON_EXTRACT_ARRAY({{col_name}}))

{%- endmacro -%}
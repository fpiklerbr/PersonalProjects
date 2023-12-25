{%- macro json_extract_as_array(col_name, json_type, path_list) -%}
  {{adapter.dispatch('json_extract_as_array')(col_name, json_type, path_list)}}
{%- endmacro -%}

{%- macro default__json_extract_as_array(col_name, json_type, path_list) -%}

CAST( {{col_name}} AS {{json_type}} )
{%- for obj in path_list -%}
    {%- for key, value in obj.items() -%}
        {%- if value == 'text' -%}
            {%- set operator = '->>' -%}
        {%- elif value == 'array' -%}
            {%- set operator = '->' -%}
        {%- endif -%}
            {%- if key is number -%}
                {{operator}} {{key}}
            {%- else -%}
                {{operator}} '{{key}}'
            {%-endif -%}
    {%- endfor -%}
{%- endfor -%}

{%- endmacro -%}

{%- macro bigquery__json_extract_as_array(col_name, json_type, path_list) -%}

{%- set jsonPath = ['$'] -%}
{%- for obj in path_list -%}
    {%- for key, value in obj.items() -%}
        {%- do jsonPath.append(key) -%}
    {%- endfor -%}
{%- endfor -%}
JSON_EXTRACT( {{col_name}}, '{{ jsonPath|join('.') }}' )


{%- endmacro -%}

{#
--get the last operator to verify scalar json or json
 #}
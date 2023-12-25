{#- see macros/generate_base_model_from_source_table.yml and macros/docs.md for documentation -#}

{%- macro source_model_sql(source_name, table_name) -%}

{%- if not execute -%}

    SELECT * FROM {{ source(source_name, table_name) }}

{%- else -%}
    {%- set layers_info = source_model_layers(source_name, table_name)  -%}

    {%- for layer_info in layers_info %}

        {%- if loop.index == 1 -%}
            {%- set sql_header = 'WITH layer_0 AS ( ' if target.type == 'bigquery' -%}
            {%- set sql_footer = ' ) ' if target.type == 'bigquery' -%}
            {%- set sql_statement %}
                {{sql_header}}
                {{ source_model_layer_sql(**layer_info) }}
                {{sql_footer}}
            {%- endset -%}
            {%- do layers_info[loop.index-1].update({'compiled_sql': sql_statement}) -%}

        {%- else -%}
            {%- set previous_statement = layers_info[loop.index-2].get('compiled_sql') -%}
            {%- set current_statement = source_model_layer_sql(**layer_info) -%}
            {%- if target.type == 'postgres' -%}
                {%- set sql_statement = current_statement|replace(layer_info.from, '( ' ~ previous_statement ~ ' ) AS ' ~ layer_info.from) %}
            {%- else -%}
                {%- set sql_header = previous_statement ~ ', ' ~ layer_info.name ~ ' AS ( ' -%}
                {%- set sql_footer = ' ) SELECT * FROM final ' if layer_info.name == 'final' else ' ) ' -%}
                {%- set sql_statement %}
                    {{sql_header}}
                    {{source_model_layer_sql(**layer_info)}}
                    {{sql_footer}}
                {%- endset -%}
            {%- endif -%}
            {%- do layers_info[loop.index-1].update({'compiled_sql': sql_statement}) -%}

        {%- endif -%}

    {%- endfor %}

    {{ layers_info[(layers_info|length)-1].get('compiled_sql') }}

{%- endif -%}

{%- endmacro -%}

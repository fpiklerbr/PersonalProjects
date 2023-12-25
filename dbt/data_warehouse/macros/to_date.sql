{%- macro to_date(col, string_pattern) -%}
  {{adapter.dispatch('to_date')(col, string_pattern)}}
{%- endmacro -%}

{% macro default__to_date(col, string_pattern) %}

to_date({{col}}, {{string_pattern}})

{% endmacro %}

{%- macro bigquery__to_date(col, string_pattern) -%}

{%- set pattern_dict = {'DD':'%d'
                      , 'MM':'%m'
                      , 'YYYY':'%Y'
                      , 'YY':'%y'} -%}
{%- set qualified_pattern -%}
    {%- for pg_pattern, bq_pattern in pattern_dict.items() -%}
        replace(
    {%- endfor -%}
        {{string_pattern|upper}}
    {%- for pg_pattern, bq_pattern in pattern_dict.items() -%}
        ,'{{pg_pattern}}','{{bq_pattern}}')
    {%- endfor -%}
{%- endset -%}

parse_date( {{qualified_pattern}}, {{col}})

{%- endmacro -%}


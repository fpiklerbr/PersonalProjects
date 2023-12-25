
{%- macro format_date(col, string_pattern) -%}
  {{adapter.dispatch('format_date')(col, string_pattern)}}
{%- endmacro -%}

{% macro default__format_date(col, string_pattern) %}

to_char({{col}}, {{string_pattern}})

{% endmacro %}

{%- macro bigquery__format_date(col, string_pattern) -%}

{% set pattern_dict = {
    'Day':'%A','Q':'%Q','YYYY':'%Y','Month':'%B'
    , 'MM':'%m'
} %}

{%- set qualified_pattern -%}
    {%- for pg_pattern, bq_pattern in pattern_dict.items() -%}
        replace(
    {%- endfor -%}
        {{string_pattern}}
    {%- for pg_pattern, bq_pattern in pattern_dict.items() -%}
        ,'{{pg_pattern}}','{{bq_pattern}}')
    {%- endfor -%}
{%- endset -%}

FORMAT_DATE({{qualified_pattern}}, {{col}})

{%- endmacro -%}


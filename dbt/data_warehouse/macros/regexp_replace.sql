{% macro regexp_replace(string, pattern, replacement, flag, output_type='text') %}
  {{adapter.dispatch('regexp_replace')(string, pattern, replacement, flag, output_type)}}
{% endmacro %}


{%- macro default__regexp_replace(string, pattern, replacement, flag, output_type='text') -%}
        CAST(regexp_replace({{string}}
        , {{pattern}}
        , {{replacement}}
        , {{flag}}) AS {{data_type(output_type)}})
{%- endmacro %}


{% macro bigquery__regexp_replace(string, pattern, replacement, flag, output_type='text') %}
    {%- set raw_string = "" if pattern[:6] in ('substr','concat') else "r" -%}
    {%- set bq_pattern = raw_string ~ pattern -%}
    CAST(regexp_replace({{string}}, {{bq_pattern}}, {{replacement}}) AS {{data_type(output_type)}})

{% endmacro %}

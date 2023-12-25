{%- macro to_timestamp(col, string_pattern, with_tz, millisecond) -%}
  {{adapter.dispatch('to_timestamp')(col, string_pattern, with_tz, millisecond)}}
{%- endmacro -%}

{% macro default__to_timestamp(col, string_pattern, with_tz, millisecond) %}

to_timestamp({{col}}, {{string_pattern}})

{% endmacro %}

{%- macro bigquery__to_timestamp(col, string_pattern, with_tz, millisecond) -%}

{%- set string_pattern_tz = string_pattern[:-1] ~ " %Z'" if with_tz == True else string_pattern -%}

{%- set pattern_dict = {
    'DD':'%d', 'MM':'%m', 'YYYY':'%Y'
    , 'HH24':'%H','MI':'%M'} -%}

{%- if millisecond == True -%}
    {% do pattern_dict.update({'SS':'%E*S'}) %}
{%- else -%}
    {% do pattern_dict.update({'SS':'%S'}) %}
{%- endif -%}

{%- set qualified_pattern -%}
    {%- for pg_pattern, bq_pattern in pattern_dict.items() -%}
        replace(
    {%- endfor -%}
        {{string_pattern_tz|upper}}
    {%- for pg_pattern, bq_pattern in pattern_dict.items() -%}
        ,'{{pg_pattern}}','{{bq_pattern}}')
    {%- endfor -%}
{%- endset -%}

parse_timestamp( {{qualified_pattern}}, {{col}})

{%- endmacro -%}


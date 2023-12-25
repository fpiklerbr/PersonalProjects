{% macro regexp_contains(col_name, pattern, similar, case_sensitive) %}
{# r(?i) handle the case_sensitive #}

  {{adapter.dispatch('regexp_contains')(col_name, pattern, similar, case_sensitive)}}

{% endmacro %}

{%- macro default__regexp_contains(col_name, pattern, similar, case_sensitive) -%}

{%- if similar == True -%}
    {%- if case_sensitive == True -%}
        {{col_name}} ~ {{pattern}}
    {%- elif case_sensitive == False -%}
        {{col_name}} ~* {{pattern}}
    {%- endif -%}
{%- else -%}
    {%- if case_sensitive == True -%}
        {{col_name}} !~ {{pattern}}
    {%- elif case_sensitive == False -%}
        {{col_name}} !~* {{pattern}}
    {%- endif -%}
{%- endif -%}

{%- endmacro %}

{% macro bigquery__regexp_contains(col_name, pattern, similar, case_sensitive) %}

{%- if similar == True -%}
    {%- if case_sensitive == True -%}
        {%- set sensitive_pattern = pattern if pattern[:5] in ['upper','lower'] else "r" ~ pattern -%}
        regexp_contains({{col_name}}, {{sensitive_pattern}})
    {%- elif case_sensitive == False -%}
        {%- set insensitive_pattern = pattern if pattern[:5] in ['upper','lower'] else "r'(?i)" ~ pattern[1:] -%}
        regexp_contains({{col_name}}, {{insensitive_pattern}})
    {%- endif -%}
{%- else -%}
    {%- if case_sensitive == True -%}
        {%- set sensitive_pattern = pattern if pattern[:5] in ['upper','lower'] else "r" ~ pattern -%}
        not regexp_contains({{col_name}}, {{sensitive_pattern}})
    {%- elif case_sensitive == False -%}
        {%- set insensitive_pattern = pattern if pattern[:5] in ['upper','lower'] else "r'(?i)" ~ pattern[1:] -%}
        not regexp_contains({{col_name}}, {{insensitive_pattern}})
    {%- endif -%}
{%- endif -%}

{% endmacro %}

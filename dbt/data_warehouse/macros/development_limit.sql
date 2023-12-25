{% macro development_limit(num_rows=1000, sort_field='', sort_descending=True) %}
    {%- if target.name == 'dev' and var('apply_dev_limit') == True -%}
        {%- if sort_field != '' -%}
        ORDER BY {{ sort_field }} {%- if sort_descending %} DESC {% endif -%}
        {%- endif -%}
        LIMIT {{ num_rows }}
    {%- endif -%}
{% endmacro %}

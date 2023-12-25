{%- macro array_agg(col_name, distinct, ignore_nulls) -%}
  {{adapter.dispatch('array_agg')(col_name, distinct, ignore_nulls)}}
{%- endmacro -%}

{%- macro default__array_agg(col_name, distinct, ignore_nulls) -%}

array_agg({%-if distinct == True %}DISTINCT{%-endif %} {{col_name}})

{%- endmacro -%}

{%- macro bigquery__array_agg(col_name, distinct, ignore_nulls) -%}

array_agg({%-if distinct == True %}DISTINCT{%-endif %} {{col_name}}
        {% if ignore_nulls == True %}IGNORE NULLS{% endif %})

{%- endmacro -%}
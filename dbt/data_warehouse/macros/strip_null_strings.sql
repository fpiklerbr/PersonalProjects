
/* none type value could be ['NaN', 'None', 'Null', 'NaT'] and upper& lower case for everything */
{% macro strip_null_strings(col_name, include_list =['NaN', 'None', 'Null', 'NaT'], except_list =[]) -%}

    {%- set arg_list = [] -%}

    {%- for item in include_list -%}
        {%- if item not in except_list -%}
            {%- do arg_list.append(item[0]|upper+ item[1:]|lower) -%}
            {%- do arg_list.append(item|upper) -%}
            {%- do arg_list.append(item|lower) -%}
        {%- endif -%}
    {%- endfor -%}

    {%- for item in arg_list -%}
        nullif(
    {%- endfor -%}
    trim({{col_name}})
    {%- for item in arg_list -%}
        , '{{item}}')
    {%- endfor -%}

{%- endmacro -%}
{%- macro end_of_time() -%}
cast('2038-01-19 03:14:08' AS {{ data_type('timestamptz') -}} )
{%- endmacro -%}

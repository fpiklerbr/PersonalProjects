{%- macro beginning_of_time() -%}
cast('1970-01-01 00:00:00' AS {{ data_type('timestamptz') -}} )
{%- endmacro -%}

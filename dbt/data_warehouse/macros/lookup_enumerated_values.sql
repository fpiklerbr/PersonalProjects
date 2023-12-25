{%- macro lookup_enumerated_values(enumerated_column, enumerated_values, output_type = 'text', input_type = None) -%}
  {{ adapter.dispatch('lookup_enumerated_values')(enumerated_column, enumerated_values, output_type, input_type) }}
{%- endmacro -%}

{% macro default__lookup_enumerated_values(enumerated_column, enumerated_values, output_type = 'text', input_type = None) -%}

{%- set enumerated_value -%}
  {%- if input_type in integer_types() -%}
    {{- dbt_utils.safe_cast(
      field = dbt_utils.safe_cast(field = enumerated_column, type = data_type('float')),
      type = data_type(input_type))
    -}}
  {%- elif input_type -%}
    {{- dbt_utils.safe_cast(field = enumerated_column, type = data_type(input_type)) -}}
  {%- else -%}
    {{- enumerated_column -}}
  {%- endif -%}
{%- endset -%}

CASE {{ enumerated_value }}
{%- for k, v in enumerated_values.items() %}
WHEN {{ k if k is number else "'" ~ k ~ "'" }} THEN cast( '{{ v }}' AS {{ data_type(output_type) -}} )
{%- endfor %}
ELSE cast( {{- enumerated_column }} AS {{ data_type(output_type) -}} )
END

{%- endmacro %}

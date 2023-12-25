{%- macro source_model_layer_sql(
  name,
  star,
  columns,
  from,
  filter
) -%}
{%- set well_this_is_a_kwargs = kwargs -%}

SELECT
{{ '    *' if star == True else '' -}}
{%- for column in columns %}
{{ '    ' if loop.first and star == False else '  , ' -}}
  {{- column.expression }} AS {{ adapter.quote(column.alias) -}}
{%- endfor %}
FROM {{ from }}
{{ filter }}

{%- endmacro -%}
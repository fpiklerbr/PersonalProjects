{#-
1) json_object - a sql expression that evaluates to a json object
2) element_path - a list of strings and/or ints representing the path of the element to be extracted
3) output_type - a string representing the data type of the extracted element
  text (default): returns the extracted element as text
  json: preserves the extracted element as a json object for further processing downstream.
  anything else: extracts the element as text, then casts before returning
-#}

{%- macro json_extract_element(json_object, element_path, output_type = 'text') -%}
  {{adapter.dispatch('json_extract_element')(json_object, element_path, output_type)}}
{%- endmacro -%}

{%- macro default__json_extract_element(json_object, element_path, output_type = 'text') -%}

{% set extracted_element -%}
  {{- json_object -}}
  {%- for obj in element_path -%}
    {{- ' ->> ' if loop.last and output_type != 'json' else ' -> ' -}}{{- obj if obj is number else "'" ~ obj ~ "'" -}}
  {%- endfor -%}
{%- endset %}

{% if output_type in ['json', 'text'] %}
  ( {{- extracted_element -}} )
{%- else -%}
  {{- dbt_utils.safe_cast(field = extracted_element, type = data_type(output_type)) -}}
{%- endif -%}

{%- endmacro -%}

{%- macro bigquery__json_extract_element(json_object, element_path, output_type = 'text') -%}

{%- set path_from_root = ["$"] -%}
{%- do path_from_root.extend(element_path) -%}

{%- set extracted_element -%}
  {{- 'JSON_EXTRACT' if output_type == 'json' else 'JSON_EXTRACT_SCALAR' -}}(
      {{- json_object -}}
    , '{{ path_from_root|join(".") -}}'
  )
{%- endset -%}

{%- if output_type in ['json', 'text'] -%}
  ( {{- extracted_element -}} )
{% elif output_type in integer_types() %}
  {{- dbt_utils.safe_cast(
      field = dbt_utils.safe_cast(field = extracted_element, type = data_type('float'))
    , type = data_type(output_type)
  ) -}}
{%- else -%}
  {{- dbt_utils.safe_cast(field = extracted_element, type = data_type(output_type)) -}}
{%- endif -%}

{%- endmacro -%}

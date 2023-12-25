{%- macro get_source_attribute(source_name, table_name, attribute_name) -%}
  {%- if execute -%}
  {%- set source_config = graph.sources.get( ['source', project_name, source_name, table_name]|join('.') ) -%}
    {%- if source_config -%}
      {{- return(source_config.get(attribute_name)) -}}
    {%- endif -%}
  {%- endif -%}
{%- endmacro -%}
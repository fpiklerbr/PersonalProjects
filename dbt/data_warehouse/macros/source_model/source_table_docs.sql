{%- macro source_table_docs(source_name, table_name) -%}

{%- if execute -%}
  {%- do return(graph.sources.get(['source', project_name, source_name, table_name]|join('.'))) -%}
{%- endif -%}

{%- endmacro -%}

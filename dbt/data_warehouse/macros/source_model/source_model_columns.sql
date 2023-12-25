{%- macro source_model_columns(source_name, table_name) -%}

{%- if execute -%}

{%- set source_docs = source_table_docs(source_name, table_name) -%}
{%- set documented_columns = source_docs.columns -%}

{#- get columns actually present in db to compare against documented_columns -#}
{%- set db_columns = {} -%}
{%- set columns_in_relation = adapter.get_columns_in_relation(source(source_name, table_name)) -%}
{%- for c in columns_in_relation -%}
  {%- do db_columns.update({c.name: c.data_type}) -%}
{%- endfor -%}

{#- Parse documented_columns for consistency -#}
{%- set all_columns = {} -%}
{%- for documented_properties in documented_columns.values() -%}

  {%- do documented_properties.update({'raw_type': db_columns.get(documented_properties.name)}) -%}
  {%- set documented_type = documented_properties.get('type') if documented_properties.get('type') else documented_properties.get('data_type') -%}
  {%- do documented_properties.update({'refined_type': documented_type if documented_type else 'text'}) -%}

  {%- set documented_refinement_layer = documented_properties.meta.get('refinement_layer') | int -%}
  {%- if 'sql' in documented_properties.meta.keys() -%}
    {%- set default_refinement_layer = 1 -%}
  {%- elif 'macro' in documented_properties.meta.keys() -%}
    {%- set default_refinement_layer = 2 -%}
  {%- elif 'sql_after_macro' in documented_properties.meta.keys() -%}
    {%- set default_refinement_layer = 3 -%}
  {%- elif 'macro_after_macro' in documented_properties.meta.keys() -%}
    {%- set default_refinement_layer = 4 -%}
  {%- else -%}
    {%- set default_refinement_layer = 0 -%}
  {%- endif -%}

  {%- set parsed_properties = {} -%}
  {%- do parsed_properties.update({'name': documented_properties.name}) -%}
  {%- do parsed_properties.update(
    {'refinement_layer': documented_refinement_layer if documented_refinement_layer else default_refinement_layer}
  ) -%}
  {%- do parsed_properties.update({'is_hidden': 'is_hidden' in documented_properties.meta.keys()}) -%}
  {%- do parsed_properties.update({'is_hashed': documented_properties.meta.get('pii_level')|int > 0 and target.type == 'bigquery'}) -%}
  {%- do parsed_properties.update({'expression': source_model_column_expression(**documented_properties)}) -%}
  {%- do parsed_properties.update({'alias': documented_properties.meta.get('alias') if documented_properties.meta.get('alias') else documented_properties.name}) -%}
  {%- do parsed_properties.update({'documented_properties': documented_properties}) -%}

  {%- do all_columns.update({parsed_properties.name: parsed_properties}) -%}

{%- endfor -%}

{# append any undocumented columns #}
{%- for column in db_columns.keys() -%}
  {%- if column not in all_columns.keys() -%}
    {%- set properties = {
      'name': column,
      'refinement_layer': 0,
      'is_hidden': False,
      'is_hashed': False,
      'expression': adapter.quote(column),
      'alias': '_raw_' ~ column,
      'documented_properties': {}
    } -%}
    {%- do all_columns.update({column: properties}) -%}
  {%- endif -%}
{%- endfor -%}

{%- do return(all_columns) -%}

{%- endif -%}

{%- endmacro -%}

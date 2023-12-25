{%- macro source_model_layers(source_name, table_name) -%}

{%- if execute -%}

{%- set all_columns = source_model_columns(source_name, table_name) -%}

{%- set all_layers = {} -%}
{%- set layer_columns = {} -%}

{#- get all refinement_layer values from columns -#}
{%- set refinement_layers = [] -%}
{%- for column in all_columns.values() -%}
  {% do refinement_layers.append(column.refinement_layer) -%}
{%- endfor -%}

{#- dedupe & sort refinement_layer values -#}
{%- set refinement_layers = (refinement_layers|unique)|sort -%}

{#- pack a dict for each layer -#}
{%- for n in range(refinement_layers|length) -%}
  {%- set layer_name = 'layer_' ~ refinement_layers[n] -%}
  {%- do all_layers.update({layer_name: {
    'name': layer_name,
    'star': True if n > 0 else False,
    'columns': [],
    'from': 'layer_' ~ refinement_layers[n-1] if n > 0 else source(source_name, table_name),
    'filter': source_model_filter(source_name, table_name) if n == 0 else 'WHERE 1=1'
  }}) -%}
  {%- do layer_columns.update({layer_name: []}) -%}
{%- endfor -%}

{#- loop through all columns to get lists by layer, plus a list for the final layer with its own logic -#}
{%- set final_columns = [] -%}
{%- for column in all_columns.values() -%}

  {%- do layer_columns['layer_' ~ column.refinement_layer].append(column) -%}

  {%- if column.is_hidden == False -%}
    {%- do final_columns.append({
      'name': column.name,
      'refinement_layer': 'final',
      'is_hidden': False,
      'is_hashed': column.is_hashed,
      'expression': dbt_utils.hash(adapter.quote(column.alias)) if column.is_hashed else adapter.quote(column.alias),
      'alias': column.alias,
    }) -%}
  {%- endif -%}

{%- endfor -%}

{#- add the list of columns to each layer -#}
{%- for n in range(refinement_layers|length) -%}
  {%- set layer_name = 'layer_' ~ refinement_layers[n] -%}
  {%- do all_layers[layer_name].update({
    'columns': layer_columns.get(layer_name)
  }) -%}
{%- endfor -%}

{#- add the final layer -#}
{%- do all_layers.update({
  'final': {
    'name': 'final',
    'star': False,
    'columns': final_columns,
    'from': 'layer_' ~ refinement_layers[-1],
    'filter': 'WHERE 1=1',
  }
}) -%}

{%- do return(all_layers.values()|list) -%}

{%- endif -%}

{%- endmacro -%}

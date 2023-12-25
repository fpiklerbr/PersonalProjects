{%- macro column_name_dict(model, col_name) -%}
  {{adapter.dispatch('column_name_dict')(model, col_name)}}
{%- endmacro -%}


{%- macro default__column_name_dict(model, col_name) -%}

  {%- set lookup_table = ref('lookup_column_names') -%}
  {%- set lookup_filter = "WHERE table_name = '" ~ model ~ "' AND column_name_bq = '" ~ col_name ~ "'" -%}
  {%- set fetch_col = get_column_values_with_filter(table = lookup_table, column = 'column_name_pg', where_clause = lookup_filter)[0] -%}
    {{fetch_col}}

{%- endmacro -%}

{%- macro bigquery__column_name_dict(model, col_name) -%}

    {{col_name}}

{%- endmacro -%}
{#- see macros/generate_base_model_from_source_table.yml and macros/docs.md for documentation -#}

{%- macro integer_types() -%}
  {{- return(['int', 'bigint', 'smallint', 'integer']) -}}
{%- endmacro -%}

{%- macro generate_base_model_from_source_table(source_name, table_name, incremental_filter = None) -%}

{%- set source_relation = source(source_name, table_name) -%}

{%- if not execute -%}

SELECT * FROM {{ source_relation }}

{%- else -%}

{%- set default_nulls = ['nan', 'None', '', 'NaT'] -%}
{%- set base_limit = var('base_limit') | int -%}
{%- set supported_macros = ['json_extract_element', 'lookup_enumerated_values'
    , 'convert_timestamptz_to_timestamp','localize_timestamp_to_timestamptz'
    ,'get_order_id_from_alipay_transaction','string_to_array','split_part'
    ,'string_to_timestamptz','regexp_extract'] -%}

{%- set boolean_types = ['bool', 'boolean'] -%}
{%- set default_trues = ['T', 'TRUE', '1', '1.0'] -%}
{%- set default_falses = ['F', 'FALSE', '0', '0.0'] -%}

{%- set source_config = graph.sources.get(['source', project_name, source_name, table_name]|join('.')) -%}
{%- set yml_columns = source_config.columns -%}
{%- set loaded_at_field = source_config.loaded_at_field -%}

{%- set db_columns = {} -%}
{%- set columns_in_relation = adapter.get_columns_in_relation(source_relation) -%}
{%- for c in columns_in_relation -%}
  {%- do db_columns.update({c.name: c.data_type}) -%}
{%- endfor -%}

{%- set array_columns = [] -%}
{% for col_name in db_columns.keys() -%}
    {%- set col_type = db_columns.get(col_name)|lower -%}
    {%- if col_type[:5] == 'array' or col_type[:6] == 'struct' -%}
        {%- do array_columns.append(col_name) -%}
    {% endif %}
{% endfor %}

{%- set sql_columns = {} -%}
{%- set macro_columns = {} -%}
{%- set sql_after_macro_columns = {} -%}
{%- set macro_after_macro_columns = {} -%}
{% for yml_column in yml_columns.values() -%}
  {%- if 'sql' in yml_column.meta.keys() -%}
    {%- do sql_columns.update({yml_column.name: yml_column}) -%}
  {%- elif 'macro' in yml_column.meta.keys() -%}
    {%- do macro_columns.update({yml_column.name: yml_column}) -%}
  {%- elif 'sql_after_macro' in yml_column.meta.keys() -%}
    {%- do sql_after_macro_columns.update({yml_column.name: yml_column}) -%}
  {%- elif 'macro_after_macro' in yml_column.meta.keys() -%}
    {%- do macro_after_macro_columns.update({yml_column.name: yml_column}) -%}
  {%- endif -%}
{%- endfor -%}

{%- set source_select_statement %}

SELECT
{% for yml_column in yml_columns.values() -%}

{%- if yml_column.name not in sql_columns.keys()
    and yml_column.name not in macro_columns.keys()
    and yml_column.name not in sql_after_macro_columns.keys()
    and yml_column.name not in macro_after_macro_columns.keys() -%}

{%- set yml_meta = yml_column.meta -%}

{%- set null_values = yml_meta.get('null_values') if yml_meta.get('null_values') else [] -%}
{%- set allowed_values = yml_meta.get('allowed_values') if yml_meta.get('allowed_values') else [] -%}
{%- do null_values.extend(default_nulls) -%}
{%- set null_values = null_values | reject('in', allowed_values) -%}
{%- set null_tuple -%}
    {%- if null_values -%}
      ( {%- for null_value in null_values -%}'{{ null_value }}'{%- if not loop.last -%}, {%- endif %}{% endfor -%} )
    {%- else -%}
      ( NULL )
    {%- endif -%}
{%- endset -%}

{%- set column_alias = adapter.quote(yml_column.name if not yml_meta.get('alias') else yml_meta.get('alias')) -%}

{%- set column_type = yml_column.data_type if not yml_column.get('type') else yml_column.get('type') -%}
{%- set column_type = 'text' if not column_type else column_type -%}

{%- set local_timezone = yml_meta.get('local_timezone') -%}
{%- set format_string = yml_meta.get('format_string') -%}

{%- if yml_column.name in array_columns and target.type == 'bigquery' and column_type != 'record' -%}

  {%- set column_trimmed -%}
      to_json_string({{adapter.quote(yml_column.name)}}, True)
  {%- endset -%}

{%- else -%}

{%- set trim_substring = None -%}
{%- if yml_meta.get('trim_substring') -%}
  {%- set trim_substring = concat_ws("", [
    string_literal(yml_meta.get('trim_substring'), escaping_backslashes = True),
    all_whitespace_characters(),
  ]) -%}
{% endif %}

{%- set column_trimmed = string_trim(
    string = adapter.quote(yml_column.name) if yml_column.name in db_columns.keys() else 'NULL'
  , substring = trim_substring
) -%}

{%- if yml_meta.get('replace_substring') -%}
{%- set replace_from = string_literal(yml_meta.replace_substring.from, escaping_backslashes = True) -%}
{%- set replace_to = string_literal(yml_meta.replace_substring.to, escaping_backslashes = True) -%}
{%- set column_trimmed -%}
replace( {{- column_trimmed }}, {{ replace_from }}, {{ replace_to -}} )
{%- endset -%}
{% endif %}

{%- endif -%} {# end of set column_trimmed including both array and normal cols #}

{%- set column_stripped -%}
CASE WHEN {{ column_trimmed }} IN {{ null_tuple }} THEN NULL ELSE {{ column_trimmed }} END
{%- endset -%}

{%- set column_expression -%}

  {%- if yml_column.name in array_columns and target.type == 'bigquery' and column_type == 'record' -%}
    {{ adapter.quote(yml_column.name) }}

  {%- elif column_type in ['date', 'timestamp', 'timestamptz'] -%}
      {%- if format_string -%}
          {%- set datetime_column = string_to_timestamptz(timestamp_string= column_stripped, format_string= "'" ~format_string~ "'") -%}
      {%- else -%}
          {%- set datetime_column = dbt_utils.safe_cast(field = column_stripped, type = data_type('timestamptz')) -%}
      {%- endif -%}

      {%- if column_type == 'timestamptz' -%}
          {%- if local_timezone -%}
            {{- localize_timestamp_to_timestamptz(naive_timestamp = datetime_column, local_timezone = "'" ~ local_timezone ~ "'") -}}
          {%- else -%}
            {{ datetime_column }}
          {%- endif -%}
      {%- else -%}
          {{- dbt_utils.safe_cast(field = datetime_column, type = data_type(column_type)) -}}
      {%- endif -%}

  {%- elif column_type in integer_types() -%}
    {{- dbt_utils.safe_cast(
        field = dbt_utils.safe_cast(field = column_stripped, type = data_type('float'))
      , type = data_type(column_type))
    -}}
  {%- elif column_type in boolean_types -%}
    {%- set true_values = yml_meta.get('true_values') if yml_meta.get('true_values') else default_trues -%}
    {%- set false_values = yml_meta.get('false_values') if yml_meta.get('false_values') else default_falses -%}
    {%- set true_tuple -%}
      ( {%- for true_value in true_values -%}'{{ true_value }}'{%- if not loop.last -%}, {%- endif %}{% endfor -%} )
    {%- endset -%}
    {%- set false_tuple -%}
      ( {%- for false_value in false_values -%}'{{ false_value }}'{%- if not loop.last -%}, {%- endif %}{% endfor -%} )
    {%- endset -%}
    cast(
      CASE
        WHEN upper( {{ column_stripped }} ) IN {{ true_tuple }} THEN TRUE
        WHEN upper( {{ column_stripped }} ) IN {{ false_tuple }} THEN FALSE
      END
      AS boolean
    )
  {%- else -%}
    {{- dbt_utils.safe_cast(field = column_stripped, type = data_type(column_type)) -}}
  {%- endif -%}
{%- endset -%}

{%- set fill_nulls = yml_meta.get('fill_nulls') -%}
{%- set column_coalesced -%}
  {%- if fill_nulls is not none -%}
    coalesce( {{ column_expression }} , cast('{{ fill_nulls }}' AS {{ data_type(column_type) }} ))
  {%- else -%}
    {{ column_expression }}
  {%- endif -%}
{%- endset -%}

{{- '    ' if loop.first else '  , ' }}{{ column_coalesced }} AS {{ column_alias }}

{% endif -%} {# closing check against macro_columns #}

{%- endfor -%} {# closing loop through yml_columns #}

{%- for db_column in db_columns.keys() -%}
{%- if db_column not in yml_columns.keys() %}
  {{ '  ' if loop.first and not yml_columns else ', ' -}} {{ adapter.quote(db_column) }} AS {{ adapter.quote('_raw_' ~ db_column) }}
{% endif -%}
{%- endfor %}

FROM {{ source_relation }} AS source_table
{%- if incremental_filter %}
{{ incremental_filter }}
{%- elif base_limit >= 0 -%}
{%- if loaded_at_field %}
ORDER BY {{ loaded_at_field }} DESC
{% endif %}
LIMIT {{ base_limit }}
{% endif %}

{% endset -%} {# closing set source_select_statement #}

{%- set source_and_sql_select_statement -%}
{%- if sql_columns %}

SELECT
    *
{% for sql_column in sql_columns.values() -%}
{%- set column_alias = adapter.quote(sql_column.name if not sql_column.meta.get('alias') else sql_column.meta.get('alias')) -%}
{%- set column_type = sql_column.data_type if not sql_column.get('type') else sql_column.get('type') %}
  , {{ dbt_utils.safe_cast(sql_column.meta.sql, data_type('text' if not column_type else column_type)) }} AS {{ column_alias -}}
{%- endfor %} {# closing sql_column loop #}
FROM ( {{ source_select_statement }} ) AS source_select_statement

{% else -%}

{{ source_select_statement }}

{%- endif -%}
{%- endset -%} {# closing set source_and_sql_select_statement #}

{%- set source_and_sql_and_macro_select_statement -%}
{%- if macro_columns %}

SELECT
    *
{% for macro_column in macro_columns.values() -%}
{%- set column_alias = adapter.quote(macro_column.name if not macro_column.meta.get('alias') else macro_column.meta.get('alias')) -%}
{%- set column_type = macro_column.data_type if not macro_column.get('type') else macro_column.get('type') -%}
{%- set column_type = 'text' if not column_type else column_type -%}

{%- set macro_name = (macro_column.meta.macro.keys() | list)[0] -%}
{%- set macro_args = (macro_column.meta.macro.values() | list)[0] -%}
{%- do macro_args.update({'output_type': column_type}) -%}

{%- set column_expression -%}
  {%- if macro_name in supported_macros -%}
    {{ adapter.dispatch(macro_name)(**macro_args) }}
  {%- else -%}
    cast(NULL AS {{ data_type(column_type) -}} )
  {%- endif -%}
{%- endset %}
  , {{ column_expression }} AS {{ column_alias -}}
{%- endfor %} {# closing macro_columns loop #}
FROM ( {{ source_and_sql_select_statement }} ) AS source_and_sql_select_statement

{% else -%}

{{ source_and_sql_select_statement }}

{%- endif -%}
{%- endset %} {# closing set source_and_sql_and_macro_select_statement #}

{%- set after_macro_statement -%}
{%- if sql_after_macro_columns or macro_after_macro_columns -%}

SELECT
    *
{% for sql_after_column in sql_after_macro_columns.values() -%}
{%- set column_alias = adapter.quote(sql_after_column.name if not sql_after_column.meta.get('alias') else sql_after_column.meta.get('alias')) -%}
{%- set column_type = sql_after_column.data_type if not sql_after_column.get('type') else sql_after_column.get('type') %}
  , {{ dbt_utils.safe_cast(sql_after_column.meta.sql_after_macro, data_type('text' if not column_type else column_type)) }} AS {{ column_alias -}}
{%- endfor %} {# closing sql_after_macro_column -> sql part loop #}

{% for macro_column in macro_after_macro_columns.values() -%}

    {%- set column_alias = adapter.quote(macro_column.name if not macro_column.meta.get('alias') else macro_column.meta.get('alias')) -%}
    {%- set column_type = macro_column.data_type if not macro_column.get('type') else macro_column.get('type') -%}
    {%- set column_type = 'text' if not column_type else column_type -%}
    {%- set macro_name = (macro_column.meta.macro_after_macro.keys() | list)[0] -%}
    {%- set macro_args = (macro_column.meta.macro_after_macro.values() | list)[0] -%}
    {%- do macro_args.update({'output_type': column_type}) -%}

    {%- set column_expression -%}
        {%- if macro_name in supported_macros -%}
            {{ adapter.dispatch(macro_name)(**macro_args) }}
        {%- else -%}
            CAST(NULL AS {{ data_type(column_type) -}} )
        {%- endif -%}
    {%- endset %}
    , {{ column_expression }} AS {{ column_alias -}}

{%- endfor %} {# sql_after_macro_column -> macro part loop #}

FROM ( {{ source_and_sql_and_macro_select_statement }} ) AS macro_statement

{% else -%}

{{ source_and_sql_and_macro_select_statement }}

{%- endif -%}
{%- endset -%}  {# closing set after_macro_statement #}

{%- set final_columns = {} -%}
{% for yml_column in yml_columns.values() -%}
  {%- if not yml_column.meta.get('is_hidden') -%}
    {%- do final_columns.update({yml_column.name: yml_column}) -%}
  {%- endif -%}
{%- endfor -%}

{%- set final_statement -%}

  SELECT
  {%- for yml_column in final_columns.values() %}
    {%- set column_alias = adapter.quote(yml_column.name if not yml_column.meta.get('alias') else yml_column.meta.get('alias')) -%}
    {%- if 'pii_level' in yml_column.meta.keys() and yml_column.meta.get('pii_level') > 0 and target.type == 'bigquery' -%}
      {{ '  ' if loop.first else ', ' }} {{ dbt_utils.hash(column_alias) }} AS {{ column_alias }}
    {%- else -%}
      {{ '  ' if loop.first else ', ' }} {{ column_alias }}
    {%- endif -%}
  {%- endfor %}
  {%- for db_column in db_columns.keys() -%}
  {%- if db_column not in yml_columns.keys() %}
    {{ '  ' if loop.first and not final_columns else ', ' }}{{ adapter.quote('_raw_' ~ db_column) -}}
  {%- endif -%}
  {%- endfor %}
  FROM ( {{ after_macro_statement }} ) AS un_ordered

{%- endset -%} {# closing set final_statement #}

{{ final_statement }}

{% endif -%} {# closing check against execute #}

{%- endmacro -%}

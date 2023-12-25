
{%- macro supported_macros() -%}
{{- return(['json_extract_element', 'lookup_enumerated_values'
    , 'convert_timestamptz_to_timestamp','localize_timestamp_to_timestamptz'
    ,'get_order_id_from_alipay_transaction','string_to_array','split_part'
    ,'string_to_timestamptz','regexp_extract','regexp_replace']) -}}
{%- endmacro -%}

{%- macro default_nulls() -%}
    {{- return(['nan', 'None', '', 'NaT']) -}}
{%- endmacro -%}
{%- macro boolean_types() -%}
    {{- return(['bool', 'boolean']) -}}
{%- endmacro -%}
{%- macro default_trues() -%}
    {{- return(['T', 'TRUE', '1', '1.0']) -}}
{%- endmacro -%}
{%- macro default_falses() -%}
    {{- return(['F', 'FALSE', '0', '0.0']) -}}
{%- endmacro -%}


{%- macro source_model_column_expression(
  name,
  meta,
  raw_type,
  refined_type
) -%}

{%- set well_this_is_a_kwargs = kwargs -%}

{%- set sql = meta.get('sql') if meta.get('sql') else meta.get('sql_after_macro') -%}
{%- set macro = meta.get('macro') if meta.get('macro') else meta.get('macro_after_macro') -%}

{%- if macro -%}

    {%- set macro_name = (macro.keys() | list)[0] -%}
    {%- set macro_args = (macro.values() | list)[0] -%}
    {%- do  macro_args.update({'output_type': refined_type}) -%}
    {%- set column_expression -%}
        {%- if macro_name in supported_macros() -%}
            {{ adapter.dispatch(macro_name)(**macro_args) }}
        {%- else -%}
            CAST(NULL AS {{ data_type(refined_type) }})
        {%- endif -%}
    {%- endset %}
    {{ column_expression }}

{%- elif sql -%}

    {{ dbt_utils.safe_cast(sql, data_type(refined_type)) }}

{%- elif not raw_type -%}

    CAST(NULL AS {{ data_type(refined_type) }})

{%- else -%}

    {%- set fill_nulls = meta.get('fill_nulls') -%}
    {%- set null_values = meta.get('null_values') if meta.get('null_values') else [] -%}
    {%- set allowed_values = meta.get('allowed_values') if meta.get('allowed_values') else [] -%}
    {%- do  null_values.extend(default_nulls()) -%}
    {%- set null_values = null_values | reject('in', allowed_values) -%}
    {%- set null_tuple -%}
        {%- if null_values -%}
          ( {%- for null_value in null_values -%}'{{ null_value }}'{%- if not loop.last -%}, {%- endif %}{% endfor -%} )
        {%- else -%}
          ( NULL )
        {%- endif -%}
    {%- endset -%}

    {%- set local_timezone = meta.get('local_timezone') -%}
    {%- set format_string = meta.get('format_string') -%}
    {%- if (raw_type|upper)[:5] == 'ARRAY' or (raw_type|upper)[:6] == 'STRUCT' -%}
        {%- set is_array = True -%}
    {%- else -%}
        {%- set is_array = False -%}
    {%- endif -%}

    {%- set enumeration = meta.get('enumeration') -%}
    {%- set divide_by = meta.get('divide_by') -%}
    {%- set decimal_precision = meta.get('decimal_precision') -%}

    {%- if is_array == True and target.type == 'bigquery' and refined_type != 'record' -%}
        {%- set column_trimmed -%}
            to_json_string({{adapter.quote(name)}}, True)
        {%- endset -%}

    {%- else -%}
        {%- set trim_substring = None -%}
        {%- if meta.get('trim_substring') -%}
            {%- set trim_substring = concat_ws("", [
                string_literal(meta.get('trim_substring'), escaping_backslashes = True),
                all_whitespace_characters()]) -%}
        {% endif %}
        {%- set column_trimmed = string_trim(
            string = adapter.quote(name)
            , substring = trim_substring) -%}
        {%- if meta.get('replace_substring') -%}
            {%- set replace_from = string_literal(meta.replace_substring.from, escaping_backslashes = True) -%}
            {%- set replace_to = string_literal(meta.replace_substring.to, escaping_backslashes = True) -%}
            {%- set column_trimmed -%}
                replace( {{- column_trimmed }}, {{ replace_from }}, {{ replace_to -}} )
            {%- endset -%}
        {% endif %}
        {%- if meta.get('wrap_function') -%}
            {%- set column_trimmed -%}
                {{ meta.get('wrap_function') -}} ( {{ column_trimmed -}} )
            {%- endset -%}
        {%- endif -%}

    {%- endif -%}     {# end of set column_trimmed including both array and normal cols #}

    {%- set column_stripped -%}
        CASE WHEN {{ column_trimmed }} IN {{ null_tuple }} THEN NULL ELSE {{ column_trimmed }} END
    {%- endset -%}    {# end of set column_stripped #}

    {%- set column_expression -%}
        {%- if is_array == True and target.type == 'bigquery' and refined_type == 'record' -%}
            {{ adapter.quote(name) }}

        {%- elif enumeration -%}
            {{ lookup_enumerated_values(
                enumerated_column=column_stripped,
                enumerated_values=enumeration,
                output_type=refined_type,
                input_type=meta.get('enumeration_type')
            ) }}

        {%- elif refined_type in ['date', 'timestamp', 'timestamptz'] -%}
            {%- if format_string -%}
                {%- set datetime_column = string_to_timestamptz(timestamp_string= column_stripped, format_string= "'" ~format_string~ "'") -%}
            {%- else -%}
                {%- set datetime_column = dbt_utils.safe_cast(field = column_stripped, type = data_type('timestamptz')) -%}
            {%- endif -%}
            {%- if refined_type == 'timestamptz' -%}
                {%- if local_timezone -%}
                  {{- localize_timestamp_to_timestamptz(naive_timestamp = datetime_column, local_timezone = "'" ~ local_timezone ~ "'") -}}
                {%- else -%}
                  {{ datetime_column }}
                {%- endif -%}
            {%- else -%}
                {{- dbt_utils.safe_cast(field = datetime_column, type = data_type(refined_type)) -}}
            {%- endif -%}
        {%- elif refined_type in integer_types() -%}
            {{- dbt_utils.safe_cast(
                field = dbt_utils.safe_cast(field = column_stripped, type = data_type('float'))
              , type = data_type(refined_type))
             -}}
        {%- elif refined_type in boolean_types() -%}
             {%- set true_values = meta.get('true_values') if meta.get('true_values') else default_trues() -%}
             {%- set false_values = meta.get('false_values') if meta.get('false_values') else default_falses() -%}
             {%- set true_tuple -%}
               ( {%- for true_value in true_values -%}'{{ true_value }}'{%- if not loop.last -%}, {%- endif %}{% endfor -%} )
             {%- endset -%}
             {%- set false_tuple -%}
               ( {%- for false_value in false_values -%}'{{ false_value }}'{%- if not loop.last -%}, {%- endif %}{% endfor -%} )
             {%- endset -%}
              CAST(
                CASE
                  WHEN upper( {{ column_stripped }} ) IN {{ true_tuple }} THEN TRUE
                  WHEN upper( {{ column_stripped }} ) IN {{ false_tuple }} THEN FALSE
                END
                AS boolean
              )
        {%- else -%}
              {{- dbt_utils.safe_cast(field = column_stripped, type = data_type(refined_type)) -}}
        {%- endif -%}
    {%- endset -%}   {# end of set column_expression #}

    {%- set column_aftermath -%}
        {%- set column_divided -%}
            {%- if divide_by -%}
                {{- column_expression }} / {{ divide_by -}}
            {%- else %}
                {{- column_expression -}}
            {%- endif -%}
        {%- endset -%}

        {%- if decimal_precision -%}
            round( {{- column_divided -}} , {{ decimal_precision -}} )
        {%- else -%}
            {{- column_divided -}}
        {%- endif -%}
    {%- endset -%}   {# end of set column_aftermath #}

    {%- set column_coalesced -%}
        {%- if fill_nulls is not none -%}
            coalesce( {{ column_aftermath }} , cast('{{ fill_nulls }}' AS {{ data_type(refined_type) }} ))
        {%- else -%}
            {{ column_aftermath }}
        {%- endif -%}
    {%- endset -%}  {# end of set column_coalesced #}

    {{ column_coalesced }}

{%- endif -%}

{%- endmacro -%}
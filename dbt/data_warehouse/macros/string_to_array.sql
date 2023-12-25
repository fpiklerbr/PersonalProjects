{#
  Requirements:
  1) the macro should never wrap the delimiter argument in quotes.
  In the usual case where we want a string literal as a delimiter
  , the quoting should be done (preferably via the string_literal() macro) outside the macro
  and passed as part of the delimiter argument.
  eg:
  {{ this_macro("user_tax_forms.created_at", string_literal(','), output_type) }}
  chr(10) is replaced by e'\n'

  2) add a dummy output_type argument to the macro
  so that it can be used by the base-model macro.
  This should have no affect on the behavior of the macro (since it returns an array by definition).
  BQ: ARRAY<STRING>, ARRAY<INT64>
  PG: text[], int[], but it is controlled by ARRAY()
#}

{%- macro string_to_array(col_name, delimiter, output_type) -%}
  {{adapter.dispatch('string_to_array')(col_name, delimiter, output_type)}}
{%- endmacro -%}

{%- macro default__string_to_array(col_name, delimiter, output_type) -%}

STRING_TO_ARRAY({{col_name}},{{delimiter}})

{%- endmacro -%}

{%- macro bigquery__string_to_array(col_name, delimiter, output_type) -%}

SPLIT({{col_name}},{{delimiter}})

{%- endmacro -%}


{#
--get the last operator to verify scalar json or json
 #}
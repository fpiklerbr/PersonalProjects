{%- macro array_is_empty(array_col) -%}
  {{adapter.dispatch('array_is_empty')(array_col)}}
{%- endmacro -%}

{%- macro default__array_is_empty(array_col)  -%}

    (
      {{ array_col }} IS NULL
      OR array_length( {{ array_col }} , 1) = 0
      OR {{ array_col }} = '{NULL}'
    )

{%- endmacro -%}

{%- macro bigquery__array_is_empty(array_col) -%}

    (
      {{ array_col }} IS NULL
      OR array_length( {{ array_col }} ) = 0
    )

{%- endmacro -%}


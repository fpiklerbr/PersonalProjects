{#

The string_trim macro removes leading and trailing characters from a string expression in a platform-consistent way.

It takes 3 arguments:
- string (required): A column name or other valid SQL expression representing a string from which to trim leading & trailing characters
- substring (optional): A valid SQL expression representing the characters to be trimmed from the string expression
  - If specified, this overrides the default of all unicode whitespace characters
  - If you want a string literal here, generate it from the string_literal() macro (q.v.) with escaping_backslashes = True
    - e.g. to trim tabs and newlines only: substring = string_literal("\\t\\n", escaping_backslashes = True)
  - Combine string_literal() with the all_whitespace_characters() macro if you want to trim whitespace *and* some other character(s)
    - e.g. to trim single quotes *and* all whitespace: substring = concat_ws("", [string_literal("\\'", escaping_backslashes = True), all_whitespace_characters()])
- output_type (optional): Data type to return the trimmed result as. Defaults to text

N.B. these nuances:
- It returns NULL if the string expression is NULL
  - This is like both BQ and PG
- It trims all whitespace by default
  - This is like BQ but unlike PG, which trims only spaces by default
- It returns NULL if the string expression is an empty string or contains only the substring characters to be trimmed
  - This is unlike BQ and PG, which both return an empty string

#}

{%- macro string_trim(string, substring = None, output_type = 'text') -%}
  {{adapter.dispatch('string_trim')(string, substring, output_type)}}
{%- endmacro -%}

{%- macro default__string_trim(string, substring = None, output_type = 'text') -%}

{%- if not substring -%}

cast(nullif(trim(cast( {{- string }} AS {{ data_type('text') -}} )), '') AS {{ data_type(output_type) -}} )

{%- else -%}

cast(nullif(trim(cast( {{- string }} AS {{ data_type('text') -}} ), {{ substring -}} ), '') AS {{ data_type(output_type) -}} )

{%- endif -%}

{%- endmacro -%}

{%- macro postgres__string_trim(string, substring = None, output_type = 'text') -%}

{%- if not substring -%}

cast(nullif(trim(
    cast( {{- string }} AS {{ data_type('text') -}} )
  , {{ all_whitespace_characters() }}
), '') AS {{ data_type(output_type) -}} )

{%- else -%}

cast(nullif(trim(cast( {{- string }} AS {{ data_type('text') -}} ), {{ substring -}} ), '') AS {{ data_type(output_type) -}} )

{%- endif -%}
{%- endmacro -%}

{%- macro all_whitespace_characters() -%}

  concat(
    {%- for whitespace_code in [
      9,
      10,
      11,
      12,
      13,
      32,
      133,
      160,
      5760,
      8192,
      8193,
      8194,
      8195,
      8196,
      8197,
      8198,
      8199,
      8200,
      8201,
      8202,
      8232,
      8233,
      8239,
      8287,
      12288,
    ] -%}
      chr( {{- whitespace_code -}} ) {{- ", " if not loop.last else "" -}}
    {%- endfor -%}
  )

{%- endmacro -%}

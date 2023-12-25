{#

Quoted or triple-quoted literals that have the raw string literal prefix (r or R)
are interpreted as raw/regex strings. Raw string: r'f\(abc,(.*),def\)'
Backslash characters (\) do not act as escape characters.

Escape Sequence	Description
\a	Bell
\b	Backspace
\f	Formfeed
\n	Newline
\r	Carriage Return
\t	Tab
\v	Vertical Tab
\\	Backslash (\)
\?	Question Mark (?)
\"	Double Quote (")
\'	Single Quote (')
\`	Backtick (`)

Requirments:

1) we should add the following arguments and default values to the macro,
pattern_is_raw = True, output_type = 'text'

2) if pattern_is_raw = True, AKA, escaping_backslashes = False
then wrap pattern in the string_literal macro before passing it to the regex function;
otherwise, pass pattern as-is to the regex function

3) remove the BQ-specific logic around generating bq_pattern from pattern
, which is now handled by the pattern_is_raw logic

4) if output_type != 'text', wrap the regex function in a cast(/* regex function */ AS {{ data_type(output_type) }})

5) Then, we should update usages of the macro to pass pattern_is_raw = False in cases
previously handled by the old bq_pattern logic -- refer to 'concat','substr' ?

#}

{% macro regexp_extract(string, pattern, pattern_is_raw=True, output_type='text') %}
  {{adapter.dispatch('regexp_extract')(string, pattern, pattern_is_raw, output_type)}}
{% endmacro %}

{%- macro default__regexp_extract(string, pattern, pattern_is_raw=True, output_type='text') -%}

    {%- set qualified_pattern = string_literal(string=pattern, escaping_backslashes=False) if pattern_is_raw == True else pattern -%}
    CAST(substring({{string}} from {{qualified_pattern}}) AS {{data_type(output_type)}})

{%- endmacro -%}


{%- macro bigquery__regexp_extract(string, pattern, pattern_is_raw=True, output_type='text') -%}

    {%- set qualified_pattern = string_literal(string=pattern, escaping_backslashes=False) if pattern_is_raw == True else pattern -%}
    CAST(regexp_extract({{string}}, {{qualified_pattern}}) AS {{data_type(output_type)}})

{%- endmacro -%}
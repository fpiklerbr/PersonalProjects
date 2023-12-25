{#
  This macro compiles a string in Jinja, then quotes it to be interpreted as a string literal in SQL.
  - string (required): Something to be quoted in the SQL layer. This will pass through *a layer of jinja interpretation*,
    so all backslashes that you want to preserve *in the compiled SQL* need to be escaped
  - escaping_backslashes (optional): Boolean flag indicating whether backslashes *in the compiled SQL* should initiate
    escape sequences *in the SQL layer*. Defaults to False (so backslashes have no special meaning)
#}

{% macro string_literal(string, escaping_backslashes = False) %}
  {{ adapter.dispatch('string_literal')(string, escaping_backslashes) }}
{% endmacro %}

{%- macro default__string_literal(string, escaping_backslashes = False) -%}
{% if escaping_backslashes == True %}e{% endif %}'{{ string }}'
{%- endmacro -%}

{%- macro bigquery__string_literal(string, escaping_backslashes = False) -%}
{% if escaping_backslashes != True %}r{% endif %}'{{ string }}'
{%- endmacro -%}

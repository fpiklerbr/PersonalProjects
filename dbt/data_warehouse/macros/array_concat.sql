{%- macro array_concat(col_list) -%}
  {{adapter.dispatch('array_concat')(col_list)}}
{%- endmacro -%}

{%- macro default__array_concat(col_list) -%}

  array_cat(
    {% for concat_element in col_list %}
      {% if not loop.first %}, {% endif %} {{ concat_element }}
    {% endfor %}
  )

{%- endmacro -%}

{%- macro bigquery__array_concat(col_list) -%}

  array_concat(
    {% for concat_element in col_list %}
      {% if not loop.first %}, {% endif %} {{ concat_element }}
    {% endfor %}
  )

{%- endmacro -%}
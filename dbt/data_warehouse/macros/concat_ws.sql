{%- macro concat_ws(delimiter, col_list) -%}
    {#
-- still use the concat('val'|| '-','val'|| '-', 'val'), which is BQ friendly
-- requirements : need handle the null situation, in order not to "NULL" in BQ
-- concat(coalesce(col_A|| '-','') , coalesce(col_B|| '-',''), coalesce(col_C|| '-',''))
-- output: 'xixi-haha-' if col_C is null
-- output: 'xixi-haha-qiqi-'
-- output: '' if all null
 #}
{%- set delimiter_qualified = delimiter if delimiter == 'chr(10)' else "'" ~ delimiter ~ "'" -%}
{%- set concat_with_coalesce -%}
  concat(
    {% for column in col_list %}
      {% if not loop.first %}, {% endif %}coalesce({{ column }}|| {{delimiter_qualified}} , '')
    {% endfor %}
  )
{%- endset -%}

substr(
    {{ concat_with_coalesce }}
  , 1
  , greatest(
        length({{ concat_with_coalesce }}) - length({{ delimiter_qualified }})
      , 0
    )
)

{%- endmacro -%}
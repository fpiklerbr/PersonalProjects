
{#
This macro extends the dbt_utils.get_column_values() macro.
It fetches unique values for `column` in the table `table`,
returning only those values present in the result set filtered on the optional `where_clause`

Arguments:
    table: A model `ref`, or a schema.table string for the table to query (Required)
    column: The column to query for unique values
    max_records: If provided, the maximum number of unique records to return (default: none)
    where_clause: If provided, a complete and valid WHERE clause to filter the results (default: none)

Returns:
    A list of distinct values for the specified columns
#}

{% macro get_column_values_with_filter(table, column, max_records=none, where_clause=none) -%}

    {%- call statement('get_column_values', fetch_result=True) %}

        select
            {{ column }} as value

        from {{ table }}

        {% if where_clause is not none %}
        {{ where_clause }}
        {% endif %}

        group by 1
        order by count(*) desc

        {% if max_records is not none %}
        limit {{ max_records }}
        {% endif %}

    {%- endcall -%}

    {%- set value_list = load_result('get_column_values') -%}

    {%- if value_list and value_list['data'] -%}
        {%- set values = value_list['data'] | map(attribute=0) | list %}
        {{ return(values) }}
    {%- else -%}
        {{ return([]) }}
    {%- endif -%}

{%- endmacro %}

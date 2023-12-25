{% macro get_last_close_date_info() -%}

{% set query %}
SELECT
    close_date
  , month_beginning
  , month_ending
FROM {{ ref('stg_stadium_finance_snapshots_close_dates') }}
ORDER BY close_date DESC
LIMIT 1
{% endset %}
{% set query_results = dbt_utils.get_query_results_as_dict(query) %}

{% set final_results = {} %}
{% for k, v in query_results.items() %}
    {%- do final_results.update({k: v[0]}) -%}
{% endfor %}

{{ return(final_results) }}

{%- endmacro %}

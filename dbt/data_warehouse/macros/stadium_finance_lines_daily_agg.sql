{% macro stadium_finance_lines_daily_agg(dimension, metric) %}
{%- set current_date -%}
cast( {{ convert_timestamptz_to_timestamp("current_timestamp", "'America/New_York'") }} AS date)
{%- endset -%}
{%- set start_date -%}
cast( {{ dbt_utils.dateadd("day", -28, current_date) }} AS date)
{%- endset -%}

{{ metric }}_by_{{ dimension }}_by_date_without_zeroes AS (

  SELECT
      order_date
    , {{ dimension }}
    , sum( {{ metric }} ) AS {{ metric }}
  FROM {{ ref('stadium_finance_lines') }}
  WHERE order_date >= {{ start_date }}
	  AND order_date < {{ current_date }}
  GROUP BY 1, 2

), {{ metric }}_by_{{ dimension }}_dates AS (

  SELECT DISTINCT order_date
  FROM {{ metric }}_by_{{ dimension }}_by_date_without_zeroes

), {{ metric }}_by_{{ dimension }}_domain AS (

  SELECT DISTINCT {{ dimension }}
  FROM {{ metric }}_by_{{ dimension }}_by_date_without_zeroes

), {{ metric }}_by_{{ dimension }}_by_date AS (

  SELECT
      date_values.order_date
    , dimension_values.{{ dimension }}
    , coalesce(metric_values.{{ metric }}, 0) AS {{ metric }}
  FROM {{ metric }}_by_{{ dimension }}_dates AS date_values
  CROSS JOIN {{ metric }}_by_{{ dimension }}_domain AS dimension_values
  LEFT JOIN {{ metric }}_by_{{ dimension }}_by_date_without_zeroes AS metric_values
    ON date_values.order_date = metric_values.order_date
    AND dimension_values.{{ dimension }} = metric_values.{{ dimension }}

), {{ metric }}_by_{{ dimension }}_by_date_with_quartiles AS (

  SELECT
      *
    , ntile(4) OVER (PARTITION BY {{ dimension }} ORDER BY {{ metric }}) AS {{ metric }}_quartile
  FROM {{ metric }}_by_{{ dimension }}_by_date

), {{ metric }}_by_{{ dimension }}_icr AS (

  SELECT
      {{ dimension }}
    , max(CASE WHEN {{ metric }}_quartile = 1 THEN {{ metric }} END) AS {{ metric }}_q1_max
    , max(CASE WHEN {{ metric }}_quartile = 3 THEN {{ metric }} END) AS {{ metric }}_q3_max
    , max(CASE WHEN {{ metric }}_quartile = 3 THEN {{ metric }} END) - max(CASE WHEN {{ metric }}_quartile = 1 THEN {{ metric }} END) AS {{ metric }}_icr
  FROM {{ metric }}_by_{{ dimension }}_by_date_with_quartiles
  GROUP BY 1

), {{ metric }}_by_{{ dimension }}_thresholds AS (

  SELECT
      *
    , {{ metric }}_q1_max - ({{ metric }}_icr * 1.5) AS {{ metric }}_low_threshold
    , {{ metric }}_q3_max + ({{ metric }}_icr * 1.5) AS {{ metric }}_high_threshold
  FROM {{ metric }}_by_{{ dimension }}_icr

), {{ metric }}_by_{{ dimension }}_by_date_with_thresholds AS (

  SELECT
      metric_by_dimension_by_date.order_date
    , metric_by_dimension_by_date.{{ dimension }}
    , metric_by_dimension_by_date.{{ metric }}
    , thresholds.{{ metric }}_low_threshold
    , thresholds.{{ metric }}_q1_max
    , thresholds.{{ metric }}_icr
    , thresholds.{{ metric }}_q3_max
    , thresholds.{{ metric }}_high_threshold
  FROM {{ metric }}_by_{{ dimension }}_by_date_with_quartiles AS metric_by_dimension_by_date
  INNER JOIN {{ metric }}_by_{{ dimension }}_thresholds AS thresholds
    ON metric_by_dimension_by_date.{{ dimension }} = thresholds.{{ dimension }}

)

{% endmacro %}

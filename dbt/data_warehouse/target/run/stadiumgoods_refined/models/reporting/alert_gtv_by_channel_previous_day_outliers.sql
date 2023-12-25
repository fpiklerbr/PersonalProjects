

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`alert_gtv_by_channel_previous_day_outliers`
  
  
  OPTIONS()
  as (
    WITH gtv_total_by_channel_or_gateway_by_date_without_zeroes AS (

  SELECT
      order_date
    , channel_or_gateway
    , sum( gtv_total ) AS gtv_total
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE order_date >= cast( 

        datetime_add(
            cast( cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -28 day
        )

 AS date)
	  AND order_date < cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date)
  GROUP BY 1, 2

), gtv_total_by_channel_or_gateway_dates AS (

  SELECT DISTINCT order_date
  FROM gtv_total_by_channel_or_gateway_by_date_without_zeroes

), gtv_total_by_channel_or_gateway_domain AS (

  SELECT DISTINCT channel_or_gateway
  FROM gtv_total_by_channel_or_gateway_by_date_without_zeroes

), gtv_total_by_channel_or_gateway_by_date AS (

  SELECT
      date_values.order_date
    , dimension_values.channel_or_gateway
    , coalesce(metric_values.gtv_total, 0) AS gtv_total
  FROM gtv_total_by_channel_or_gateway_dates AS date_values
  CROSS JOIN gtv_total_by_channel_or_gateway_domain AS dimension_values
  LEFT JOIN gtv_total_by_channel_or_gateway_by_date_without_zeroes AS metric_values
    ON date_values.order_date = metric_values.order_date
    AND dimension_values.channel_or_gateway = metric_values.channel_or_gateway

), gtv_total_by_channel_or_gateway_by_date_with_quartiles AS (

  SELECT
      *
    , ntile(4) OVER (PARTITION BY channel_or_gateway ORDER BY gtv_total) AS gtv_total_quartile
  FROM gtv_total_by_channel_or_gateway_by_date

), gtv_total_by_channel_or_gateway_icr AS (

  SELECT
      channel_or_gateway
    , max(CASE WHEN gtv_total_quartile = 1 THEN gtv_total END) AS gtv_total_q1_max
    , max(CASE WHEN gtv_total_quartile = 3 THEN gtv_total END) AS gtv_total_q3_max
    , max(CASE WHEN gtv_total_quartile = 3 THEN gtv_total END) - max(CASE WHEN gtv_total_quartile = 1 THEN gtv_total END) AS gtv_total_icr
  FROM gtv_total_by_channel_or_gateway_by_date_with_quartiles
  GROUP BY 1

), gtv_total_by_channel_or_gateway_thresholds AS (

  SELECT
      *
    , gtv_total_q1_max - (gtv_total_icr * 1.5) AS gtv_total_low_threshold
    , gtv_total_q3_max + (gtv_total_icr * 1.5) AS gtv_total_high_threshold
  FROM gtv_total_by_channel_or_gateway_icr

), gtv_total_by_channel_or_gateway_by_date_with_thresholds AS (

  SELECT
      metric_by_dimension_by_date.order_date
    , metric_by_dimension_by_date.channel_or_gateway
    , metric_by_dimension_by_date.gtv_total
    , thresholds.gtv_total_low_threshold
    , thresholds.gtv_total_q1_max
    , thresholds.gtv_total_icr
    , thresholds.gtv_total_q3_max
    , thresholds.gtv_total_high_threshold
  FROM gtv_total_by_channel_or_gateway_by_date_with_quartiles AS metric_by_dimension_by_date
  INNER JOIN gtv_total_by_channel_or_gateway_thresholds AS thresholds
    ON metric_by_dimension_by_date.channel_or_gateway = thresholds.channel_or_gateway

)



, gtv_paid_by_channel_or_gateway_by_date_without_zeroes AS (

  SELECT
      order_date
    , channel_or_gateway
    , sum( gtv_paid ) AS gtv_paid
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE order_date >= cast( 

        datetime_add(
            cast( cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -28 day
        )

 AS date)
	  AND order_date < cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date)
  GROUP BY 1, 2

), gtv_paid_by_channel_or_gateway_dates AS (

  SELECT DISTINCT order_date
  FROM gtv_paid_by_channel_or_gateway_by_date_without_zeroes

), gtv_paid_by_channel_or_gateway_domain AS (

  SELECT DISTINCT channel_or_gateway
  FROM gtv_paid_by_channel_or_gateway_by_date_without_zeroes

), gtv_paid_by_channel_or_gateway_by_date AS (

  SELECT
      date_values.order_date
    , dimension_values.channel_or_gateway
    , coalesce(metric_values.gtv_paid, 0) AS gtv_paid
  FROM gtv_paid_by_channel_or_gateway_dates AS date_values
  CROSS JOIN gtv_paid_by_channel_or_gateway_domain AS dimension_values
  LEFT JOIN gtv_paid_by_channel_or_gateway_by_date_without_zeroes AS metric_values
    ON date_values.order_date = metric_values.order_date
    AND dimension_values.channel_or_gateway = metric_values.channel_or_gateway

), gtv_paid_by_channel_or_gateway_by_date_with_quartiles AS (

  SELECT
      *
    , ntile(4) OVER (PARTITION BY channel_or_gateway ORDER BY gtv_paid) AS gtv_paid_quartile
  FROM gtv_paid_by_channel_or_gateway_by_date

), gtv_paid_by_channel_or_gateway_icr AS (

  SELECT
      channel_or_gateway
    , max(CASE WHEN gtv_paid_quartile = 1 THEN gtv_paid END) AS gtv_paid_q1_max
    , max(CASE WHEN gtv_paid_quartile = 3 THEN gtv_paid END) AS gtv_paid_q3_max
    , max(CASE WHEN gtv_paid_quartile = 3 THEN gtv_paid END) - max(CASE WHEN gtv_paid_quartile = 1 THEN gtv_paid END) AS gtv_paid_icr
  FROM gtv_paid_by_channel_or_gateway_by_date_with_quartiles
  GROUP BY 1

), gtv_paid_by_channel_or_gateway_thresholds AS (

  SELECT
      *
    , gtv_paid_q1_max - (gtv_paid_icr * 1.5) AS gtv_paid_low_threshold
    , gtv_paid_q3_max + (gtv_paid_icr * 1.5) AS gtv_paid_high_threshold
  FROM gtv_paid_by_channel_or_gateway_icr

), gtv_paid_by_channel_or_gateway_by_date_with_thresholds AS (

  SELECT
      metric_by_dimension_by_date.order_date
    , metric_by_dimension_by_date.channel_or_gateway
    , metric_by_dimension_by_date.gtv_paid
    , thresholds.gtv_paid_low_threshold
    , thresholds.gtv_paid_q1_max
    , thresholds.gtv_paid_icr
    , thresholds.gtv_paid_q3_max
    , thresholds.gtv_paid_high_threshold
  FROM gtv_paid_by_channel_or_gateway_by_date_with_quartiles AS metric_by_dimension_by_date
  INNER JOIN gtv_paid_by_channel_or_gateway_thresholds AS thresholds
    ON metric_by_dimension_by_date.channel_or_gateway = thresholds.channel_or_gateway

)



, both_metrics AS (

  SELECT
      coalesce(gtv_total.order_date, gtv_paid.order_date) AS order_date
    , coalesce(gtv_total.channel_or_gateway, gtv_paid.channel_or_gateway) AS channel_or_gateway
    , gtv_total.gtv_total
    , gtv_total.gtv_total_low_threshold
    , gtv_total.gtv_total_high_threshold
    , CASE
        WHEN gtv_total.gtv_total < gtv_total.gtv_total_low_threshold THEN 'Low'
        WHEN gtv_total.gtv_total > gtv_total.gtv_total_high_threshold THEN 'High'
      END AS gtv_total_outlier
    , gtv_paid.gtv_paid
    , gtv_paid.gtv_paid_low_threshold
    , gtv_paid.gtv_paid_high_threshold
    , CASE
        WHEN gtv_paid.gtv_paid < gtv_paid.gtv_paid_low_threshold THEN 'Low'
        WHEN gtv_paid.gtv_paid > gtv_paid.gtv_paid_high_threshold THEN 'High'
      END AS gtv_paid_outlier
  FROM gtv_total_by_channel_or_gateway_by_date_with_thresholds AS gtv_total
  FULL JOIN gtv_paid_by_channel_or_gateway_by_date_with_thresholds AS gtv_paid
    ON gtv_total.order_date = gtv_paid.order_date
    AND gtv_total.channel_or_gateway = gtv_paid.channel_or_gateway

), final AS (

  SELECT *
  FROM both_metrics
  WHERE order_date = cast( 

        datetime_add(
            cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) as datetime),
        interval -1 day
        )

 AS date)
    AND (gtv_paid_outlier IS NOT NULL OR gtv_total_outlier IS NOT NULL)

)

SELECT * FROM final
  );
    
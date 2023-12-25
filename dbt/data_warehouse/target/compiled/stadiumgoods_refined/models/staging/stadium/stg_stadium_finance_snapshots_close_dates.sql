WITH last_close_date_by_month AS (

  SELECT
      cast(

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(cast(close_date AS date) as timestamp),
        month
    )

 as datetime),
        interval -1 day
        )

 AS date) AS month_ending
    , max( cast(close_date AS date) ) AS close_date
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`close_dates`
  GROUP BY 1

), close_dates AS (

  SELECT
      close_date
    , cast(
    timestamp_trunc(
        cast(month_ending as timestamp),
        month
    )

 AS date) AS month_beginning
    , month_ending
  FROM last_close_date_by_month

), last_close_date AS (

  SELECT
      *
    , cast(

        datetime_add(
            cast( month_beginning as datetime),
        interval -1 day
        )

 AS date) AS last_close_prior_month_ending
    , cast(

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(month_beginning as timestamp),
        year
    )

 as datetime),
        interval -1 day
        )

 AS date) AS last_close_prior_year_ending
  FROM close_dates
  ORDER BY month_ending DESC
  LIMIT 1

), current_period AS (

  SELECT
      extract(year FROM current_date) AS current_year
    , 

        datetime_add(
            cast( 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(

        datetime_add(
            cast( current_date as datetime),
        interval 1 month
        )

 as timestamp),
        month
    )

 as datetime),
        interval -1 year
        )

 as datetime),
        interval -1 day
        )

 AS current_period_yoy -- 1 day prior to 1 year prior to the first day of the next month

), final AS (

  SELECT
      close_dates.close_date
    , close_dates.month_beginning
    , close_dates.month_ending
  FROM close_dates
  CROSS JOIN last_close_date
--  CROSS JOIN current_period
  WHERE 1=2
    OR close_dates.close_date = last_close_date.close_date
    OR close_dates.month_ending = last_close_date.last_close_prior_month_ending -- is prior_month-close
    OR close_dates.month_ending = last_close_date.last_close_prior_year_ending -- is prior year-close
/*
    OR close_periods.close_date = last_close_period.last_close_date
    OR extract(year FROM close_periods.period_ending) = current_period.current_year
    OR close_periods.period_ending = last_close_period.last_close_period_yoy
    OR close_periods.period_ending = current_period.current_period_yoy
    OR ( -- is a quarter-close date from the prior year
      close_periods.period_ending = 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(close_periods.close_date as timestamp),
        quarter
    )

 as datetime),
        interval -1 day
        )


      AND extract(year FROM close_periods.period_ending) = (current_period.current_year - 1)
    )
*/
)

SELECT *
FROM final
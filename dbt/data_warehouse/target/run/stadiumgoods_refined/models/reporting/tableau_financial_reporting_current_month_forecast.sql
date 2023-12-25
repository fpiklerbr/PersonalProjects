

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_financial_reporting_current_month_forecast`
  
  
  OPTIONS()
  as (
    

-- extract('day' FROM '2021-01-01 00:00:00+00'::timestamptz - '2020-12-23 17:33:04+00'::timestamptz) == 8
-- '2021-01-01 00:00:00+00'::date - '2020-12-23 17:33:04+00'::date == 9

  SELECT
    CAST(
    timestamp_trunc(
        cast(CAST(order_date AS date) as timestamp),
        month
    )

 AS datetime) AS order_month
  , business_unit
  , sales_channel
  , CASE WHEN extract(`day` FROM order_date) <= extract(`day` FROM current_timestamp)
    THEN 'Through Current Date' ELSE 'Remainder of Month' END order_period
  , sum(gtv_total) gtv_total
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE extract(`month` FROM order_date) = extract(`month` FROM current_timestamp)
  AND extract(`year` from order_date) >= extract(`year` FROM current_timestamp) - 1
  GROUP BY 1, 2, 3, 4

  UNION ALL

  SELECT
    CAST(
    timestamp_trunc(
        cast(CAST(order_date AS date) as timestamp),
        month
    )

 AS datetime) AS order_month
  , business_unit
  , sales_channel
  ,'Forecast Through End of Month' order_period
  , sum(gtv_total) / extract(`day` FROM current_timestamp) * 


    datetime_diff(
        cast(
    timestamp_trunc(
        cast(

        datetime_add(
            cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'Etc/UTC') AS datetime) as datetime),
        interval 1 month
        )

 as timestamp),
        month
    )

 as datetime),
        cast(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'Etc/UTC') AS datetime) as datetime),
        day
    )

 -1 AS gtv_total
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE extract(`month` FROM order_date) = extract(`month` FROM current_timestamp)
  AND extract(`year` from order_date) = extract(`year` FROM current_timestamp)
  GROUP BY 1, 2, 3, 4
  );
    
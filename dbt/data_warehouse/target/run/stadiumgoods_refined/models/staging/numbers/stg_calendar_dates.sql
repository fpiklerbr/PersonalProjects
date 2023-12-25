

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_calendar_dates`
  
  
  OPTIONS()
  as (
    





WITH all_dates AS (

  SELECT
    cast(date_series AS date) AS date_id
  FROM 
  UNNEST( generate_timestamp_array(cast('1970-01-01 00:00:00' AS timestamp),  cast('2038-01-19 03:14:08' AS timestamp), interval 1 day) )
 AS date_series

), marketing_calendar_deduped AS (

SELECT
    date_id
  , string_agg(DISTINCT marketing_promo_type, ', ') AS marketing_promo_type
  , string_agg(DISTINCT marketing_promo_description, ', ') AS marketing_promo_description
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ecommerce__marketing_calendar`
GROUP BY 1

), date_logic AS (

  SELECT
      all_dates.date_id
    , extract(year FROM all_dates.date_id) AS calendar_year
    , 
trim(FORMAT_DATE(replace(replace(replace(replace(replace('Day','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id))
 AS calendar_weekday_name
    , FORMAT_DATE(replace(replace(replace(replace(replace('YYYY','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id) || '-Q' || FORMAT_DATE(replace(replace(replace(replace(replace('Q','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id) AS calendar_quarter_id
    , extract(quarter FROM all_dates.date_id) AS calendar_quarter_of_year
    , 'Q' || FORMAT_DATE(replace(replace(replace(replace(replace('Q','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id) AS calendar_quarter_name
    , trim(FORMAT_DATE(replace(replace(replace(replace(replace('YYYY-MM','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id)) AS calendar_month_id
    , extract(month FROM all_dates.date_id) AS calendar_month_of_year
    , trim(FORMAT_DATE(replace(replace(replace(replace(replace('Month','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id)) AS calendar_month_name
    , extract(day FROM all_dates.date_id) AS calendar_day_of_month
    , extract(isoyear FROM all_dates.date_id) AS iso_year
    , extract(week FROM all_dates.date_id) AS iso_week_of_year
    , 
  MOD(EXTRACT(DAYOFWEEK FROM all_dates.date_id) + 5, 7) + 1
 AS iso_day_of_week
    , nrf.retail_year
    , nrf.retail_week_of_year
    , nrf.retail_week_of_year_restated
    , nrf.retail_month_of_year
    , nrf.retail_month_of_year_restated
    , nrf.retail_season
    , nrf.retail_season_restated
    , nrf.retail_week_of_month
    , nrf.retail_week_of_month_restated
    , nrf.retail_holiday
    , nrf.retail_day_of_week
    , trim(FORMAT_DATE(replace(replace(replace(replace(replace('Month','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), 



date(nrf.retail_year, CASE WHEN nrf.retail_month_of_year = 12 THEN 1 ELSE nrf.retail_month_of_year + 1 END, 1)



)) AS retail_month_name
    , CASE
        WHEN retail_week_of_year_restated = 0
          THEN 'Excluded from Restatement'
        ELSE
          trim(FORMAT_DATE(replace(replace(replace(replace(replace('Month','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), 



date(nrf.retail_year, CASE WHEN nrf.retail_month_of_year_restated = 12 THEN 1 ELSE nrf.retail_month_of_year_restated + 1 END, 1)



))
      END AS retail_month_name_restated
    , marketing.marketing_promo_type
    , marketing.marketing_promo_description
    , extract(isoyear FROM 
CASE
  WHEN 
trim(FORMAT_DATE(replace(replace(replace(replace(replace('Day','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id))
 = 'Sunday'
  THEN cast(

        datetime_add(
            cast( all_dates.date_id as datetime),
        interval 7 day
        )

 AS date)
  ELSE all_dates.date_id
END
) AS finance_year
    , extract(week FROM 
CASE
  WHEN 
trim(FORMAT_DATE(replace(replace(replace(replace(replace('Day','Day','%A'),'Q','%Q'),'YYYY','%Y'),'Month','%B'),'MM','%m'), all_dates.date_id))
 = 'Sunday'
  THEN cast(

        datetime_add(
            cast( all_dates.date_id as datetime),
        interval 7 day
        )

 AS date)
  ELSE all_dates.date_id
END
) AS finance_week_of_year
  FROM all_dates
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`calendars_nrf_retail` AS nrf
    ON all_dates.date_id = nrf.date_id
  LEFT JOIN marketing_calendar_deduped AS marketing
    ON all_dates.date_id = marketing.date_id

), finance_months AS (

  SELECT
      *
    , CASE max(finance_week_of_year) OVER (PARTITION BY finance_year)
        WHEN 53
        THEN
          CASE
            WHEN finance_week_of_year <= 5 THEN 1
            WHEN finance_week_of_year <= 9 THEN 2
            WHEN finance_week_of_year <= 13 THEN 3
            WHEN finance_week_of_year <= 18 THEN 4
            WHEN finance_week_of_year <= 22 THEN 5
            WHEN finance_week_of_year <= 26 THEN 6
            WHEN finance_week_of_year <= 31 THEN 7
            WHEN finance_week_of_year <= 35 THEN 8
            WHEN finance_week_of_year <= 39 THEN 9
            WHEN finance_week_of_year <= 44 THEN 10
            WHEN finance_week_of_year <= 48 THEN 11
            ELSE 12
          END
        ELSE
          CASE
            WHEN finance_week_of_year <= 4 THEN 1
            WHEN finance_week_of_year <= 8 THEN 2
            WHEN finance_week_of_year <= 13 THEN 3
            WHEN finance_week_of_year <= 17 THEN 4
            WHEN finance_week_of_year <= 21 THEN 5
            WHEN finance_week_of_year <= 26 THEN 6
            WHEN finance_week_of_year <= 30 THEN 7
            WHEN finance_week_of_year <= 34 THEN 8
            WHEN finance_week_of_year <= 39 THEN 9
            WHEN finance_week_of_year <= 43 THEN 10
            WHEN finance_week_of_year <= 47 THEN 11
            ELSE 12
          END
      END AS finance_month_of_year
  FROM date_logic

), final AS (

  SELECT
      *
    , CASE finance_month_of_year
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        ELSE 'December'
      END AS finance_month_name
  FROM finance_months

)

SELECT * FROM final
  );
    
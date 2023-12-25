WITH source_table_with_dupes AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`forex__daily_exchange_rates`

), last_request_by_currency_source_date AS (

  SELECT
      currency
    , rate_source_date
    , max(request_date) AS last_request_date
  FROM source_table_with_dupes
  GROUP BY 1, 2

), currency_rates AS (

  SELECT
      last_request_by_currency_source_date.currency
    , last_request_by_currency_source_date.rate_source_date
    , source_table_with_dupes.per_usd
    , source_table_with_dupes.in_usd
    , CASE
        WHEN lag(last_request_by_currency_source_date.rate_source_date) OVER (
          PARTITION BY last_request_by_currency_source_date.currency
          ORDER BY last_request_by_currency_source_date.rate_source_date
        ) IS NULL
        THEN cast(cast('1970-01-01 00:00:00' AS timestamp) AS date)
        ELSE last_request_by_currency_source_date.rate_source_date
      END AS valid_from
    , coalesce(
          lead(last_request_by_currency_source_date.rate_source_date) OVER (
            PARTITION BY last_request_by_currency_source_date.currency
            ORDER BY last_request_by_currency_source_date.rate_source_date
          ) - 1
        , cast(cast('2038-01-19 03:14:08' AS timestamp) AS date)
      ) AS valid_to
  FROM last_request_by_currency_source_date
  INNER JOIN source_table_with_dupes
    ON last_request_by_currency_source_date.currency = source_table_with_dupes.currency
    AND last_request_by_currency_source_date.rate_source_date = source_table_with_dupes.rate_source_date
    AND last_request_by_currency_source_date.last_request_date = source_table_with_dupes.request_date

), final AS (

  SELECT
      calendar_dates.date_id AS transaction_date
    , currency_rates.currency
    , currency_rates.rate_source_date
    , currency_rates.per_usd
    , currency_rates.in_usd
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_calendar_dates` AS calendar_dates
  INNER JOIN currency_rates
    ON calendar_dates.date_id >= currency_rates.valid_from
    AND calendar_dates.date_id <= currency_rates.valid_to

)

SELECT * FROM final
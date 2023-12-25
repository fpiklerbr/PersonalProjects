





with validation_errors as (

    select
        transaction_date, currency
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_forex_daily_exchange_rates`

    group by transaction_date, currency
    having count(*) > 1

)

select count(*)
from validation_errors



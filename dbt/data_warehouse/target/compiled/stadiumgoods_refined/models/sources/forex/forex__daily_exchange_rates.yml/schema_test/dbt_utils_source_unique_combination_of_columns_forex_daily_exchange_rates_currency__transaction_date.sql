





with validation_errors as (

    select
        currency, transaction_date
    from `ff-stadiumgoods-raw-live`.`imports`.`daily_exchange_rates`

    group by currency, transaction_date
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        order_date, sales_channel
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tableau_daily_gtv_actuals`

    group by order_date, sales_channel
    having count(*) > 1

)

select count(*)
from validation_errors



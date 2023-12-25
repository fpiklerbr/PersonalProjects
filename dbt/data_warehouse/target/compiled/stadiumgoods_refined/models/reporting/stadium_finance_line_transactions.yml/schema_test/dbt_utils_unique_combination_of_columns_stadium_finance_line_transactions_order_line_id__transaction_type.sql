





with validation_errors as (

    select
        order_line_id, transaction_type
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_line_transactions`

    group by order_line_id, transaction_type
    having count(*) > 1

)

select count(*)
from validation_errors



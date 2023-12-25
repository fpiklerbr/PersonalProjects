





with validation_errors as (

    select
        stadium_order_id, serial_number, transaction_type
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_ff_finance`.`ff_stadium_finance_line_transactions`

    group by stadium_order_id, serial_number, transaction_type
    having count(*) > 1

)

select count(*)
from validation_errors



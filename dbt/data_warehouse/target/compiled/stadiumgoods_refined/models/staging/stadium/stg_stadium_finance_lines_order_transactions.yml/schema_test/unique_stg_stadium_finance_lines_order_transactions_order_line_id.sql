
    
    



select count(*) as validation_errors
from (

    select
        order_line_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_finance_lines_order_transactions`
    where order_line_id is not null
    group by order_line_id
    having count(*) > 1

) validation_errors



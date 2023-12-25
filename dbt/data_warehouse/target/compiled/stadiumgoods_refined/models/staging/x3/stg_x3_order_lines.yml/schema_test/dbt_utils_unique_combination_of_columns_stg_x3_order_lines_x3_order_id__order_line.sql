





with validation_errors as (

    select
        x3_order_id, order_line
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_order_lines`

    group by x3_order_id, order_line
    having count(*) > 1

)

select count(*)
from validation_errors



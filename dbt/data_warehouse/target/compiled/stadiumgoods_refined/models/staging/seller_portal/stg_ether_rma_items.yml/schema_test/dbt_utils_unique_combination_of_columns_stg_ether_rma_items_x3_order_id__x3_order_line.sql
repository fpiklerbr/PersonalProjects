





with validation_errors as (

    select
        x3_order_id, x3_order_line
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_rma_items`

    group by x3_order_id, x3_order_line
    having count(*) > 1

)

select count(*)
from validation_errors



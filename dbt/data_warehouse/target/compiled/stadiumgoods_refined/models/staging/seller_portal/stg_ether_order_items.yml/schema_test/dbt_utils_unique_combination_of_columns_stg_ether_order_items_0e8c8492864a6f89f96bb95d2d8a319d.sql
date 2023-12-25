





with validation_errors as (

    select
        ether_order_number, ether_order_item_line_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_order_items`

    group by ether_order_number, ether_order_item_line_number
    having count(*) > 1

)

select count(*)
from validation_errors



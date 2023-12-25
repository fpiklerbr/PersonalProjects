





with validation_errors as (

    select
        order_item_number, ether_wms_allocation_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_order_item_allocations`

    group by order_item_number, ether_wms_allocation_id
    having count(*) > 1

)

select count(*)
from validation_errors



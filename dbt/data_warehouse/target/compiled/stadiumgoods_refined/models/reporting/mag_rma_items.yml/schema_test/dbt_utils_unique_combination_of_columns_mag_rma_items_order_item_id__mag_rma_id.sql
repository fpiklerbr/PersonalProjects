





with validation_errors as (

    select
        order_item_id, mag_rma_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_rma_items`

    group by order_item_id, mag_rma_id
    having count(*) > 1

)

select count(*)
from validation_errors



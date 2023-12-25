





with validation_errors as (

    select
        order_item_id, tracking_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_create_and_add_tracking`

    group by order_item_id, tracking_number
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        order_item_id, mag_shipment_id, tracking_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_shipment_items`

    group by order_item_id, mag_shipment_id, tracking_number
    having count(*) > 1

)

select count(*)
from validation_errors



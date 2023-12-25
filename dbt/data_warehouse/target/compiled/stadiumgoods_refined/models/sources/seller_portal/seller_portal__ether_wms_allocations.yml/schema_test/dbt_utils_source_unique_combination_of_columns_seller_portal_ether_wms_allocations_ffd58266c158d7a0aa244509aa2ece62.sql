





with validation_errors as (

    select
        fulfillment_id, source_line_number
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`

    group by fulfillment_id, source_line_number
    having count(*) > 1

)

select count(*)
from validation_errors



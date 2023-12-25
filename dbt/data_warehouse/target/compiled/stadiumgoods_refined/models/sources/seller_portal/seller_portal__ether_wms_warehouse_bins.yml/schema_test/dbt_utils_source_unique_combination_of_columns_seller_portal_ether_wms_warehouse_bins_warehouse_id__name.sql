





with validation_errors as (

    select
        warehouse_id, name
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouse_bins`

    group by warehouse_id, name
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        sku, inventory_timestamp
    from `ff-stadiumgoods-raw-live`.`imports`.`cap_inventory`

    group by sku, inventory_timestamp
    having count(*) > 1

)

select count(*)
from validation_errors



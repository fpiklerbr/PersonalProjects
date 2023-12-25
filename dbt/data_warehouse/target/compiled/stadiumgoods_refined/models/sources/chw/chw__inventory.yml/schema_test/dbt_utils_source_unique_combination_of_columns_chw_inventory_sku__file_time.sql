





with validation_errors as (

    select
        sku, file_time
    from `ff-stadiumgoods-raw-live`.`imports`.`chw_inventory`

    group by sku, file_time
    having count(*) > 1

)

select count(*)
from validation_errors



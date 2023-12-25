





with validation_errors as (

    select
        variant_id, status, update_timestamp, serial_relationship
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_toolio`.`products`

    group by variant_id, status, update_timestamp, serial_relationship
    having count(*) > 1

)

select count(*)
from validation_errors



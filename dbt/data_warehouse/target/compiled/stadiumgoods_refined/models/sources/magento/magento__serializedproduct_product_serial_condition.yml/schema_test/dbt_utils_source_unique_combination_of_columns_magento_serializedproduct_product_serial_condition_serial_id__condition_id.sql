





with validation_errors as (

    select
        serial_id, condition_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_condition`

    group by serial_id, condition_id
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        entity_type_id, attribute_code
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute`

    group by entity_type_id, attribute_code
    having count(*) > 1

)

select count(*)
from validation_errors



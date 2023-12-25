





with validation_errors as (

    select
        entity_type_id, entity_id, attribute_id, store_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_varchar`

    group by entity_type_id, entity_id, attribute_id, store_id
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        entity_id, attribute_id, store_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_varchar`

    group by entity_id, attribute_id, store_id
    having count(*) > 1

)

select count(*)
from validation_errors



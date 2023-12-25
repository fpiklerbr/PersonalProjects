





with validation_errors as (

    select
        entity_id, attribute_id, store_id, value
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_index_eav`

    group by entity_id, attribute_id, store_id, value
    having count(*) > 1

)

select count(*)
from validation_errors



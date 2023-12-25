





with validation_errors as (

    select
        value_id, store_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery_value`

    group by value_id, store_id
    having count(*) > 1

)

select count(*)
from validation_errors



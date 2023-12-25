
    
    



select count(*) as validation_errors
from (

    select
        value_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_media_gallery`
    where value_id is not null
    group by value_id
    having count(*) > 1

) validation_errors



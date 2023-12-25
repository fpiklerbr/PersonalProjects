
    
    



select count(*) as validation_errors
from (

    select
        entity_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity`
    where entity_id is not null
    group by entity_id
    having count(*) > 1

) validation_errors



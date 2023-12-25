
    
    



select count(*) as validation_errors
from (

    select
        value_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_varchar`
    where value_id is not null
    group by value_id
    having count(*) > 1

) validation_errors




    
    



select count(*) as validation_errors
from (

    select
        attribute_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_eav_attribute`
    where attribute_id is not null
    group by attribute_id
    having count(*) > 1

) validation_errors




    
    



select count(*) as validation_errors
from (

    select
        name

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_warehouse`
    where name is not null
    group by name
    having count(*) > 1

) validation_errors



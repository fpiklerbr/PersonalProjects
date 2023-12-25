
    
    



select count(*) as validation_errors
from (

    select
        serial_number

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial`
    where serial_number is not null
    group by serial_number
    having count(*) > 1

) validation_errors



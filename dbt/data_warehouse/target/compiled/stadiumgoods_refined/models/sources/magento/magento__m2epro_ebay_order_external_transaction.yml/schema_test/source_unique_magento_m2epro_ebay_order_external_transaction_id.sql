
    
    



select count(*) as validation_errors
from (

    select
        id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_external_transaction`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors



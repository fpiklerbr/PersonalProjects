
    
    



select count(*) as validation_errors
from (

    select
        email

    from `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_customer`
    where email is not null
    group by email
    having count(*) > 1

) validation_errors



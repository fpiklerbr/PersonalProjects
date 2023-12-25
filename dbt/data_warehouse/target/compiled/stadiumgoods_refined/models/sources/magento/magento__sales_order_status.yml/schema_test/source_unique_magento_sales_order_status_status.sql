
    
    



select count(*) as validation_errors
from (

    select
        status

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_order_status`
    where status is not null
    group by status
    having count(*) > 1

) validation_errors




    
    



select count(*) as validation_errors
from (

    select
        tid

    from `ff-stadiumgoods-raw-live`.`imports`.`tmall_trades_sold`
    where tid is not null
    group by tid
    having count(*) > 1

) validation_errors



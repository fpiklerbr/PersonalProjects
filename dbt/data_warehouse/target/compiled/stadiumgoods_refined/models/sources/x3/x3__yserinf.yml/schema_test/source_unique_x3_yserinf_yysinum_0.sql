
    
    



select count(*) as validation_errors
from (

    select
        yysinum_0

    from `ff-stadiumgoods-raw-live`.`live`.`yserinf`
    where yysinum_0 is not null
    group by yysinum_0
    having count(*) > 1

) validation_errors



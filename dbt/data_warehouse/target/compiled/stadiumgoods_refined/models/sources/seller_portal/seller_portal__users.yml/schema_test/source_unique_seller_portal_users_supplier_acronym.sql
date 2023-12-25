
    
    



select count(*) as validation_errors
from (

    select
        supplier_acronym

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`
    where supplier_acronym is not null
    group by supplier_acronym
    having count(*) > 1

) validation_errors



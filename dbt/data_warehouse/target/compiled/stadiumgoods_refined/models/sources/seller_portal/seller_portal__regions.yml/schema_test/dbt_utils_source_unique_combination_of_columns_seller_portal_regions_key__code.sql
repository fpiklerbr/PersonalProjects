





with validation_errors as (

    select
        key, code
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`regions`

    group by key, code
    having count(*) > 1

)

select count(*)
from validation_errors



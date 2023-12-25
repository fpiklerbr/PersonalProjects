





with validation_errors as (

    select
        sgp, size_code
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`variants`

    group by sgp, size_code
    having count(*) > 1

)

select count(*)
from validation_errors



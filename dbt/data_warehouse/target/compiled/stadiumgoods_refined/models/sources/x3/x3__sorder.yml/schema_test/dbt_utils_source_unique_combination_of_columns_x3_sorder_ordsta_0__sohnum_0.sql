





with validation_errors as (

    select
        ordsta_0, sohnum_0
    from `ff-stadiumgoods-raw-live`.`live`.`sorder`

    group by ordsta_0, sohnum_0
    having count(*) > 1

)

select count(*)
from validation_errors



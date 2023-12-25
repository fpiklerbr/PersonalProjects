





with validation_errors as (

    select
        sohnum_0, soplin_0, soqseq_0
    from `ff-stadiumgoods-raw-live`.`live`.`sorderq`

    group by sohnum_0, soplin_0, soqseq_0
    having count(*) > 1

)

select count(*)
from validation_errors



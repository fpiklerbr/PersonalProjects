





with validation_errors as (

    select
        shidat_0, sohnum_0, soplin_0, soqseq_0
    from `ff-stadiumgoods-raw-live`.`live`.`sorderq`

    group by shidat_0, sohnum_0, soplin_0, soqseq_0
    having count(*) > 1

)

select count(*)
from validation_errors



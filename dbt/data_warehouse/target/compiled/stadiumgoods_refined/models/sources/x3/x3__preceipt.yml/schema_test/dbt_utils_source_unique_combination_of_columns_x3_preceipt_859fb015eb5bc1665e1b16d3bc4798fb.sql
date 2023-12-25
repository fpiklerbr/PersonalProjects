





with validation_errors as (

    select
        pthnum_0, bpsnum_0, bponam_0, bpocty_0
    from `ff-stadiumgoods-raw-live`.`live`.`preceipt`

    group by pthnum_0, bpsnum_0, bponam_0, bpocty_0
    having count(*) > 1

)

select count(*)
from validation_errors



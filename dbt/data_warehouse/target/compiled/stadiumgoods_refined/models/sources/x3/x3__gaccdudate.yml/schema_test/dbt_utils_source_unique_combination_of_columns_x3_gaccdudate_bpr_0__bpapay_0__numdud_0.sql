





with validation_errors as (

    select
        bpr_0, bpapay_0, numdud_0
    from `ff-stadiumgoods-raw-live`.`live`.`gaccdudate`

    group by bpr_0, bpapay_0, numdud_0
    having count(*) > 1

)

select count(*)
from validation_errors



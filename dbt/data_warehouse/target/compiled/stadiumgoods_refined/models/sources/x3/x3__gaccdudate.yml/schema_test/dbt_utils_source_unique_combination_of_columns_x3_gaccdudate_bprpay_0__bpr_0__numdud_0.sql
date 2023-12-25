





with validation_errors as (

    select
        bprpay_0, bpr_0, numdud_0
    from `ff-stadiumgoods-raw-live`.`live`.`gaccdudate`

    group by bprpay_0, bpr_0, numdud_0
    having count(*) > 1

)

select count(*)
from validation_errors



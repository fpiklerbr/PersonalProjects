





with validation_errors as (

    select
        bpatyp_0, bpanum_0, bpaadd_0
    from `ff-stadiumgoods-raw-live`.`live`.`bpaddress`

    group by bpatyp_0, bpanum_0, bpaadd_0
    having count(*) > 1

)

select count(*)
from validation_errors



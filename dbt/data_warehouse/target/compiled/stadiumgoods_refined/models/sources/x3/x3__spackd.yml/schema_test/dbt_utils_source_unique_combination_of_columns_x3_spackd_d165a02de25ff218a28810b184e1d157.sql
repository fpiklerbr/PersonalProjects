





with validation_errors as (

    select
        vcrtyp_0, vcrnum_0, vcrlin_0, pacnum_0, pacind_0, pacseq_0, vcrseq_0
    from `ff-stadiumgoods-raw-live`.`live`.`spackd`

    group by vcrtyp_0, vcrnum_0, vcrlin_0, pacnum_0, pacind_0, pacseq_0, vcrseq_0
    having count(*) > 1

)

select count(*)
from validation_errors



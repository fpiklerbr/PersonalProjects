





with validation_errors as (

    select
        stofcy_0, updcod_0, itmref_0, iptdat_0, mvtseq_0, mvtind_0
    from `ff-stadiumgoods-raw-live`.`live`.`stojou`

    group by stofcy_0, updcod_0, itmref_0, iptdat_0, mvtseq_0, mvtind_0
    having count(*) > 1

)

select count(*)
from validation_errors



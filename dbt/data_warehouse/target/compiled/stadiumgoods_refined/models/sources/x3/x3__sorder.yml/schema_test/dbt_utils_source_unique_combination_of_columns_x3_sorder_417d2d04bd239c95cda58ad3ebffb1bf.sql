





with validation_errors as (

    select
        sohnum_0, bpisat_0, bpicry_0, bpdsat_0, bpdcry_0, upddattim_0, rowid, orddat_0, credat_0, ymageml_0, ymagbpc_0, ymagord_0, bpcord_0, bpaadd_0
    from `ff-stadiumgoods-raw-live`.`live`.`sorder`

    group by sohnum_0, bpisat_0, bpicry_0, bpdsat_0, bpdcry_0, upddattim_0, rowid, orddat_0, credat_0, ymageml_0, ymagbpc_0, ymagord_0, bpcord_0, bpaadd_0
    having count(*) > 1

)

select count(*)
from validation_errors



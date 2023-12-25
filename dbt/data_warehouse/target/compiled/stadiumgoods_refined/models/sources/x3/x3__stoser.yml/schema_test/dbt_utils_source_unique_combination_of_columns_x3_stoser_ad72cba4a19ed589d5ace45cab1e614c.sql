





with validation_errors as (

    select
        itmref_0, sdhtyp_0, sdhnum_0, sddlin_0, sernum_0
    from `ff-stadiumgoods-raw-live`.`live`.`stoser`

    group by itmref_0, sdhtyp_0, sdhnum_0, sddlin_0, sernum_0
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        codfic_0, zone_0, langue_0, ident1_0, ident2_0
    from `ff-stadiumgoods-raw-live`.`live`.`atextra`

    group by codfic_0, zone_0, langue_0, ident1_0, ident2_0
    having count(*) > 1

)

select count(*)
from validation_errors




    
    



select count(*) as validation_errors
from (

    select
        serials_acronym

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier`
    where serials_acronym is not null
    group by serials_acronym
    having count(*) > 1

) validation_errors



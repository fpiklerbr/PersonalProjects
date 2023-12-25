
    
    



select count(*) as validation_errors
from (

    select
        supplier_acronym

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_dss_parent_company`
    where supplier_acronym is not null
    group by supplier_acronym
    having count(*) > 1

) validation_errors



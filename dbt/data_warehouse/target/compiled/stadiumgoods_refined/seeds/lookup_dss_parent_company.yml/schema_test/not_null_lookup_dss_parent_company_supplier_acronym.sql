
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_dss_parent_company`
where supplier_acronym is null



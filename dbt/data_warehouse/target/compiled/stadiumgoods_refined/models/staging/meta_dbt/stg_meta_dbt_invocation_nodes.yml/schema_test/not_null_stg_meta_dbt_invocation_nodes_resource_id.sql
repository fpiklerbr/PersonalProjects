
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_meta_dbt_invocation_nodes`
where resource_id is null



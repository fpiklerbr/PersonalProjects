
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`meta_dbt_invocations`
where dbt_invocation_id is null



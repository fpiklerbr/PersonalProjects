
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_invocations`
where dbt_invocation_id is null



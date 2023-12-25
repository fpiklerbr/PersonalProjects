
    
    



select count(*) as validation_errors
from (

    select
        dbt_invocation_id

    from `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_invocations`
    where dbt_invocation_id is not null
    group by dbt_invocation_id
    having count(*) > 1

) validation_errors



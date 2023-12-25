
    
    



select count(*) as validation_errors
from (

    select
        dbt_invocation_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`meta_dbt_invocations`
    where dbt_invocation_id is not null
    group by dbt_invocation_id
    having count(*) > 1

) validation_errors



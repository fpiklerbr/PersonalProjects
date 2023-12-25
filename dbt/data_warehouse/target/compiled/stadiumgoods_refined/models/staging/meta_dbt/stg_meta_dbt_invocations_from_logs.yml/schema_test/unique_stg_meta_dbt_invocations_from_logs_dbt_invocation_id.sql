
    
    



select count(*) as validation_errors
from (

    select
        dbt_invocation_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_meta_dbt_invocations_from_logs`
    where dbt_invocation_id is not null
    group by dbt_invocation_id
    having count(*) > 1

) validation_errors



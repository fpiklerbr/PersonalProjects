
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_meta_dbt_invocations_from_logs`
where dbt_invocation_id is null



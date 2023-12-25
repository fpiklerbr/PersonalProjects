
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_meta_dbt_model_runs_from_artifacts`
where dbt_invocation_id is null



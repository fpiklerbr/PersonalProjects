





with validation_errors as (

    select
        dbt_invocation_id, model_name, event_type
    from `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_model_run_events`

    group by dbt_invocation_id, model_name, event_type
    having count(*) > 1

)

select count(*)
from validation_errors



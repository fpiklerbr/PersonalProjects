
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_model_run_events`
where event_type is null



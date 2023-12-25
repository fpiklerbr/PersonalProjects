
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`meta_dbt`.`dbt_run_results_json`
where file_name is null



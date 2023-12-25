
    
    



select count(*) as validation_errors
from (

    select
        file_name

    from `ff-stadiumgoods-raw-live`.`meta_dbt`.`dbt_run_results_json`
    where file_name is not null
    group by file_name
    having count(*) > 1

) validation_errors



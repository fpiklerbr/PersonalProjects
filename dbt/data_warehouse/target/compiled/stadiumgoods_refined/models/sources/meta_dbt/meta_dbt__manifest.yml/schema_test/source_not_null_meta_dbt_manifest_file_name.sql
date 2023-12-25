
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`meta_dbt`.`dbt_manifest_json`
where file_name is null



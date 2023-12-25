
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`meta_dbt_relation_dependencies`
where downstream_resource_id is null



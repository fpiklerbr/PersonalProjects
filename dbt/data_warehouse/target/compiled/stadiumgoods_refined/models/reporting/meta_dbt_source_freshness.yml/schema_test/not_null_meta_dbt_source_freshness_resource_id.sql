
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`meta_dbt_source_freshness`
where resource_id is null



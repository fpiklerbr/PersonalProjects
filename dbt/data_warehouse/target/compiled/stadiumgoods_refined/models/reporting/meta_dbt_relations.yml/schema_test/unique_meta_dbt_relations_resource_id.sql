
    
    



select count(*) as validation_errors
from (

    select
        resource_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`meta_dbt_relations`
    where resource_id is not null
    group by resource_id
    having count(*) > 1

) validation_errors



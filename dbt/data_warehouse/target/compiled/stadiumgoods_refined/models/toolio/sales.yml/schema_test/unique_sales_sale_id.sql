
    
    



select count(*) as validation_errors
from (

    select
        sale_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_toolio`.`sales`
    where sale_id is not null
    group by sale_id
    having count(*) > 1

) validation_errors




    
    



select count(*) as validation_errors
from (

    select
        price_change_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`sp_price_changes`
    where price_change_id is not null
    group by price_change_id
    having count(*) > 1

) validation_errors



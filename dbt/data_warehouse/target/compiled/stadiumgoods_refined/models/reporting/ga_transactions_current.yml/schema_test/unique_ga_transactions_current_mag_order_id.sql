
    
    



select count(*) as validation_errors
from (

    select
        mag_order_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`ga_transactions_current`
    where mag_order_id is not null
    group by mag_order_id
    having count(*) > 1

) validation_errors



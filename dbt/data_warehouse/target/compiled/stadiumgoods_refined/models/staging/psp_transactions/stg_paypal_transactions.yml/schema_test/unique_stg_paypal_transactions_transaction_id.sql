
    
    



select count(*) as validation_errors
from (

    select
        transaction_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_paypal_transactions`
    where transaction_id is not null
    group by transaction_id
    having count(*) > 1

) validation_errors



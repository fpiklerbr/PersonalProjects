
    
    



select count(*) as validation_errors
from (

    select
        private_client_customer_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_private_clients`
    where private_client_customer_id is not null
    group by private_client_customer_id
    having count(*) > 1

) validation_errors



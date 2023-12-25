
    
    



select count(*) as validation_errors
from (

    select
        ether_fms_payout_request_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`ether_payout_requests`
    where ether_fms_payout_request_id is not null
    group by ether_fms_payout_request_id
    having count(*) > 1

) validation_errors



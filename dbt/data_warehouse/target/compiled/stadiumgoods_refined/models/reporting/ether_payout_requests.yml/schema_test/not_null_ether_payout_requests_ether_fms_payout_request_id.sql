
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`ether_payout_requests`
where ether_fms_payout_request_id is null




    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_channel_upcharges`
where channel_or_gateway is null



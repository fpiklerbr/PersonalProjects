
    
    



select count(*) as validation_errors
from (

    select
        channel_or_gateway

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_channel_upcharges`
    where channel_or_gateway is not null
    group by channel_or_gateway
    having count(*) > 1

) validation_errors



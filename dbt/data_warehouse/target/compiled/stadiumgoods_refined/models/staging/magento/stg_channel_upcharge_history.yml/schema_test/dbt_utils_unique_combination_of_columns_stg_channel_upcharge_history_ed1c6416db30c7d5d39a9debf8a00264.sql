





with validation_errors as (

    select
        channel_or_gateway, upcharge_type, log_sequence
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_channel_upcharge_history`

    group by channel_or_gateway, upcharge_type, log_sequence
    having count(*) > 1

)

select count(*)
from validation_errors



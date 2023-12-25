





with validation_errors as (

    select
        channel_name, order_channel
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_magento_serial_price_channels`

    group by channel_name, order_channel
    having count(*) > 1

)

select count(*)
from validation_errors



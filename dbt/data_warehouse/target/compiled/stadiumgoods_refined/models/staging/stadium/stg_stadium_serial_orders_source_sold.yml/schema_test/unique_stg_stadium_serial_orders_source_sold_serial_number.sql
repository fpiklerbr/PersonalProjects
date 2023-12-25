
    
    



select count(*) as validation_errors
from (

    select
        serial_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_serial_orders_source_sold`
    where serial_number is not null
    group by serial_number
    having count(*) > 1

) validation_errors



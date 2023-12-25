
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_serial_orders_source_sold`
where serial_number is null



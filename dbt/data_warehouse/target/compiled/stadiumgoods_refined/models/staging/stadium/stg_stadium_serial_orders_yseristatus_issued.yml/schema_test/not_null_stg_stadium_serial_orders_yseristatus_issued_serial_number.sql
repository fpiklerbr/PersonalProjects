
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_serial_orders_yseristatus_issued`
where serial_number is null



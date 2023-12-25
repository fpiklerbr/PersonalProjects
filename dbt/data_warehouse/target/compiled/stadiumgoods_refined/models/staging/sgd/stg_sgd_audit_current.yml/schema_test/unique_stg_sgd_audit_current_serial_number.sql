
    
    



select count(*) as validation_errors
from (

    select
        serial_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_sgd_audit_current`
    where serial_number is not null
    group by serial_number
    having count(*) > 1

) validation_errors



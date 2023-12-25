
    
    



select count(*) as validation_errors
from (

    select
        serial_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`audit_magento_and_ether_serials`
    where serial_number is not null
    group by serial_number
    having count(*) > 1

) validation_errors



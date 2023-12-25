
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_zebra_shipped_serials`
where serial_number is null



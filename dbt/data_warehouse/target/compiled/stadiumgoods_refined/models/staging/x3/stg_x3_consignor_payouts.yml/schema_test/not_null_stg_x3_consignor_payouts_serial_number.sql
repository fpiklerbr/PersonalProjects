
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_consignor_payouts`
where serial_number is null



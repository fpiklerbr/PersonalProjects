
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tableau_inventory_age_1p_inventory_snapshot`
where serial_number is null



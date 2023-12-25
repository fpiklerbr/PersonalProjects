
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_inventory_units_converted_currency`
where ether_wms_inventory_unit_id is null



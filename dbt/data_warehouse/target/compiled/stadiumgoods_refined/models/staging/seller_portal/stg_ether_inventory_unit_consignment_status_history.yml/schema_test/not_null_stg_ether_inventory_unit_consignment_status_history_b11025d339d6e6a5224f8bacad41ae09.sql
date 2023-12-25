
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_inventory_unit_consignment_status_history`
where ether_wms_inventory_unit_version_id is null



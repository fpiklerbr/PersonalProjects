
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_fulfillment_allocations`
where ether_wms_allocation_id is null



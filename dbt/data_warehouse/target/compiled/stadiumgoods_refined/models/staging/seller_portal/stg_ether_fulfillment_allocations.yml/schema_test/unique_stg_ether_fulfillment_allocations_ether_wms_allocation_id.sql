
    
    



select count(*) as validation_errors
from (

    select
        ether_wms_allocation_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_fulfillment_allocations`
    where ether_wms_allocation_id is not null
    group by ether_wms_allocation_id
    having count(*) > 1

) validation_errors



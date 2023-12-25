
    
    



select count(*) as validation_errors
from (

    select
        ether_wms_inventory_unit_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_inventory_unit_price_history_summary`
    where ether_wms_inventory_unit_id is not null
    group by ether_wms_inventory_unit_id
    having count(*) > 1

) validation_errors



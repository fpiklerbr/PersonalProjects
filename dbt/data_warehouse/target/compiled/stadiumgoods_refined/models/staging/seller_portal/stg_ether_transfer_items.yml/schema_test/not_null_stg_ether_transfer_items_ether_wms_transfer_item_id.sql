
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_transfer_items`
where ether_wms_transfer_item_id is null



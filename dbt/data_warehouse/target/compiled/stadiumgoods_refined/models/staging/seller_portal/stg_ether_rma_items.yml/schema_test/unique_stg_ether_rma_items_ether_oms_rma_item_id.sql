
    
    



select count(*) as validation_errors
from (

    select
        ether_oms_rma_item_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_rma_items`
    where ether_oms_rma_item_id is not null
    group by ether_oms_rma_item_id
    having count(*) > 1

) validation_errors



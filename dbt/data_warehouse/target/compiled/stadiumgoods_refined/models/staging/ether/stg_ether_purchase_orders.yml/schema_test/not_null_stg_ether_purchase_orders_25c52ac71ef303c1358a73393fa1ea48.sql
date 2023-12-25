
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_purchase_orders`
where ether_commercial_purchase_order_id is null



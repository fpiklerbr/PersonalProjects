
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_purchase_order_lines`
where ether_commercial_purchase_order_line_item_id is null



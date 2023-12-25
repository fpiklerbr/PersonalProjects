
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_toolio`.`purchase_orders`
where po_line_id is null




    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_order_item_lines_x3_unmatched`
where x3_order_id is null



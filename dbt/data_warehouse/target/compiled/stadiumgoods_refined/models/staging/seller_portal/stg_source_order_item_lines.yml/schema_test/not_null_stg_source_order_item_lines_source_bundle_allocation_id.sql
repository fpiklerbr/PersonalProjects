
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_source_order_item_lines`
where source_bundle_allocation_id is null



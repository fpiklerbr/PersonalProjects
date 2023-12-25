
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_source_bundle_item_lines`
where source_bundle_item_line is null




    
    



select count(*) as validation_errors
from (

    select
        source_bundle_item_line

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_source_bundle_item_lines`
    where source_bundle_item_line is not null
    group by source_bundle_item_line
    having count(*) > 1

) validation_errors



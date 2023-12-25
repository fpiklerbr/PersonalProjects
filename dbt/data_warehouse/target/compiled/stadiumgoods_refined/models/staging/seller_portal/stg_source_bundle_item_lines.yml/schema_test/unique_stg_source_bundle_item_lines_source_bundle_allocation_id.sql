
    
    



select count(*) as validation_errors
from (

    select
        source_bundle_allocation_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_source_bundle_item_lines`
    where source_bundle_allocation_id is not null
    group by source_bundle_allocation_id
    having count(*) > 1

) validation_errors



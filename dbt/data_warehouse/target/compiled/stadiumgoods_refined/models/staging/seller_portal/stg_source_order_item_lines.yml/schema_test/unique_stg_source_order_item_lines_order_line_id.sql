
    
    



select count(*) as validation_errors
from (

    select
        order_line_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_source_order_item_lines`
    where order_line_id is not null
    group by order_line_id
    having count(*) > 1

) validation_errors



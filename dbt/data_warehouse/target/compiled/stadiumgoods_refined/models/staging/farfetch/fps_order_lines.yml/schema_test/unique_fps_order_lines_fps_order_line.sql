
    
    



select count(*) as validation_errors
from (

    select
        fps_order_line

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`fps_order_lines`
    where fps_order_line is not null
    group by fps_order_line
    having count(*) > 1

) validation_errors



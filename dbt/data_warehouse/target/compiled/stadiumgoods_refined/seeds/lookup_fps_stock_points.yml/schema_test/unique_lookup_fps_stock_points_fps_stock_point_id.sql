
    
    



select count(*) as validation_errors
from (

    select
        fps_stock_point_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_fps_stock_points`
    where fps_stock_point_id is not null
    group by fps_stock_point_id
    having count(*) > 1

) validation_errors



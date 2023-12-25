
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_fps_stock_points`
where fps_stock_point_id is null



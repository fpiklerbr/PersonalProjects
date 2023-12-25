





with validation_errors as (

    select
        farfetch_order_line_id, fps_stock_point_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_magento_fps_order_lines`

    group by farfetch_order_line_id, fps_stock_point_id
    having count(*) > 1

)

select count(*)
from validation_errors



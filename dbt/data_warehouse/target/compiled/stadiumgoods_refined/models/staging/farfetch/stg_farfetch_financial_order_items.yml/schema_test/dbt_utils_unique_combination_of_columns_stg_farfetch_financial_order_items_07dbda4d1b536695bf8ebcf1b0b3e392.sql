





with validation_errors as (

    select
        fps_order_id, fps_parent_product_id, fps_product_size
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_farfetch_financial_order_items`

    group by fps_order_id, fps_parent_product_id, fps_product_size
    having count(*) > 1

)

select count(*)
from validation_errors



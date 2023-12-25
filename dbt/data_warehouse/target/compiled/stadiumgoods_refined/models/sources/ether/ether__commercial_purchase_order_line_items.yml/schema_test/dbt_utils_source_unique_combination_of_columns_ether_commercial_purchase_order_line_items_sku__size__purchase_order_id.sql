





with validation_errors as (

    select
        sku, size, purchase_order_id
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_line_items`

    group by sku, size, purchase_order_id
    having count(*) > 1

)

select count(*)
from validation_errors



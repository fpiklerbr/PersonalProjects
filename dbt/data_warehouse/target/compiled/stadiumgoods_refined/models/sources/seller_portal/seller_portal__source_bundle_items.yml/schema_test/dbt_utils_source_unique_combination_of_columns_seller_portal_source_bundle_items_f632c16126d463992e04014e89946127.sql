





with validation_errors as (

    select
        bundle_id, manufacturer_sku, size
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_items`

    group by bundle_id, manufacturer_sku, size
    having count(*) > 1

)

select count(*)
from validation_errors



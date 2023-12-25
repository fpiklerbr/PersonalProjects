





with validation_errors as (

    select
        category_id, product_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_product`

    group by category_id, product_id
    having count(*) > 1

)

select count(*)
from validation_errors



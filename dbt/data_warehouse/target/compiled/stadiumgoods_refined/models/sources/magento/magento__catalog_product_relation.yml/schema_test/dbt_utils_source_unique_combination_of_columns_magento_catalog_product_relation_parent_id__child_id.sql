





with validation_errors as (

    select
        parent_id, child_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_relation`

    group by parent_id, child_id
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        simple_sku, color_name
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_product_color`

    group by simple_sku, color_name
    having count(*) > 1

)

select count(*)
from validation_errors



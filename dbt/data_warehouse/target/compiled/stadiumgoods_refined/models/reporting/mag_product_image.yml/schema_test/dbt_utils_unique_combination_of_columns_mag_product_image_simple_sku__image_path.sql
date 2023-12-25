





with validation_errors as (

    select
        simple_sku, image_path
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_product_image`

    group by simple_sku, image_path
    having count(*) > 1

)

select count(*)
from validation_errors




    
    



select count(*) as validation_errors
from (

    select
        simple_sku

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_product_category`
    where simple_sku is not null
    group by simple_sku
    having count(*) > 1

) validation_errors




    
    



select count(*) as validation_errors
from (

    select
        sku

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_products`
    where sku is not null
    group by sku
    having count(*) > 1

) validation_errors



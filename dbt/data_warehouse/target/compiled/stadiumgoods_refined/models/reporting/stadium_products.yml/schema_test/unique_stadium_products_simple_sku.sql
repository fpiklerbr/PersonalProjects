
    
    



select count(*) as validation_errors
from (

    select
        simple_sku

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_products`
    where simple_sku is not null
    group by simple_sku
    having count(*) > 1

) validation_errors



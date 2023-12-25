
    
    



select count(*) as validation_errors
from (

    select
        item_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`dss_seller_products`
    where item_number is not null
    group by item_number
    having count(*) > 1

) validation_errors



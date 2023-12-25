
    
    



select count(*) as validation_errors
from (

    select
        sku

    from `ff-stadiumgoods-raw-live`.`imports`.`sneaker_news_products`
    where sku is not null
    group by sku
    having count(*) > 1

) validation_errors



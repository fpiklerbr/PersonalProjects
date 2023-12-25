
    
    



select count(*) as validation_errors
from (

    select
        code

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pim_item_categories`
    where code is not null
    group by code
    having count(*) > 1

) validation_errors



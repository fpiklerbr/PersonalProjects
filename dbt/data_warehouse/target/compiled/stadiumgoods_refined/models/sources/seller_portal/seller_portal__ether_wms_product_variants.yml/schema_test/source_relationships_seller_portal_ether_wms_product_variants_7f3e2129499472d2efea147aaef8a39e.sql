
    
    




select count(*) as validation_errors
from (
    select sgp as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_product_variants`
) as child
left join (
    select sgp as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_products`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null




    
    




select count(*) as validation_errors
from (
    select product_id as id from `ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshot_product_variants`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshot_products`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



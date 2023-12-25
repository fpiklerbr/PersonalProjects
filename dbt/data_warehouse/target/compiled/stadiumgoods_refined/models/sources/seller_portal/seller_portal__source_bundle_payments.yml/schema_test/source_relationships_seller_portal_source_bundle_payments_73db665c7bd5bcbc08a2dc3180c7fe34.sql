
    
    




select count(*) as validation_errors
from (
    select bundle_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundles`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



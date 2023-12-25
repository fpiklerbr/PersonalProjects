
    
    




select count(*) as validation_errors
from (
    select order_item_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_rma_items`
) as child
left join (
    select order_item_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_order_items`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



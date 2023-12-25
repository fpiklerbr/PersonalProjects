
    
    




select count(*) as validation_errors
from (
    select mag_order_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_transactions`
) as child
left join (
    select mag_order_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_orders`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



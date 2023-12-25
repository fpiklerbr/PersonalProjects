
    
    




select count(*) as validation_errors
from (
    select x3_order_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_serial_documents`
) as child
left join (
    select x3_order_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_orders`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



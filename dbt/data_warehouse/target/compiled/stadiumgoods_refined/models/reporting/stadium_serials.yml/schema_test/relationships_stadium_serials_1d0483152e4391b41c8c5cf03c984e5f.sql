
    
    




select count(*) as validation_errors
from (
    select stadium_order_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_serials`
) as child
left join (
    select stadium_order_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_order_lines`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



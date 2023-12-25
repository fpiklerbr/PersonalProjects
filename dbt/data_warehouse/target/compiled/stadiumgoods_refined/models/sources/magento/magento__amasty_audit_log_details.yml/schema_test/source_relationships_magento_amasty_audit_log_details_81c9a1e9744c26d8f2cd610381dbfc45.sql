
    
    




select count(*) as validation_errors
from (
    select log_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log_details`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



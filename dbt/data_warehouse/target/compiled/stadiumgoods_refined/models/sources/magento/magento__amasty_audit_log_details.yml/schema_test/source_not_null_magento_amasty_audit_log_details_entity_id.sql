
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`amasty_audit_log_details`
where entity_id is null



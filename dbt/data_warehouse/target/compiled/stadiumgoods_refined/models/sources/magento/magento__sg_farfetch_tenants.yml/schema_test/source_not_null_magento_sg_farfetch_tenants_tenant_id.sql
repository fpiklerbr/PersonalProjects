
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_tenants`
where tenant_id is null



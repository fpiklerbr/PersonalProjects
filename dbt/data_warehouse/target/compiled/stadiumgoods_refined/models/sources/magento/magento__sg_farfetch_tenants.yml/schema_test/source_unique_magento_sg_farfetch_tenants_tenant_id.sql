
    
    



select count(*) as validation_errors
from (

    select
        tenant_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_tenants`
    where tenant_id is not null
    group by tenant_id
    having count(*) > 1

) validation_errors



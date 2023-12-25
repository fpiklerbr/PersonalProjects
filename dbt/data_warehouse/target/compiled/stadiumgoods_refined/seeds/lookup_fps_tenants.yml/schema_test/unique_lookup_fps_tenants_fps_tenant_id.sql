
    
    



select count(*) as validation_errors
from (

    select
        fps_tenant_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_fps_tenants`
    where fps_tenant_id is not null
    group by fps_tenant_id
    having count(*) > 1

) validation_errors



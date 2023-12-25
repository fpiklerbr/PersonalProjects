
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`lookup_fps_tenants`
where fps_tenant_id is null



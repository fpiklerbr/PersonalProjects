





with validation_errors as (

    select
        barcode_entity_id, tenant_entity_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_price`

    group by barcode_entity_id, tenant_entity_id
    having count(*) > 1

)

select count(*)
from validation_errors



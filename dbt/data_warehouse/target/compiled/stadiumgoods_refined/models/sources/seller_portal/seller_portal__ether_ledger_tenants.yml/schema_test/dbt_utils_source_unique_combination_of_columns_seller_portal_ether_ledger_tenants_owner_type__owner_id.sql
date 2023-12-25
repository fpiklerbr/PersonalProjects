





with validation_errors as (

    select
        owner_type, owner_id
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_tenants`

    group by owner_type, owner_id
    having count(*) > 1

)

select count(*)
from validation_errors



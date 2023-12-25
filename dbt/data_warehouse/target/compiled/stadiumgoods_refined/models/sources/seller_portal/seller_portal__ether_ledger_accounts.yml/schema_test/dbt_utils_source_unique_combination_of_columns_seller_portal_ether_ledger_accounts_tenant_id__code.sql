





with validation_errors as (

    select
        tenant_id, code
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`

    group by tenant_id, code
    having count(*) > 1

)

select count(*)
from validation_errors



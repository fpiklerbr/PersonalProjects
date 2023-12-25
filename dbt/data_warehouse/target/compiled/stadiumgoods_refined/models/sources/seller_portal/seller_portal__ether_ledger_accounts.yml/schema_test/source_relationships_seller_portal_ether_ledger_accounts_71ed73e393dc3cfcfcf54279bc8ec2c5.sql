
    
    




select count(*) as validation_errors
from (
    select tenant_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_tenants`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



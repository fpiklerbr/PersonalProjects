
    
    




select count(*) as validation_errors
from (
    select account_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_amounts`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null




    
    




select count(*) as validation_errors
from (
    select pay_method_configuration_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_payments`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payee_pay_method_configurations`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



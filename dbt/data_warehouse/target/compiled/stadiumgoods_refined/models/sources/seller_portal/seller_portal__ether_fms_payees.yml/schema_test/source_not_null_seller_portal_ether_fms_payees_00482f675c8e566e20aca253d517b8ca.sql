
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payees`
where use_financial_logs_for_payout_amount is null




    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_invoices`
where invoice_number is null



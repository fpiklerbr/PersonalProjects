





with validation_errors as (

    select
        invoice_number, request_id
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_invoices`

    group by invoice_number, request_id
    having count(*) > 1

)

select count(*)
from validation_errors



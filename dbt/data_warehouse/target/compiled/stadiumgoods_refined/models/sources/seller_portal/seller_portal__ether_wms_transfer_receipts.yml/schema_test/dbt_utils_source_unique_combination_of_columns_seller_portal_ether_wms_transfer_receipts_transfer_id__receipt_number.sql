





with validation_errors as (

    select
        transfer_id, receipt_number
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_receipts`

    group by transfer_id, receipt_number
    having count(*) > 1

)

select count(*)
from validation_errors



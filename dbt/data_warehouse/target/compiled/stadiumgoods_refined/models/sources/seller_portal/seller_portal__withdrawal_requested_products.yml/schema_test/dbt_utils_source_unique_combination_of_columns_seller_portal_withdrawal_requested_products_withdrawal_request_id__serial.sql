





with validation_errors as (

    select
        withdrawal_request_id, serial
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_request_items`

    group by withdrawal_request_id, serial
    having count(*) > 1

)

select count(*)
from validation_errors



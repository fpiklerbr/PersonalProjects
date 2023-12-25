





with validation_errors as (

    select
        amazon_order_id, asin
    from `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_order_reports_sp`

    group by amazon_order_id, asin
    having count(*) > 1

)

select count(*)
from validation_errors



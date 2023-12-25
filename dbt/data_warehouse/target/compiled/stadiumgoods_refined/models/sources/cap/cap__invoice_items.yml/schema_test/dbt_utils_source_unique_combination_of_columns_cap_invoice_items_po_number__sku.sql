





with validation_errors as (

    select
        po_number, sku
    from `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_items`

    group by po_number, sku
    having count(*) > 1

)

select count(*)
from validation_errors



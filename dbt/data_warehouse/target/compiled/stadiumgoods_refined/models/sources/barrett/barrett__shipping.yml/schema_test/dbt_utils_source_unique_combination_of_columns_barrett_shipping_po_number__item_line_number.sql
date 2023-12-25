





with validation_errors as (

    select
        po_number, item_line_number
    from `ff-stadiumgoods-raw-live`.`imports`.`barrett_shipping`

    group by po_number, item_line_number
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        po_number, line_number
    from `ff-stadiumgoods-raw-live`.`imports`.`cap_shipping`

    group by po_number, line_number
    having count(*) > 1

)

select count(*)
from validation_errors



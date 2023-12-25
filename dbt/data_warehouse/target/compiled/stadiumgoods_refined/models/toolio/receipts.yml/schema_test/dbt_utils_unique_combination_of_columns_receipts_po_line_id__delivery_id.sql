





with validation_errors as (

    select
        po_line_id, delivery_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_toolio`.`receipts`

    group by po_line_id, delivery_id
    having count(*) > 1

)

select count(*)
from validation_errors



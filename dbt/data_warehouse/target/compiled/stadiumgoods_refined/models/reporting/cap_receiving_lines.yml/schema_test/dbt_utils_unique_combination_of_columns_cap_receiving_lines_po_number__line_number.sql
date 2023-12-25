





with validation_errors as (

    select
        po_number, line_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`cap_receiving_lines`

    group by po_number, line_number
    having count(*) > 1

)

select count(*)
from validation_errors



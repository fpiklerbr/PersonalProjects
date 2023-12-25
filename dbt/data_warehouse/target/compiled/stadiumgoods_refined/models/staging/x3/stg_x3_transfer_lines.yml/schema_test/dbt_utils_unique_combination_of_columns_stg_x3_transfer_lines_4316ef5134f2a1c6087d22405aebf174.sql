





with validation_errors as (

    select
        transfer_number, transfer_item_line_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_transfer_lines`

    group by transfer_number, transfer_item_line_number
    having count(*) > 1

)

select count(*)
from validation_errors



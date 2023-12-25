





with validation_errors as (

    select
        stadium_order_id, serial_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_order_item_line_info`

    group by stadium_order_id, serial_number
    having count(*) > 1

)

select count(*)
from validation_errors



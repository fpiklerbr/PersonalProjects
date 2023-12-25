





with validation_errors as (

    select
        serial_number, zebra_tracking_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_zebra_shipped_serials`

    group by serial_number, zebra_tracking_number
    having count(*) > 1

)

select count(*)
from validation_errors



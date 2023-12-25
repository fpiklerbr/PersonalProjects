





with validation_errors as (

    select
        serial_number, x3_sku
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_serial_info`

    group by serial_number, x3_sku
    having count(*) > 1

)

select count(*)
from validation_errors



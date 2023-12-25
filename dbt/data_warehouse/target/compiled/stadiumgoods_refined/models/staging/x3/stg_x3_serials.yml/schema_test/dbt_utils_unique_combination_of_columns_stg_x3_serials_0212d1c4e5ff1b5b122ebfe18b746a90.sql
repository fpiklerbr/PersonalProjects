





with validation_errors as (

    select
        serial_number, x3_sku, serial_warehouse
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_serials`

    group by serial_number, x3_sku, serial_warehouse
    having count(*) > 1

)

select count(*)
from validation_errors



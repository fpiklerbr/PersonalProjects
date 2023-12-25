





with validation_errors as (

    select
        serial_number, snapshot_date
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tableau_inventory_age_1p_inventory_snapshot`

    group by serial_number, snapshot_date
    having count(*) > 1

)

select count(*)
from validation_errors



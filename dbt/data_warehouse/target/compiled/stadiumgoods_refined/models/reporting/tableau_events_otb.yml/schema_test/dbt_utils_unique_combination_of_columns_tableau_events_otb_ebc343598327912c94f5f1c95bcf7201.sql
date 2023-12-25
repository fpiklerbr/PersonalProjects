





with validation_errors as (

    select
        inventory_date, simple_sku, serial_relationship, serial_inventory, warehouse
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tableau_events_otb`

    group by inventory_date, simple_sku, serial_relationship, serial_inventory, warehouse
    having count(*) > 1

)

select count(*)
from validation_errors



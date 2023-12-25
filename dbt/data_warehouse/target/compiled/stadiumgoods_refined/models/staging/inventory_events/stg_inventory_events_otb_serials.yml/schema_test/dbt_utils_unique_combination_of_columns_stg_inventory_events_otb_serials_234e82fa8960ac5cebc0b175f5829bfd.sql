





with validation_errors as (

    select
        serial_number, inventory_date, event_class, event_type
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_inventory_events_otb_serials`

    group by serial_number, inventory_date, event_class, event_type
    having count(*) > 1

)

select count(*)
from validation_errors



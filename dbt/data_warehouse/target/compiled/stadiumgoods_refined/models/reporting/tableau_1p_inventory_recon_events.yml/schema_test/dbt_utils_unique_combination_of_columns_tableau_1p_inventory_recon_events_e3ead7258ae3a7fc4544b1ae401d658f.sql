





with validation_errors as (

    select
        serial_number, transaction_date, event_class, event_type
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tableau_1p_inventory_recon_events`

    group by serial_number, transaction_date, event_class, event_type
    having count(*) > 1

)

select count(*)
from validation_errors



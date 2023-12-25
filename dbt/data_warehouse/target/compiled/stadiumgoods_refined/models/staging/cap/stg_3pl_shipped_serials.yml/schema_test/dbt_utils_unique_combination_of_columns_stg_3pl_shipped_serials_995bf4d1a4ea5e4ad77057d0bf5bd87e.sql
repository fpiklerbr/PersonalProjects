





with validation_errors as (

    select
        ship_warehouse, fulfillment_number, allocation_line_number, reporting_priority
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_3pl_shipped_serials`

    group by ship_warehouse, fulfillment_number, allocation_line_number, reporting_priority
    having count(*) > 1

)

select count(*)
from validation_errors



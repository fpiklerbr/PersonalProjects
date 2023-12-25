





with validation_errors as (

    select
        reporting_month, reporting_status, business_unit, sales_channel, inventory_relationship, snapshot_date
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_snapshot_validation`

    group by reporting_month, reporting_status, business_unit, sales_channel, inventory_relationship, snapshot_date
    having count(*) > 1

)

select count(*)
from validation_errors



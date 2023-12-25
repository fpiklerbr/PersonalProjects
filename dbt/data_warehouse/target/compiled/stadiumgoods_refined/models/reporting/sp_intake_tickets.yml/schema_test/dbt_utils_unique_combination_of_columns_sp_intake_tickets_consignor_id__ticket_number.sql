





with validation_errors as (

    select
        consignor_id, ticket_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`sp_intake_tickets`

    group by consignor_id, ticket_number
    having count(*) > 1

)

select count(*)
from validation_errors



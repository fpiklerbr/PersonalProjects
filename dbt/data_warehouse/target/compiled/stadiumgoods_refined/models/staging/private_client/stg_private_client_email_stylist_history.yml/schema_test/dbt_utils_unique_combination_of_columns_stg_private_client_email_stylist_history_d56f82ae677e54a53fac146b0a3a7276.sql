





with validation_errors as (

    select
        customer_email, stylist_name, valid_from, valid_to
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_private_client_email_stylist_history`

    group by customer_email, stylist_name, valid_from, valid_to
    having count(*) > 1

)

select count(*)
from validation_errors



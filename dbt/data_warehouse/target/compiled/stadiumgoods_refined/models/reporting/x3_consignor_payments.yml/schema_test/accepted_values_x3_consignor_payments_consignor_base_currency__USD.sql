
    
    




with all_values as (

    select distinct
        consignor_base_currency as value_field

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`x3_consignor_payments`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'USD'
    )
)

select count(*) as validation_errors
from validation_errors



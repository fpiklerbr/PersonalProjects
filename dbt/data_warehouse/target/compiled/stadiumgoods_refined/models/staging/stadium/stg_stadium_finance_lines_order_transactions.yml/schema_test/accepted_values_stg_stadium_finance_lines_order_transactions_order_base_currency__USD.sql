
    
    




with all_values as (

    select distinct
        order_base_currency as value_field

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_finance_lines_order_transactions`

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



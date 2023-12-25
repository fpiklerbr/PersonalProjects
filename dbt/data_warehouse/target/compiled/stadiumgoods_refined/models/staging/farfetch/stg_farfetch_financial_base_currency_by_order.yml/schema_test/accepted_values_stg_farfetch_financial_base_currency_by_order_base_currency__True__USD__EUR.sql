
    
    




with all_values as (

    select distinct
        base_currency as value_field

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_farfetch_financial_base_currency_by_order`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'USD','EUR'
    )
)

select count(*) as validation_errors
from validation_errors



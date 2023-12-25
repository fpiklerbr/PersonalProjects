





with validation_errors as (

    select
        model_name, field_name
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_seeds`.`pii_fields`

    group by model_name, field_name
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        dbt_invocation_id, resource_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_meta_dbt_invocation_sources`

    group by dbt_invocation_id, resource_id
    having count(*) > 1

)

select count(*)
from validation_errors



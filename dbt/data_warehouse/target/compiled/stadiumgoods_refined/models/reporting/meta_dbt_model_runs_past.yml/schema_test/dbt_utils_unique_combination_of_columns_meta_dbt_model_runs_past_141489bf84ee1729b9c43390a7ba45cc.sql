





with validation_errors as (

    select
        dbt_invocation_id, database_schema, database_table
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`meta_dbt_model_runs_past`

    group by dbt_invocation_id, database_schema, database_table
    having count(*) > 1

)

select count(*)
from validation_errors



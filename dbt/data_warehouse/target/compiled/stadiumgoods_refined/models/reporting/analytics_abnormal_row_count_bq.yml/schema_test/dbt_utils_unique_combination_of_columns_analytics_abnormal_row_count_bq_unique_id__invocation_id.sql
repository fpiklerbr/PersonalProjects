





with validation_errors as (

    select
        unique_id, invocation_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`analytics_abnormal_row_count_bq`

    group by unique_id, invocation_id
    having count(*) > 1

)

select count(*)
from validation_errors



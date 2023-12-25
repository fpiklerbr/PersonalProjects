





with validation_errors as (

    select
        downstream_resource_id, upstream_resource_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`meta_dbt_relation_dependencies`

    group by downstream_resource_id, upstream_resource_id
    having count(*) > 1

)

select count(*)
from validation_errors



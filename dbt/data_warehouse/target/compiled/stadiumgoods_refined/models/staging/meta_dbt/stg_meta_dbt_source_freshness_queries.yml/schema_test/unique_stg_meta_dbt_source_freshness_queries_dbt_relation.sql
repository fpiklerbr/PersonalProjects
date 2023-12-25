
    
    



select count(*) as validation_errors
from (

    select
        dbt_relation

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_meta_dbt_source_freshness_queries`
    where dbt_relation is not null
    group by dbt_relation
    having count(*) > 1

) validation_errors



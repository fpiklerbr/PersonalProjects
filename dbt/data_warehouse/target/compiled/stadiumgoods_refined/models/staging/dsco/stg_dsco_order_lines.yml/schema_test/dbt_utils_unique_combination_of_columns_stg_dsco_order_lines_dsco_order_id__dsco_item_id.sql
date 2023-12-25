





with validation_errors as (

    select
        dsco_order_id, dsco_item_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_dsco_order_lines`

    group by dsco_order_id, dsco_item_id
    having count(*) > 1

)

select count(*)
from validation_errors



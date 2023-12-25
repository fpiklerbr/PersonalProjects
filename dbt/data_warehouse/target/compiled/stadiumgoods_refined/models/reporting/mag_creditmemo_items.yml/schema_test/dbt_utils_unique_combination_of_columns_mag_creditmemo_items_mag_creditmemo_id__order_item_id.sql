





with validation_errors as (

    select
        mag_creditmemo_id, order_item_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_creditmemo_items`

    group by mag_creditmemo_id, order_item_id
    having count(*) > 1

)

select count(*)
from validation_errors



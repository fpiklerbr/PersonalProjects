





with validation_errors as (

    select
        ether_commercial_purchase_order_line_item_id, original_intake_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_purchase_order_lines`

    group by ether_commercial_purchase_order_line_item_id, original_intake_id
    having count(*) > 1

)

select count(*)
from validation_errors



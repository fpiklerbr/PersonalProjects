





with validation_errors as (

    select
        cap_order_id, inventory_unit_label_number
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_cap_invoiced_item_costs`

    group by cap_order_id, inventory_unit_label_number
    having count(*) > 1

)

select count(*)
from validation_errors



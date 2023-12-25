





with validation_errors as (

    select
        tracking_number, ship_date, invoice_id, operations_subcategory
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_cap_invoiced_shipping_costs`

    group by tracking_number, ship_date, invoice_id, operations_subcategory
    having count(*) > 1

)

select count(*)
from validation_errors



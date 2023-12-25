





with validation_errors as (

    select
        tracking_number, ship_date, invoice_date, invoice_id, cap_client_center, operations_category, operations_subcategory
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_cap_invoiced_costs`

    group by tracking_number, ship_date, invoice_date, invoice_id, cap_client_center, operations_category, operations_subcategory
    having count(*) > 1

)

select count(*)
from validation_errors



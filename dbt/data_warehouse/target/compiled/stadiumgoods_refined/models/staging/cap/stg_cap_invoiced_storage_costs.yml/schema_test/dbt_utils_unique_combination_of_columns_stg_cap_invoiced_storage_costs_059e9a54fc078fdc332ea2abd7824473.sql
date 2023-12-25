





with validation_errors as (

    select
        invoice_id, operations_subcategory
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_cap_invoiced_storage_costs`

    group by invoice_id, operations_subcategory
    having count(*) > 1

)

select count(*)
from validation_errors



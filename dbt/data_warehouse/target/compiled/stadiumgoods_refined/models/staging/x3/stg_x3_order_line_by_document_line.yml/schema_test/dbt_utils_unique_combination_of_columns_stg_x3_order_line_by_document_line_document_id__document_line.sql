





with validation_errors as (

    select
        document_id, document_line
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_order_line_by_document_line`

    group by document_id, document_line
    having count(*) > 1

)

select count(*)
from validation_errors



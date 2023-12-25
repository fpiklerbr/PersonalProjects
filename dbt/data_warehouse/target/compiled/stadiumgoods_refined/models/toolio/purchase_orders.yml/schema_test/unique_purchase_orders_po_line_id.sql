
    
    



select count(*) as validation_errors
from (

    select
        po_line_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_toolio`.`purchase_orders`
    where po_line_id is not null
    group by po_line_id
    having count(*) > 1

) validation_errors




    
    



select count(*) as validation_errors
from (

    select
        shipment_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_seller_portal_shipments_without_ticket_items`
    where shipment_id is not null
    group by shipment_id
    having count(*) > 1

) validation_errors



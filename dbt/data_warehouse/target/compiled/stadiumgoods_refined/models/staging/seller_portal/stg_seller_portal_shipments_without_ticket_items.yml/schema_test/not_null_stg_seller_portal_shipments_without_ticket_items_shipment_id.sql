
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_seller_portal_shipments_without_ticket_items`
where shipment_id is null



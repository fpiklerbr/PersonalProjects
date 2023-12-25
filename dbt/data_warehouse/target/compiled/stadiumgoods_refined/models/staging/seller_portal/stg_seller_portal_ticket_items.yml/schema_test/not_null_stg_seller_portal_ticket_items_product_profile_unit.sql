
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_seller_portal_ticket_items`
where product_profile_unit is null



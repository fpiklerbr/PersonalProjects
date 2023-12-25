
    
    



select count(*) as validation_errors
from (

    select
        product_profile_unit

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_seller_portal_ticket_items`
    where product_profile_unit is not null
    group by product_profile_unit
    having count(*) > 1

) validation_errors



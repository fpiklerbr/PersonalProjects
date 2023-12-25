
    
    



select count(*) as validation_errors
from (

    select
        user_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_seller_portal_users`
    where user_id is not null
    group by user_id
    having count(*) > 1

) validation_errors



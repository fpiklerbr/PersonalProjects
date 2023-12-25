





with validation_errors as (

    select
        email, website_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`customer_entity`

    group by email, website_id
    having count(*) > 1

)

select count(*)
from validation_errors



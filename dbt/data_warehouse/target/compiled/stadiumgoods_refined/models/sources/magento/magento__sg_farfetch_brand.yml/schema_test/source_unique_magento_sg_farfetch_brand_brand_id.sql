
    
    



select count(*) as validation_errors
from (

    select
        brand_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_brand`
    where brand_id is not null
    group by brand_id
    having count(*) > 1

) validation_errors



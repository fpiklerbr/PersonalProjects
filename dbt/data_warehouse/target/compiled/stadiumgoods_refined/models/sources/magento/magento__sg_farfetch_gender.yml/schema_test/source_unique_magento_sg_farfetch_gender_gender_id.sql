
    
    



select count(*) as validation_errors
from (

    select
        gender_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_gender`
    where gender_id is not null
    group by gender_id
    having count(*) > 1

) validation_errors



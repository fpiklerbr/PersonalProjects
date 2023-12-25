
    
    



select count(*) as validation_errors
from (

    select
        season_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_season`
    where season_id is not null
    group by season_id
    having count(*) > 1

) validation_errors



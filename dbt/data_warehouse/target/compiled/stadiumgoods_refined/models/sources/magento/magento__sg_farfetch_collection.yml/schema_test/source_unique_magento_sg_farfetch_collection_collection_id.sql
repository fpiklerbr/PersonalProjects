
    
    



select count(*) as validation_errors
from (

    select
        collection_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_collection`
    where collection_id is not null
    group by collection_id
    having count(*) > 1

) validation_errors



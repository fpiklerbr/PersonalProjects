
    
    



select count(*) as validation_errors
from (

    select
        comment_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_comment`
    where comment_id is not null
    group by comment_id
    having count(*) > 1

) validation_errors



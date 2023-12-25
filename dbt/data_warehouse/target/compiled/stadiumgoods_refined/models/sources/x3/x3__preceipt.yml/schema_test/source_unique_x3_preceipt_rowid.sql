
    
    



select count(*) as validation_errors
from (

    select
        rowid

    from `ff-stadiumgoods-raw-live`.`live`.`preceipt`
    where rowid is not null
    group by rowid
    having count(*) > 1

) validation_errors



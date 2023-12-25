
    
    



select count(*) as validation_errors
from (

    select
        id

    from `ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshots`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors



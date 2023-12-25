
    
    



select count(*) as validation_errors
from (

    select
        consignor_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_consignors`
    where consignor_id is not null
    group by consignor_id
    having count(*) > 1

) validation_errors



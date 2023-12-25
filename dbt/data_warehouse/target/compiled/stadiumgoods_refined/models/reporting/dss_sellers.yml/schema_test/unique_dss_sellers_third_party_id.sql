
    
    



select count(*) as validation_errors
from (

    select
        third_party_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`dss_sellers`
    where third_party_id is not null
    group by third_party_id
    having count(*) > 1

) validation_errors



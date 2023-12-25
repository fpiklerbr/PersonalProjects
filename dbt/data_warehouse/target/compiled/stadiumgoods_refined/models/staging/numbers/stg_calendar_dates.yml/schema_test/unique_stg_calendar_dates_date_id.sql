
    
    



select count(*) as validation_errors
from (

    select
        date_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_calendar_dates`
    where date_id is not null
    group by date_id
    having count(*) > 1

) validation_errors



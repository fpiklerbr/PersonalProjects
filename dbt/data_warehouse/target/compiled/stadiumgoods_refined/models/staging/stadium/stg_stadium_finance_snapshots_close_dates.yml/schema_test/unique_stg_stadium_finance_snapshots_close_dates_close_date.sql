
    
    



select count(*) as validation_errors
from (

    select
        close_date

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_finance_snapshots_close_dates`
    where close_date is not null
    group by close_date
    having count(*) > 1

) validation_errors



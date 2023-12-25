
    
    



select count(*) as validation_errors
from (

    select
        farfetch_line_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`farfetch_return_lines`
    where farfetch_line_id is not null
    group by farfetch_line_id
    having count(*) > 1

) validation_errors



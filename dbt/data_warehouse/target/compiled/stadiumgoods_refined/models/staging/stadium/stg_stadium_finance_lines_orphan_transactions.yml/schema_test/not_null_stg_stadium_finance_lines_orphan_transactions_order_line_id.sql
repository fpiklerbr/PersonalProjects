
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_finance_lines_orphan_transactions`
where order_line_id is null



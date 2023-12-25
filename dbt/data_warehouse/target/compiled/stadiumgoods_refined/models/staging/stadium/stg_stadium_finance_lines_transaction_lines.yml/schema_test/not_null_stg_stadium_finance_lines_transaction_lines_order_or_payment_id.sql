
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_finance_lines_transaction_lines`
where order_or_payment_id is null



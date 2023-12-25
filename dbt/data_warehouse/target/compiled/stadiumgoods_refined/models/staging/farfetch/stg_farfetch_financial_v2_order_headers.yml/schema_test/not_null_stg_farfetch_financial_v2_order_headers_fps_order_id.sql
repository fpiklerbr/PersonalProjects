
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_farfetch_financial_v2_order_headers`
where fps_order_id is null




    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_farfetch_financial_base_currency_by_order`
where fps_order_id is null



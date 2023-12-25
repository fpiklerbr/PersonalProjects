
    
    



select count(*) as validation_errors
from (

    select
        sales_flat_order_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_magento_order_addresses`
    where sales_flat_order_id is not null
    group by sales_flat_order_id
    having count(*) > 1

) validation_errors



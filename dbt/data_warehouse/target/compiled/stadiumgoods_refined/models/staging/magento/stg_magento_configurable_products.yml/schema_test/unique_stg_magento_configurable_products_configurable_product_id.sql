
    
    



select count(*) as validation_errors
from (

    select
        None

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_magento_configurable_products`
    where None is not null
    group by None
    having count(*) > 1

) validation_errors




    
    



select count(*) as validation_errors
from (

    select
        mfg_sku

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_farfetch_products`
    where mfg_sku is not null
    group by mfg_sku
    having count(*) > 1

) validation_errors



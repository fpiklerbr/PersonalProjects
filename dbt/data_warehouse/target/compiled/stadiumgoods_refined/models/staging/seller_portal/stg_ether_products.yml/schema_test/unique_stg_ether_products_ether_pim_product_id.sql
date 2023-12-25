
    
    



select count(*) as validation_errors
from (

    select
        ether_pim_product_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_products`
    where ether_pim_product_id is not null
    group by ether_pim_product_id
    having count(*) > 1

) validation_errors



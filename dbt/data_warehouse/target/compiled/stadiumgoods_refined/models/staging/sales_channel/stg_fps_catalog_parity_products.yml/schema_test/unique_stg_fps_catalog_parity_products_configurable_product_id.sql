
    
    



select count(*) as validation_errors
from (

    select
        configurable_product_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_fps_catalog_parity_products`
    where configurable_product_id is not null
    group by configurable_product_id
    having count(*) > 1

) validation_errors



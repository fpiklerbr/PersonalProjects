
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_fps_catalog_parity_products`
where configurable_product_id is null



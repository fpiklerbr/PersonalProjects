





with validation_errors as (

    select
        mfg_sku, farfetch_product_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`farfetch_products_current`

    group by mfg_sku, farfetch_product_id
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        mfg_sku, size
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ff_product_size_conversion`

    group by mfg_sku, size
    having count(*) > 1

)

select count(*)
from validation_errors



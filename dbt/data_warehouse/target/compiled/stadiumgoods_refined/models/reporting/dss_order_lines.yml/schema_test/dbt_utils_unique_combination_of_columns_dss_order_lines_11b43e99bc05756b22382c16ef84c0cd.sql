





with validation_errors as (

    select
        stadium_order_id, product_sku, variant_size, order_sku_size_source_line
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`dss_order_lines`

    group by stadium_order_id, product_sku, variant_size, order_sku_size_source_line
    having count(*) > 1

)

select count(*)
from validation_errors



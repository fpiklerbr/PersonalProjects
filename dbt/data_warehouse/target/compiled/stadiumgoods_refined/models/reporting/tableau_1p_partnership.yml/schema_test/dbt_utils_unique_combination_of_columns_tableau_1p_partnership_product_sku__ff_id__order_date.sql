





with validation_errors as (

    select
        product_sku, ff_id, order_date
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tableau_1p_partnership`

    group by product_sku, ff_id, order_date
    having count(*) > 1

)

select count(*)
from validation_errors



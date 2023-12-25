





with validation_errors as (

    select
        simple_sku, asin
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`amazon_marketplace_inventory`

    group by simple_sku, asin
    having count(*) > 1

)

select count(*)
from validation_errors



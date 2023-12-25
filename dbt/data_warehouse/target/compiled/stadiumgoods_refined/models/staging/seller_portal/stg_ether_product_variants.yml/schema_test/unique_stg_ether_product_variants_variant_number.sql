
    
    



select count(*) as validation_errors
from (

    select
        variant_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_product_variants`
    where variant_number is not null
    group by variant_number
    having count(*) > 1

) validation_errors



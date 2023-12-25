





with validation_errors as (

    select
        scrape_date, scrape_site, site_product_id, product_size, scrape_site_price, currency
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ff_product_matching`

    group by scrape_date, scrape_site, site_product_id, product_size, scrape_site_price, currency
    having count(*) > 1

)

select count(*)
from validation_errors









with validation_errors as (

    select
        scrape_source, scrape_date, scrape_site, mfg_sku, product_size, scrape_site_price, currency
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`competitive_pricing`

    group by scrape_source, scrape_date, scrape_site, mfg_sku, product_size, scrape_site_price, currency
    having count(*) > 1

)

select count(*)
from validation_errors



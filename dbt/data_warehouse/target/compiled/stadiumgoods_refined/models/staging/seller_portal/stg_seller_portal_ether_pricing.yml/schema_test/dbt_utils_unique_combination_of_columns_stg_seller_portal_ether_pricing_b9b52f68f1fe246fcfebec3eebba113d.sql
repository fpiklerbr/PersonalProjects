





with validation_errors as (

    select
        scrape_source, scrape_site, product_name, mfg_sku, scrape_date, product_size, scrape_site_price, ff_mapping_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_seller_portal_ether_pricing`

    group by scrape_source, scrape_site, product_name, mfg_sku, scrape_date, product_size, scrape_site_price, ff_mapping_id
    having count(*) > 1

)

select count(*)
from validation_errors





  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_ff_finance`.`ff_international_tax_report`
  
  
  OPTIONS()
  as (
    

-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_snapshots_close_dates`


    
    
    
    


SELECT
    stadium_finance_lines.reporting_date
  , extract(month FROM stadium_finance_lines.reporting_date) AS reporting_date_month_number
  , CASE
      WHEN stadium_finance_lines.sales_channel = 'Farfetch'
      THEN cast('farfetch.com' AS string)
      ELSE cast('stadiumgoods.com' AS string)
    END AS sales_channel
  , stadium_finance_lines.stadium_order_id AS `Order Number`
  , stadium_finance_lines.reporting_status AS `Order Status`
  , stadium_finance_lines.geography AS `Ship to Country`
  , stadium_finance_lines.dispatch_country AS `Ship from Country`
  , stadium_finance_lines.billing_country AS `Bill to Country`
  , stadium_finance_lines.billing_city AS `Bill to City`
  , stadium_finance_lines.seller_country AS `Bill from Country`
  , stadium_finance_lines.seller_city AS `Bill from City`
  , cast(stadium_finance_lines.revenue_total AS numeric) AS revenue_total
  , cast(stadium_finance_lines.revenue_shipping AS numeric) AS `Shipping revenue`
  , cast(stadium_finance_lines.line_duties_paid AS numeric) AS `Duties revenue`
  , abs(cast(stadium_finance_lines.cogs_total AS numeric)) AS cogs_total
  , stadium_finance_lines.inventory_relationship
  , cast('2023-11-30' AS date) AS month_ending
  , cast('2023-12-05' AS date) AS snapshot_date
FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205` AS stadium_finance_lines
WHERE stadium_finance_lines.geography_type = 'International'
  AND stadium_finance_lines.sales_channel in ('Farfetch', 'SG App', 'FPS DTC', 'eBay, SG Web', 'SG Web')
  AND stadium_finance_lines.reporting_status in ('Dispatched', 'Returned')
  AND stadium_finance_lines.reporting_date <= cast('2023-11-30' AS date)
  AND extract(year FROM stadium_finance_lines.reporting_date) = extract(year FROM cast('2023-11-30' AS date))
ORDER BY 1 DESC
  );
    
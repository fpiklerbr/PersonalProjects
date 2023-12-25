

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_catalog_audits_ebay`
  
  
  OPTIONS()
  as (
    

WITH sync AS (

  SELECT
    max(unioned.last_sync) AS ebay_inventory_time_nyc
  , max(mag.mag_last_sync) AS mag_inventory_time_nyc
  FROM (
    SELECT
     max(safe_cast(datetime(safe_cast(_synched_from_source_at AS timestamp), 'America/New_York') AS datetime)) AS last_sync
    FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product`
    UNION ALL
    SELECT
     max(safe_cast(datetime(safe_cast(_synched_from_source_at AS timestamp), 'America/New_York') AS datetime)) AS last_sync
    FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product_variation`
  ) AS unioned
  CROSS JOIN (
    SELECT
     max(safe_cast(datetime(safe_cast(_synched_from_source_at AS timestamp), 'America/New_York') AS datetime)) AS mag_last_sync
    FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial`
  ) AS mag

) , ebay AS (

  SELECT
    ebay_variation.online_sku simple_sku
  , ebay_product.ebay_item_id
  , ebay_variation.online_price ebay_price
  , (ebay_variation.online_qty - ebay_variation.online_qty_sold) AS ebay_qty
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_ebay_listing_product` AS ebay_product
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_ebay_listing_product_variation` ebay_variation
  ON 
  CAST(regexp_extract(ebay_variation.online_sku, 
  r'^(.*?\|.*?)[-|]'
) AS string)
 = ebay_product.online_sku
  WHERE ebay_product.end_date > safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime)
  AND ebay_variation.status = 2

), mag AS (

  SELECT
    simple_sku
  , count(DISTINCT serial_number) AS mag_qty
  , min(price) AS mag_price
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial`
  WHERE status_id = 2
  AND warehouse_id in (1, 5, 30)
  GROUP BY 1

), final AS (

  SELECT *
  FROM ebay
  FULL JOIN mag USING (simple_sku)
  CROSS JOIN sync

)

SELECT * FROM final
  );
    
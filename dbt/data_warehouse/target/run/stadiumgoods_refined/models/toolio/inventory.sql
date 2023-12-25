

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_toolio`.`inventory`
  
  
  OPTIONS()
  as (
    


SELECT
  simple_sku AS variant_id
, CAST(

        datetime_add(
            cast( inventory_date as datetime),
        interval 1 day
        )

 AS date) AS timestamp
, serial_relationship
, business_entity AS BE
, serial_inventory AS FOB
, warehouse AS location
, CAST(NULL AS string) AS lifecycle
, eod_on_hand_units AS units_available
, eod_on_hand_cost AS total_cost
, eod_on_hand_retail AS total_retail
, eod_on_hand_intake AS total_ticket
, (eod_on_hand_intake - eod_on_hand_retail) AS markdown
, item_discount AS promo
, CASE WHEN (eod_on_hand_intake - eod_on_hand_retail) > 0 THEN 'Markdown'
   ELSE 'Full Price'
   END AS price_type
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_events_otb` AS otb
WHERE simple_sku IS NOT NULL
  );
    


  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_sgd_replenishment_serials`
  
  
  OPTIONS()
  as (
    

SELECT
  simple_sku
, serial_number
, serial_relationship AS inventory_relationship
, serial_inventory AS inventory_type
, x3_sku
, x3_size_uom
, commission_rate
, price AS serial_price
, serial_cost AS inventory_cost
, warehouse
, conditions
, nullif(
     greatest(
      coalesce(

    datetime_diff(
        cast(CAST(current_timestamp AS date) as datetime),
        cast(ss.original_intake_date as datetime),
        day
    )

+ 1, CAST('-9223372036854775808' AS int64))
      ,coalesce(0, CAST('-9223372036854775808' AS int64))
      
      )
     , CAST('-9223372036854775808' AS int64)
  ) AS inventory_age
-- current_timestamp needs to be in America/New_York tzone?
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS ss
WHERE yseristatus_consignment_status = 'In Stock'
AND warehouse IN ('CAP', 'SGD', 'CHI', 'CHW', 'BAR', 'LAW')
AND stock_status !='Q'
  );
    
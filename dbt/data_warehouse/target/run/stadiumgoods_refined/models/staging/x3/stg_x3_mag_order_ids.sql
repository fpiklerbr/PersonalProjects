

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_mag_order_ids`
  
  
  OPTIONS()
  as (
    

WITH mag_orders AS (

  SELECT
      mag_order_id
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`magento__sales_flat_order`

), exceptions AS (

  SELECT
      x3_order_id
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`exceptions_x3_orders_with_invalid_mag_order_ids`

), x3_orders AS (

  SELECT
      x3_order_id
    , mag_order_id AS mag_order_id_raw
    , 
  CAST(regexp_extract(mag_order_id, 
  r'[0-9]{9}'
) AS string)
 AS mag_order_id_substring
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorder`
  WHERE mag_order_id IS NOT NULL

), final AS (

  SELECT
      x3_order_id
    , coalesce(mag_orders_raw.mag_order_id, mag_orders_substring.mag_order_id) AS mag_order_id
  FROM x3_orders
  LEFT JOIN mag_orders AS mag_orders_raw
    ON x3_orders.mag_order_id_raw = mag_orders_raw.mag_order_id
  LEFT JOIN mag_orders AS mag_orders_substring
    ON x3_orders.mag_order_id_substring = mag_orders_substring.mag_order_id
  WHERE NOT EXISTS (SELECT * FROM exceptions WHERE x3_order_id = x3_orders.x3_order_id)
    AND coalesce(mag_orders_raw.mag_order_id, mag_orders_substring.mag_order_id) IS NOT NULL

)

SELECT * FROM final
  );
    
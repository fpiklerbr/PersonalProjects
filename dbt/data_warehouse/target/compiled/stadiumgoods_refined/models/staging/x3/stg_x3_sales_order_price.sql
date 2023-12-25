

SELECT
    sorderp.x3_order_id
  , sorderp.x3_order_line
  , sorderp.sequence_number
  , sorderp.x3_sku
  , sorderp.x3_size_code
  , sorderp.order_warehouse
  , sorderp.price
  , sorderp.shipping
  , nullif(
     greatest(
      coalesce(sorderp.tax, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce((sorderp.price_including_tax - sorderp.price_excluding_tax), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS tax
  , sorderp.gift_card
  , sorderp.discount
  , simple_skus.simple_sku
  , sorderp.x3_sku AS product_sku
  , sorderp.x3_size_code AS variant_size
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorderp` AS sorderp
INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_simple_skus` AS simple_skus
  ON sorderp.x3_sku = simple_skus.x3_sku
  AND sorderp.x3_size_code = simple_skus.x3_size_code
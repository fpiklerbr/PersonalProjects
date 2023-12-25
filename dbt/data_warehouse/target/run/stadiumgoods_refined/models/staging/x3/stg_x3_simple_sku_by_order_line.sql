

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_simple_sku_by_order_line`
  
  
  OPTIONS()
  as (
    

SELECT
    sales_order_price.x3_order_id
  , sales_order_price.x3_order_line
  , sales_order_price.x3_sku AS product_sku
  , sales_order_price.x3_size_code AS variant_size
  , substr(
    concat(
    
      coalesce(coalesce(sales_order_price.x3_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_master.mfg_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_size.x3_size, item_upc.x3_size, '')|| '|' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(coalesce(sales_order_price.x3_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_master.mfg_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_size.x3_size, item_upc.x3_size, '')|| '|' , '')
    
  )) - length('|')
      , 0
    )
) AS simple_sku
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorderp` AS sales_order_price
  INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__itmmaster` AS item_master
    ON sales_order_price.x3_sku = item_master.x3_sku
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmsize` AS item_size
    ON sales_order_price.x3_sku = item_size.x3_sku
    AND sales_order_price.x3_size_code = item_size.x3_size_code
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmupc` AS item_upc
    ON item_upc.x3_sku = sales_order_price.x3_sku
    AND item_upc.x3_size_code = sales_order_price.x3_size_code
  );
    
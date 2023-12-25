

SELECT
    item_master.x3_sku
  , size_codes.x3_size_code
  , substr(
    concat(
    
      coalesce(coalesce(item_master.x3_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_master.mfg_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_size.x3_size, item_upc.x3_size, '')|| '|' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(coalesce(item_master.x3_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_master.mfg_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_size.x3_size, item_upc.x3_size, '')|| '|' , '')
    
  )) - length('|')
      , 0
    )
) AS simple_sku
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__itmmaster` AS item_master
LEFT JOIN (
  SELECT x3_sku
    , x3_size_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmsize`
  UNION DISTINCT
  SELECT x3_sku
    , x3_size_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmupc`
  UNION DISTINCT
  SELECT x3_sku
    , x3_size_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorderp`
) AS size_codes
  ON item_master.x3_sku = size_codes.x3_sku
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmsize` AS item_size
  ON item_master.x3_sku = item_size.x3_sku
  AND size_codes.x3_size_code = item_size.x3_size_code
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmupc` AS item_upc
  ON item_master.x3_sku = item_upc.x3_sku
  AND size_codes.x3_size_code = item_upc.x3_size_code
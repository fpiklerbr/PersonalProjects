

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_size_conversion`
  
  
  OPTIONS()
  as (
    

SELECT DISTINCT
    pp.gender
  , pp.brand
  , pp.mfg_sku
  , pp.size
  , chart.us AS us_size
  , CONCAT(chart.uk, ' UK') AS uk_size
  , CONCAT(chart.eu, ' EU') AS eu_size
  , CONCAT(CAST(chart.cm AS string), ' CM') AS cm
  , CONCAT(CAST(chart.jp AS string), ' JP') AS jp_size
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS pp
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_size_conversion_chart` AS chart
  ON chart.brand = pp.brand
  AND chart.gender = pp.gender
  AND 
  CAST(regexp_extract(chart.us, 
  r'^[A-Z ]*(\d+\.?\d*)[A-Z ]*$'
) AS string)
 = 
  CAST(regexp_extract(pp.size, 
  r'^[A-Z ]*(\d+\.?\d*)[A-Z ]*$'
) AS string)

  WHERE pp.brand IN ('NIKE','JORDAN','ADIDAS','CONVERSE','VANS','REEBOK','PUMA','NEW BALANCE')
  AND pp.mfg_sku IS NOT NULL
  );
    
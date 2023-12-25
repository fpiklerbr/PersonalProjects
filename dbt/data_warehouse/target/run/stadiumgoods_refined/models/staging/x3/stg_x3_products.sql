

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_products`
  OPTIONS()
  as 

WITH first_intake AS (

  SELECT
      x3_sku
    , warehouse AS first_intake_warehouse
    , creation_nyc AS first_intake_creation_nyc
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_receipts`
  WHERE x3_sku_row = 1

)

SELECT
    substr(
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
, item_master.x3_sku
, item_master.mfg_sku
, CASE item_master.item_status WHEN 1 THEN 'Active' WHEN 5 THEN 'Obsolete' WHEN 6 THEN 'Not Usable' ELSE CAST(item_master.item_status AS string) END AS x3_product_status
,   substr(
    concat(
    
      coalesce(coalesce(item_master.x3_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_master.mfg_sku, '')|| '|' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(coalesce(item_master.x3_sku, '')|| '|' , '')
    
      , coalesce(coalesce(item_master.mfg_sku, '')|| '|' , '')
    
  )) - length('|')
      , 0
    )
) AS configurable_sku
, coalesce(item_size.x3_size, item_upc.x3_size) AS `size`
, string_agg(DISTINCT item_size.x3_size_code, ', ') AS size_uom
, string_agg(DISTINCT lookup_attribute_set.attribute_set, ', ') AS attribute_set
, string_agg(DISTINCT lookup_brand.brand, ', ') AS brand
, string_agg(DISTINCT lookup_gender.gender, ', ') AS gender
, string_agg(DISTINCT lookup_category.product_category, ', ') AS category
, string_agg(DISTINCT lookup_type.product_type, ', ') AS `type`
, string_agg(DISTINCT item_master.product_style, ', ') AS `style`
, string_agg(DISTINCT item_master.colorway, ', ') AS colorway
, string_agg(DISTINCT item_master.nickname, ', ') AS nickname
, string_agg(DISTINCT item_upc.upc, ', ') AS upc
, string_agg(DISTINCT item_master.country_of_origin, ', ') AS country_of_origin
, DATETIME(SAFE_CAST(min(item_master.created_at) AS timestamp), 'America/New_York') AS product_creation_nyc
, min(first_intake.first_intake_creation_nyc) first_intake_creation_nyc
, string_agg(DISTINCT first_intake.first_intake_warehouse, ', ') first_intake_warehouse
, count(*) uom_count
, current_timestamp AS rebuild_timestamp
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__itmmaster` AS item_master
LEFT JOIN first_intake ON first_intake.x3_sku = item_master.x3_sku
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmsize` AS item_size ON item_size.x3_sku = item_master.x3_sku
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yitmupc` AS item_upc ON item_upc.x3_sku = item_size.x3_sku AND item_upc.x3_size_code = item_size.x3_size_code
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_attribute_sets`  AS lookup_attribute_set ON lookup_attribute_set.attribute_set_code = item_master.attribute_set_code
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_brands` AS lookup_brand ON lookup_brand.brand_code = item_master.brand_code
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_genders` AS lookup_gender ON lookup_gender.gender_code = item_master.gender_code
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_product_categories` AS lookup_category ON lookup_category.product_category_code = item_master.product_category_code
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_product_types` AS lookup_type ON lookup_type.product_type_code = item_master.product_type_code
GROUP BY 1,2,3,4,5,6;


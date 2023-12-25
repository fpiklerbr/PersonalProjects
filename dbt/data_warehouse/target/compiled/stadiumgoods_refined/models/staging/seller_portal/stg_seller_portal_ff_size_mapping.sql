



WITH sz_mapping AS (

  SELECT DISTINCT
    size AS sg_size
  , mfg_sku
  , 
  CAST(regexp_extract(size, 
  r'\d+\.?\d*'
) AS string)
 AS mapping_sz
  , gender
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`
  WHERE gender NOT IN ('MENS','UNISEX')

), overlapped AS (

  SELECT DISTINCT
    ether.product_size AS ether_size
  , ether.mfg_sku
  , sz_mapping.sg_size
  , sz_mapping.gender
  , 'overlapping' AS mapping_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` AS ether
  INNER JOIN sz_mapping
  ON ether.mfg_sku = sz_mapping.mfg_sku
  AND ether.product_size = sz_mapping.mapping_sz

), ether_spec AS (

  SELECT DISTINCT
    ether.product_size AS ether_size
  , ether.mfg_sku
  , ether.product_size AS sg_size
  , 'MENS or UNISEX' AS gender
  , 'ether spec' AS mapping_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` AS ether
  WHERE NOT EXISTS (
    SELECT * FROM sz_mapping
    WHERE sz_mapping.mfg_sku = ether.mfg_sku
  )

), sg_spec AS (

  SELECT DISTINCT
    
  CAST(regexp_extract(sz_mapping.sg_size, 
  r'(\d+\.?\d*)'
) AS string)
 AS ether_size
  , sz_mapping.mfg_sku
  , sz_mapping.sg_size
  , sz_mapping.gender
  , 'sg spec' AS mapping_type
  FROM sz_mapping
  WHERE NOT EXISTS (
    SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` AS ether
    WHERE sz_mapping.mfg_sku = ether.mfg_sku
  )

), unioned_part AS (

  SELECT *
  FROM overlapped
  UNION DISTINCT
  SELECT *
  FROM ether_spec
  UNION DISTINCT
  SELECT *
  FROM sg_spec

), final AS (

  SELECT
    unioned_part.*
  , CAST(ff.fps_parent_product_id AS int64) AS ff_mapping_id
  , ff.configurable_product_id
  FROM unioned_part
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product` AS ff
  ON ff.fps_store_sku = unioned_part.mfg_sku

)

SELECT * FROM final


WITH products AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__products`
  WHERE is_deleted = FALSE

), master_products AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__master_products`

), variants AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__variants`

), third_parties AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__third_parties`

), final AS (

  SELECT
      master_products.master_product_id
    , master_products.manufacturer_sku
    , variants.third_party_id
    , third_parties.third_party_name
    , products.product_id
    , CAST(products.is_published AS int64) AS product_published
    , variants.variant_id
    , variants.variant_size AS `size`
    , variants.item_number
    , CAST(variants.is_published AS int64) AS variant_published
    , variants.quantity
    , variants.published_quantity
    , CAST(variants.price AS string) AS price
    , CAST(variants.published_price AS string) AS published_price
    , current_timestamp AS rebuild_timestamp
  FROM products
  INNER JOIN master_products
    ON products.master_product_id = master_products.master_product_id
  INNER JOIN variants
    ON products.product_id = variants.product_id
  INNER JOIN third_parties
    ON variants.third_party_id = third_parties.third_party_id

)

SELECT * FROM final
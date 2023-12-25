

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations`
  
  
  OPTIONS()
  as (
    

WITH simples AS (

  SELECT
      sku
    , product_type
    , product_id AS simple_product_id
    , sku AS simple_sku
    , DATETIME(SAFE_CAST(created_at AS timestamp), 'America/New_York') AS simple_product_creation_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity`
  WHERE product_type = 'simple'

), configurables AS (

  SELECT
      sku
    , product_type
    , product_id AS configurable_product_id
    , sku AS configurable_sku
    , DATETIME(SAFE_CAST(created_at AS timestamp), 'America/New_York') AS configurable_product_creation_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity`
  WHERE product_type = 'configurable'

), relations AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_relation`

), simples_with_parents AS (

SELECT
    simples.sku
  , simples.product_type
  , simples.simple_sku
  , simples.simple_product_id
  , simples.simple_product_creation_nyc
  , configurables.configurable_sku
  , configurables.configurable_product_id
  , configurables.configurable_product_creation_nyc
FROM simples
LEFT JOIN relations
  ON simples.simple_product_id = relations.simple_product_id
LEFT JOIN configurables
  ON relations.configurable_product_id = configurables.configurable_product_id

), childless_configurables AS (

  SELECT
      sku
    , product_type
    , CAST(NULL AS string ) AS simple_sku
    , CAST(NULL AS int64 ) AS simple_product_id
    , DATETIME(SAFE_CAST(NULL AS timestamp), 'America/New_York') AS simple_product_creation_nyc
    , configurable_sku
    , configurable_product_id
    , configurable_product_creation_nyc
  FROM configurables
  WHERE NOT EXISTS (
    SELECT *
    FROM simples_with_parents
    WHERE configurable_product_id = configurables.configurable_product_id
  )

), products AS (

  SELECT * FROM simples_with_parents
  UNION ALL
  SELECT * FROM childless_configurables

), final AS (

  SELECT *
    , current_timestamp AS rebuild_timestamp
  FROM products

)

SELECT * FROM final
  );
    
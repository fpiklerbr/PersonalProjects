

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`meta_dbt_relation_dependencies`
  
  
  OPTIONS()
  as (
    

WITH relations AS (

  SELECT
      resource_id
    , metadata
    , relation_type
    , source_name
    , dbt_relation
    , database_schema
    , database_table
    , depends_on_nodes
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`meta_dbt_relations`

), dependencies AS (

  SELECT DISTINCT
      resource_id AS downstream_resource_id
    , upstream_resource_id
  FROM relations, UNNEST(JSON_EXTRACT_ARRAY(depends_on_nodes)) AS upstream_resource_id

), final AS (

  SELECT
      downstream_relations.resource_id AS downstream_resource_id
    , downstream_relations.relation_type AS downstream_relation_type
    , downstream_relations.source_name AS downstream_source_name
    , downstream_relations.dbt_relation AS downstream_relation
    , downstream_relations.database_schema AS downstream_schema
    , downstream_relations.database_table AS downstream_table
    , dependencies.upstream_resource_id
    , upstream_relations.relation_type AS upstream_relation_type
    , upstream_relations.source_name AS upstream_source_name
    , upstream_relations.dbt_relation AS upstream_relation
    , upstream_relations.database_schema AS upstream_schema
    , upstream_relations.database_table AS upstream_table
  FROM relations AS downstream_relations
  LEFT JOIN dependencies
    ON downstream_relations.resource_id = dependencies.downstream_resource_id
  LEFT JOIN relations AS upstream_relations
    ON dependencies.upstream_resource_id = upstream_relations.resource_id

)

SELECT * FROM final
  );
    
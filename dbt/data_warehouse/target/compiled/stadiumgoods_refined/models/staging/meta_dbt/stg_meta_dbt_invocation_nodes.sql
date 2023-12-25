

WITH invocation_nodes AS (

  SELECT
      manifests.dbt_invocation_id
    , manifests.production_invocation_rank
    , manifests.generated_at AS manifest_generated_at
    , nodes_unnested.key AS resource_id
    , nodes_unnested.value AS metadata
    , (JSON_EXTRACT_SCALAR(nodes_unnested.value, '$.resource_type'
  ))
 AS resource_type
    , (JSON_EXTRACT_SCALAR(nodes_unnested.value, '$.name'
  ))
 AS node_name
    , (JSON_EXTRACT_SCALAR(nodes_unnested.value, '$.alias'
  ))
 AS node_alias
    , (JSON_EXTRACT_SCALAR(nodes_unnested.value, '$.relation_name'
  ))
 AS database_object
    , (JSON_EXTRACT_SCALAR(nodes_unnested.value, '$.database'
  ))
 AS database_catalog
    , (JSON_EXTRACT_SCALAR(nodes_unnested.value, '$.schema'
  ))
 AS database_schema
    , (JSON_EXTRACT(nodes_unnested.value, '$.depends_on.macros'
  ))
 AS depends_on_macros
    , (JSON_EXTRACT(nodes_unnested.value, '$.depends_on.nodes'
  ))
 AS depends_on_nodes
    , (JSON_EXTRACT(nodes_unnested.value, '$.fqn'
  ))
 AS fully_qualified_name
    , (JSON_EXTRACT(nodes_unnested.value, '$.columns'
  ))
 AS documented_columns
    , (JSON_EXTRACT(nodes_unnested.value, '$.raw_sql'
  ))
 AS raw_sql
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_manifests` AS manifests
  INNER JOIN (
    
  SELECT
    table_reference.dbt_invocation_id
  , JSON_EXTRACT_SCALAR(json_list_from_dict, '$.key') AS key
  , JSON_EXTRACT(json_list_from_dict, '$.value') AS value
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_manifests` AS table_reference
, UNNEST(JSON_EXTRACT_ARRAY(
    stadiumgoods_reporting.json_dict_to_list(nodes)
  )) AS json_list_from_dict

  ) AS nodes_unnested
    ON manifests.dbt_invocation_id = nodes_unnested.dbt_invocation_id

), model_types AS (

  SELECT
      dbt_invocation_id
    , resource_id
    , max(CASE WHEN fully_qualified_name_element = 'sources' THEN 1 END) AS is_source
    , max(CASE WHEN fully_qualified_name_element = 'staging' THEN 1 END) AS is_staging
    , max(CASE WHEN fully_qualified_name_element = 'reporting' THEN 1 END) AS is_reporting
  FROM invocation_nodes, UNNEST(JSON_EXTRACT_ARRAY(fully_qualified_name)) AS fully_qualified_name_element
  WHERE invocation_nodes.resource_type = 'model'
  GROUP BY 1, 2

), final AS (

  SELECT
      invocation_nodes.*
    , invocation_nodes.node_name AS dbt_relation
    , coalesce(invocation_nodes.node_alias, invocation_nodes.node_name) AS database_table
    , CASE
        WHEN model_types.is_source = 1 THEN 'source model'
        WHEN model_types.is_staging = 1 THEN 'staging model'
        WHEN model_types.is_reporting = 1 THEN 'reporting model'
        WHEN invocation_nodes.resource_type = 'model' THEN 'marts model'
        ELSE invocation_nodes.resource_type
      END AS relation_type
  FROM invocation_nodes
  LEFT JOIN model_types
    ON invocation_nodes.dbt_invocation_id = model_types.dbt_invocation_id
    AND invocation_nodes.resource_id = model_types.resource_id

)

SELECT * FROM final
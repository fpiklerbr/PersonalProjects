

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocation_sources`
  
  
  OPTIONS()
  as (
    

WITH invocation_sources AS (

  SELECT
      manifests.dbt_invocation_id
    , manifests.production_invocation_rank
    , manifests.generated_at AS manifest_generated_at
    , sources_unnested.key AS resource_id
    , sources_unnested.value AS metadata
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.resource_type'
  ))
 AS resource_type
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.source_name'
  ))
 AS source_name
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.name'
  ))
 AS source_table
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.relation_name'
  ))
 AS database_object
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.database'
  ))
 AS database_catalog
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.schema'
  ))
 AS database_schema
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.identifier'
  ))
 AS source_identifier
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.loaded_at_field'
  ))
 AS loaded_at_field
    , 
    safe_cast(
    safe_cast(JSON_EXTRACT_SCALAR(sources_unnested.value, '$.freshness.warn_after.count'
  ) as float64)
 as int64)
 AS freshness_warn_after_count
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.freshness.warn_after.period'
  ))
 AS freshness_warn_after_period
    , 
    safe_cast(
    safe_cast(JSON_EXTRACT_SCALAR(sources_unnested.value, '$.freshness.error_after.count'
  ) as float64)
 as int64)
 AS freshness_error_after_count
    , (JSON_EXTRACT_SCALAR(sources_unnested.value, '$.freshness.error_after.period'
  ))
 AS freshness_error_after_period
    , (JSON_EXTRACT(sources_unnested.value, '$.fqn'
  ))
 AS fully_qualified_name
    , (JSON_EXTRACT(sources_unnested.value, '$.columns'
  ))
 AS documented_columns
    , nullif((JSON_EXTRACT_SCALAR(sources_unnested.value, '$.loader'
  ))
, '') AS loader
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_manifests` AS manifests
  INNER JOIN (
    
  SELECT
    table_reference.dbt_invocation_id
  , JSON_EXTRACT_SCALAR(json_list_from_dict, '$.key') AS key
  , JSON_EXTRACT(json_list_from_dict, '$.value') AS value
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_manifests` AS table_reference
, UNNEST(JSON_EXTRACT_ARRAY(
    stadiumgoods_reporting.json_dict_to_list(sources)
  )) AS json_list_from_dict

  ) AS sources_unnested
    ON manifests.dbt_invocation_id = sources_unnested.dbt_invocation_id

), final AS (

  SELECT
      *
    , substr(
    concat(
    
      coalesce(source_name|| '.' , '')
    
      , coalesce(source_table|| '.' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(source_name|| '.' , '')
    
      , coalesce(source_table|| '.' , '')
    
  )) - length('.')
      , 0
    )
) AS dbt_relation
    , coalesce(source_identifier, source_table) AS database_table
    , cast(
  CASE 
    WHEN freshness_warn_after_count IS NULL THEN NULL
    WHEN freshness_warn_after_period = 'year' THEN freshness_warn_after_count || '-0'
    WHEN freshness_warn_after_period = 'month' THEN '0-' || freshness_warn_after_count
    WHEN freshness_warn_after_period = 'day' THEN '0-0 ' || freshness_warn_after_count
    WHEN freshness_warn_after_period = 'hour' THEN '0-0 0 ' || freshness_warn_after_count || ':0:0'
    WHEN freshness_warn_after_period = 'minute' THEN '0-0 0 0:' || freshness_warn_after_count || ':0'
    WHEN freshness_warn_after_period = 'second' THEN '0-0 0 0:0:' || freshness_warn_after_count
    ELSE NULL
  END
  AS interval
) AS freshness_warning_threshold
    , cast(
  CASE 
    WHEN freshness_error_after_count IS NULL THEN NULL
    WHEN freshness_error_after_period = 'year' THEN freshness_error_after_count || '-0'
    WHEN freshness_error_after_period = 'month' THEN '0-' || freshness_error_after_count
    WHEN freshness_error_after_period = 'day' THEN '0-0 ' || freshness_error_after_count
    WHEN freshness_error_after_period = 'hour' THEN '0-0 0 ' || freshness_error_after_count || ':0:0'
    WHEN freshness_error_after_period = 'minute' THEN '0-0 0 0:' || freshness_error_after_count || ':0'
    WHEN freshness_error_after_period = 'second' THEN '0-0 0 0:0:' || freshness_error_after_count
    ELSE NULL
  END
  AS interval
) AS freshness_error_threshold
    , cast('source table' AS string) AS relation_type
  FROM invocation_sources

)

SELECT * FROM final
  );
    
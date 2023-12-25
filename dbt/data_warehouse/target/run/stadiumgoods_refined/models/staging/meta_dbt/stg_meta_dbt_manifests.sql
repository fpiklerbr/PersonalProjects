

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_manifests`
  
  
  OPTIONS()
  as (
    

WITH prod_artifacts_with_dupes AS (

  SELECT
      manifests.dbt_invocation_id
    , run_results.production_invocation_rank
    , row_number() OVER (PARTITION BY manifests.dbt_invocation_id ORDER BY manifests.exported_at DESC) AS invocation_artifact_rank
    , manifests.generated_at
    , manifests.`manifest`,
  manifests.`exported_at`,
  manifests.`file_name`,
  manifests.`dbt_schema_version`,
  manifests.`metadata`,
  manifests.`nodes`,
  manifests.`sources`
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_artifacts` AS run_results
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`meta_dbt__manifest` AS manifests
    ON run_results.dbt_invocation_id = manifests.dbt_invocation_id

), final AS (

  SELECT
      *
  FROM prod_artifacts_with_dupes
  WHERE invocation_artifact_rank = 1

)

SELECT * FROM final
  );
    
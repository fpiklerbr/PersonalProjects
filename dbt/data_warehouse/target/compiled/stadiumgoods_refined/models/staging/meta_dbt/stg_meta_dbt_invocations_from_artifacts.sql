WITH prod_artifacts_with_dupes AS (

  SELECT
      dbt_invocation_id
    , row_number() OVER (PARTITION BY dbt_invocation_id ORDER BY exported_at DESC) AS invocation_artifact_rank
    , cast(

        datetime_add(
            cast( generated_at as datetime),
        interval cast(-1 * elapsed_time AS int64) second
        )

 AS timestamp) AS started_at
    , generated_at AS ended_at
    , cast('artifacts' AS string) AS data_source
    , run_results.`run_results`,
  run_results.`exported_at`,
  run_results.`file_name`,
  run_results.`generated_at`,
  run_results.`dbt_schema_version`,
  run_results.`dbt_command`,
  run_results.`target`,
  run_results.`vars`,
  run_results.`results`,
  run_results.`elapsed_time`,
  run_results.`metadata`,
  run_results.`args`
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`meta_dbt__run_results` AS run_results
  WHERE

    

    datetime_diff(
        cast(current_timestamp as datetime),
        cast(cast(

        datetime_add(
            cast( generated_at as datetime),
        interval cast(-1 * elapsed_time AS int64) second
        )

 AS timestamp) as datetime),
        day
    )

 < 3

    AND dbt_command = 'run'
    AND target = 'prod'
    AND 


  regexp_contains(vars, r'(?i)warehouse_refresh_stadium_views')



), final AS (

  SELECT
      *
    , row_number() OVER (ORDER BY started_at DESC) AS production_invocation_rank
  FROM prod_artifacts_with_dupes
  WHERE invocation_artifact_rank = 1

)

SELECT * FROM final
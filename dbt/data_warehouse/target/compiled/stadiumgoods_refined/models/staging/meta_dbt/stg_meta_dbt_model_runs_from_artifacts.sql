WITH invocation_models AS (

  SELECT
      dbt_invocation_id
    , resource_id
    , dbt_relation
    , database_table
    , database_schema
    , relation_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocation_nodes`
  WHERE resource_type = 'model'

), model_runs AS (

  SELECT
      dbt_invocation_id
    , started_at AS invocation_started_at
    , ended_at AS invocation_ended_at
    , cast(results_unnested AS string) AS model_run_results
    , (JSON_EXTRACT_SCALAR(cast(results_unnested AS string), '$.unique_id'
  ))
 AS resource_id
    , (JSON_EXTRACT_SCALAR(cast(results_unnested AS string), '$.status'
  ))
 AS model_run_status
    , 
    safe_cast(JSON_EXTRACT_SCALAR(cast(results_unnested AS string), '$.execution_time'
  ) as float64)
 AS execution_time
    , (JSON_EXTRACT_SCALAR(cast(results_unnested AS string), '$.message'
  ))
 AS model_run_message
    , (JSON_EXTRACT(cast(results_unnested AS string), '$.adapter_response'
  ))
 AS adapter_response
    , (JSON_EXTRACT(cast(results_unnested AS string), '$.timing'
  ))
 AS model_run_timing
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_artifacts` AS invocations
  , UNNEST(JSON_EXTRACT_ARRAY(results)) AS results_unnested

), model_run_timing_steps AS (

  SELECT
      dbt_invocation_id
    , resource_id
    , (JSON_EXTRACT_SCALAR(cast(model_run_timing_unnested AS string), '$.name'
  ))
 AS timing_step

    , 
    safe_cast(JSON_EXTRACT_SCALAR(cast(model_run_timing_unnested AS string), '$.started_at'
  ) as timestamp)
 AS started_at

    , 
    safe_cast(JSON_EXTRACT_SCALAR(cast(model_run_timing_unnested AS string), '$.completed_at'
  ) as timestamp)
 AS completed_at

  FROM model_runs, UNNEST(JSON_EXTRACT_ARRAY(model_run_timing)) AS model_run_timing_unnested

), model_run_timings_grouped AS (

  SELECT
      dbt_invocation_id
    , resource_id


    , min(CASE WHEN timing_step = 'compile' THEN started_at END) AS compile_started_at

    , max(CASE WHEN timing_step = 'compile' THEN completed_at END) AS compile_completed_at



    , min(CASE WHEN timing_step = 'execute' THEN started_at END) AS execute_started_at

    , max(CASE WHEN timing_step = 'execute' THEN completed_at END) AS execute_completed_at


  FROM model_run_timing_steps
  GROUP BY 1, 2

), final AS (

  SELECT
      model_runs.*
    , row_number() OVER (PARTITION BY model_runs.resource_id ORDER BY model_runs.invocation_started_at DESC) AS model_run_rank
    , row_number() OVER (PARTITION BY model_runs.resource_id, model_runs.model_run_status ORDER BY model_runs.invocation_started_at DESC) AS model_status_run_rank
    , invocation_models.dbt_relation
    , invocation_models.database_schema
    , invocation_models.database_table
    , invocation_models.relation_type


    , model_run_timings_grouped.compile_started_at

    , model_run_timings_grouped.compile_completed_at



    , model_run_timings_grouped.execute_started_at

    , model_run_timings_grouped.execute_completed_at


    , nullif(
     least(
      coalesce(model_run_timings_grouped.compile_started_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(model_run_timings_grouped.execute_started_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(logged_starts.created_at, CAST('9999-12-31 23:59:59' AS timestamp))
      
      )
     , CAST('9999-12-31 23:59:59' AS timestamp)
  ) AS model_run_started_at
    , nullif(
     greatest(
      coalesce(model_run_timings_grouped.compile_completed_at, CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(model_run_timings_grouped.execute_completed_at, CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(logged_ends.created_at, CAST('0001-01-01 00:00:00' AS timestamp))
      
      )
     , CAST('0001-01-01 00:00:00' AS timestamp)
  ) AS model_run_ended_at
    ,

    datetime_diff(
        cast(nullif(
     least(
      coalesce(model_run_timings_grouped.compile_started_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(model_run_timings_grouped.execute_started_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(logged_starts.created_at, CAST('9999-12-31 23:59:59' AS timestamp))
      
      )
     , CAST('9999-12-31 23:59:59' AS timestamp)
  ) as datetime),
        cast(invocation_started_at as datetime),
        second
    )

 AS model_run_delay_in_seconds
    ,

    datetime_diff(
        cast(nullif(
     greatest(
      coalesce(model_run_timings_grouped.compile_completed_at, CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(model_run_timings_grouped.execute_completed_at, CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(logged_ends.created_at, CAST('0001-01-01 00:00:00' AS timestamp))
      
      )
     , CAST('0001-01-01 00:00:00' AS timestamp)
  ) as datetime),
        cast(nullif(
     least(
      coalesce(model_run_timings_grouped.compile_started_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(model_run_timings_grouped.execute_started_at, CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(logged_starts.created_at, CAST('9999-12-31 23:59:59' AS timestamp))
      
      )
     , CAST('9999-12-31 23:59:59' AS timestamp)
  ) as datetime),
        second
    )

 AS model_run_duration_in_seconds
    , cast('artifacts' AS string) AS data_source
  FROM model_runs
  LEFT JOIN invocation_models
    ON model_runs.dbt_invocation_id = invocation_models.dbt_invocation_id
    AND model_runs.resource_id = invocation_models.resource_id
  LEFT JOIN model_run_timings_grouped
    ON model_runs.dbt_invocation_id = model_run_timings_grouped.dbt_invocation_id
    AND model_runs.resource_id = model_run_timings_grouped.resource_id
  LEFT JOIN `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_model_run_events` AS logged_starts
    ON model_runs.dbt_invocation_id = logged_starts.dbt_invocation_id
    AND invocation_models.database_schema = logged_starts.model_schema
    AND invocation_models.database_table = logged_starts.model_name
    AND logged_starts.event_type = 'start'
  LEFT JOIN `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_model_run_events` AS logged_ends
    ON model_runs.dbt_invocation_id = logged_ends.dbt_invocation_id
    AND invocation_models.database_schema = logged_ends.model_schema
    AND invocation_models.database_table = logged_ends.model_name
    AND logged_ends.event_type = 'end'

)

SELECT * FROM final
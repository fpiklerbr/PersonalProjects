

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`meta_dbt_model_runs_past`
  
  
  OPTIONS()
  as (
    WITH past_invocations AS (

  SELECT
      dbt_invocation_id
    , avg_invocation_duration_in_seconds
    , invocation_rank
    , started_at AS invocation_started_at
    , ended_at AS invocation_ended_at
    , next_invocation_started_at
    , invocation_status
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`meta_dbt_invocations`
  WHERE invocation_state <> 'current'

), artifact_model_runs AS (

  SELECT
      model_runs_from_artifacts.dbt_invocation_id
    , model_runs_from_artifacts.resource_id
    , model_runs_from_artifacts.dbt_relation
    , model_runs_from_artifacts.relation_type
    , model_runs_from_artifacts.database_schema
    , model_runs_from_artifacts.database_table
    , model_runs_from_artifacts.model_run_started_at
    , model_runs_from_artifacts.model_run_ended_at
    , model_runs_from_artifacts.model_run_status
    , model_runs_from_artifacts.model_run_message
  FROM past_invocations
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_model_runs_from_artifacts` AS model_runs_from_artifacts
    ON past_invocations.dbt_invocation_id = model_runs_from_artifacts.dbt_invocation_id

), logged_model_runs AS (

  SELECT
      model_run_events.dbt_invocation_id
    , model_run_events.model_schema AS database_schema
    , model_run_events.model_name AS database_table
    , min(CASE WHEN model_run_events.event_type = 'start' THEN model_run_events.created_at END) AS model_run_started_at
    , max(CASE WHEN model_run_events.event_type = 'end' THEN model_run_events.created_at END) AS model_run_ended_at
  FROM past_invocations
  INNER JOIN `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_model_run_events` AS model_run_events
    ON past_invocations.dbt_invocation_id = model_run_events.dbt_invocation_id
  WHERE NOT EXISTS (
    SELECT *
    FROM artifact_model_runs
    WHERE dbt_invocation_id = model_run_events.dbt_invocation_id
      AND database_schema = model_run_events.model_schema
      AND database_table = model_run_events.model_name
  )
  GROUP BY 1, 2, 3

), model_runs AS (

  SELECT
      dbt_invocation_id
    , resource_id
    , dbt_relation
    , relation_type
    , database_schema
    , database_table
    , model_run_started_at
    , model_run_ended_at
    , model_run_status
    , model_run_message
  FROM artifact_model_runs
  UNION ALL
  SELECT
      logged_model_runs.dbt_invocation_id
    , invocation_nodes.resource_id
    , invocation_nodes.dbt_relation
    , invocation_nodes.relation_type
    , logged_model_runs.database_schema
    , logged_model_runs.database_table
    , logged_model_runs.model_run_started_at
    , logged_model_runs.model_run_ended_at
    , CASE
        WHEN logged_model_runs.model_run_ended_at IS NOT NULL THEN cast('success' AS string)
        WHEN logged_model_runs.model_run_started_at IS NOT NULL THEN cast('error' AS string)
        ELSE cast('skipped' AS string)
      END AS model_run_status
    , cast(NULL AS string) AS model_run_message
  FROM logged_model_runs
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_meta_dbt_invocation_nodes` AS invocation_nodes
    ON logged_model_runs.dbt_invocation_id = invocation_nodes.dbt_invocation_id
    AND logged_model_runs.database_schema = invocation_nodes.database_schema
    AND logged_model_runs.database_table = invocation_nodes.database_table
    AND invocation_nodes.resource_type = 'model'

), final AS (

  SELECT
      model_runs.database_schema
    , model_runs.database_table
    , past_invocations.dbt_invocation_id
    , past_invocations.avg_invocation_duration_in_seconds
    , past_invocations.invocation_rank
    , past_invocations.invocation_started_at
    , past_invocations.invocation_ended_at
    , past_invocations.next_invocation_started_at
    , past_invocations.invocation_status
    , model_runs.dbt_relation
    , model_runs.relation_type
    , model_runs.model_run_started_at
    , model_runs.model_run_ended_at
    , model_runs.model_run_status
    , safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS now_us_eastern
    , safe_cast(datetime(safe_cast(past_invocations.invocation_started_at AS timestamp), 'America/New_York') AS datetime) AS invocation_started_at_us_eastern
    , safe_cast(datetime(safe_cast(past_invocations.invocation_ended_at AS timestamp), 'America/New_York') AS datetime) AS invocation_ended_at_us_eastern
    , safe_cast(datetime(safe_cast(model_runs.model_run_started_at AS timestamp), 'America/New_York') AS datetime) AS model_run_started_at_us_eastern
    , safe_cast(datetime(safe_cast(model_runs.model_run_ended_at AS timestamp), 'America/New_York') AS datetime) AS model_run_ended_at_us_eastern
    , 

    datetime_diff(
        cast(coalesce(model_runs.model_run_started_at, past_invocations.invocation_ended_at, past_invocations.next_invocation_started_at, current_timestamp) as datetime),
        cast(past_invocations.invocation_started_at as datetime),
        second
    )

 AS model_run_delay_in_seconds
    , 

    datetime_diff(
        cast(coalesce(model_runs.model_run_ended_at, past_invocations.invocation_ended_at, past_invocations.next_invocation_started_at, current_timestamp) as datetime),
        cast(coalesce(model_runs.model_run_started_at, past_invocations.invocation_ended_at, past_invocations.next_invocation_started_at, current_timestamp) as datetime),
        second
    )

 AS model_run_duration_in_seconds
    , model_runs.model_run_message
  FROM past_invocations
  INNER JOIN model_runs
    ON past_invocations.dbt_invocation_id = model_runs.dbt_invocation_id

)

SELECT * FROM final
  );
    
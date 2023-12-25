

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_reporting`.`meta_dbt_invocations`
  OPTIONS()
  as WITH invocations_union AS (

  SELECT
      dbt_invocation_id
    , started_at
    , ended_at
    , data_source
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_logs`
  UNION ALL
  SELECT
      dbt_invocation_id
    , started_at
    , ended_at
    , data_source
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_artifacts`

), artifacts_agg AS (

  SELECT
      avg(elapsed_time) AS avg_invocation_duration_in_seconds
    , stddev(elapsed_time) AS stddev_invocation_duration_in_seconds
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_artifacts`

), meta_agg AS (

  SELECT
    max(started_at) AS last_meta_invocation_started_at
  FROM `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_invocations`
  WHERE target_name = 'prod'
    AND invoking_job_name = 'BQ test'

), invocations AS (

  SELECT
      *
    , row_number() OVER (ORDER BY started_at DESC) AS invocation_rank
    , lag(started_at) OVER (ORDER BY started_at DESC) AS next_invocation_started_at
  FROM invocations_union

), final AS (

  SELECT
      *
    , CASE
        WHEN (invocations.started_at > meta_agg.last_meta_invocation_started_at)
        THEN cast('current' AS string)
        ELSE cast('past' AS string)
      END AS invocation_state
    , 

    datetime_diff(
        cast(coalesce(invocations.ended_at, invocations.next_invocation_started_at, current_timestamp) as datetime),
        cast(invocations.started_at as datetime),
        second
    )

 AS invocation_duration_in_seconds
    , CASE
        WHEN invocations.ended_at IS NOT NULL
          THEN cast('complete' AS string)
        WHEN (invocations.started_at > meta_agg.last_meta_invocation_started_at) IS NOT TRUE
          THEN cast('failed' AS string)
        WHEN 

    datetime_diff(
        cast(coalesce(invocations.ended_at, invocations.next_invocation_started_at, current_timestamp) as datetime),
        cast(invocations.started_at as datetime),
        second
    )

 < (1.5 * artifacts_agg.stddev_invocation_duration_in_seconds + artifacts_agg.avg_invocation_duration_in_seconds)
          THEN cast('in progress' AS string)
        ELSE
          cast('stalling' AS string)
      END AS invocation_status
    , safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS now_us_eastern
  FROM invocations
  CROSS JOIN artifacts_agg
  CROSS JOIN meta_agg

)

SELECT * FROM final;


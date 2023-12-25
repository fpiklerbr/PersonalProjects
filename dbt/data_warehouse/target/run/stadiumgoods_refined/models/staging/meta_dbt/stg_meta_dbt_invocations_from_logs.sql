

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_logs`
  OPTIONS()
  as 

SELECT
    *
  , cast('logs' AS string) AS data_source
FROM `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_invocations` AS log_invocations
WHERE started_at > (SELECT min(started_at) FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_artifacts`)
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_meta_dbt_invocations_from_artifacts`
    WHERE dbt_invocation_id = log_invocations.dbt_invocation_id
  )
  AND target_name = 'prod'
  AND invoking_job_name = 'warehouse_refresh_stadium_views';


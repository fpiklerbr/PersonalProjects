

INSERT INTO `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_invocations` (
    dbt_invocation_id
  , target_name
  , target_user
  , target_threads
  , invoking_job_name
  , invoking_job_id
  , started_at
)
VALUES (
    'c60dc8e1-df76-4487-a962-48da2830430d'
  , 'bq_prod'
  , ''
  , CAST('16' AS int64)
  , 'BQ test'
  , '20231221170458'
  , current_timestamp
)
;


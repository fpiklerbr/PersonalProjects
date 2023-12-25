

UPDATE `ff-stadiumgoods-raw-live`.`meta_dbt`.`log_invocations`
SET ended_at = current_timestamp
WHERE dbt_invocation_id = 'c60dc8e1-df76-4487-a962-48da2830430d'
;


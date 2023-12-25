{% macro log_invocation_start() %}

INSERT INTO {{source("meta_dbt","log_invocations")}} (
    dbt_invocation_id
  , target_name
  , target_user
  , target_threads
  , invoking_job_name
  , invoking_job_id
  , started_at
)
VALUES (
    '{{ invocation_id }}'
  , '{{ target.name }}'
  , '{{ target.user }}'
  , CAST('{{ target.threads }}' AS {{data_type('int')}})
  , '{{ var("invoking_job_name") }}'
  , '{{ var("invoking_job_id") }}'
  , current_timestamp
)
;

{% endmacro %}

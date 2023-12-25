{% macro log_invocation_end() %}

UPDATE {{source("meta_dbt", "log_invocations")}}
SET ended_at = current_timestamp
WHERE dbt_invocation_id = '{{ invocation_id }}'
;

{% endmacro %}

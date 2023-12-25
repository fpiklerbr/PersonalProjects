{% macro log_model_run_event(event_type) %}
  {{adapter.dispatch('log_model_run_event')(event_type)}}
{%- endmacro -%}

{%- macro default__log_model_run_event(event_type) -%}

INSERT INTO {{source("meta_dbt","log_model_run_events")}} (
  model_schema
, model_name
, event_type
, created_at
, dbt_invocation_id
)
VALUES (
  '{{ this.schema }}'
, '{{ this.table }}'
, '{{ event_type }}'
, clock_timestamp()
, '{{ invocation_id }}'
)
;
{% if event_type == 'start' %}COMMIT; BEGIN;{% endif %}

{% endmacro %}

{%- macro bigquery__log_model_run_event(event_type) -%}

{%- endmacro -%}

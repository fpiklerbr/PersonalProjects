{% macro grant_model_permissions() %}
{{ adapter.dispatch('grant_model_permissions')() }}
{% endmacro %}

{% macro default__grant_model_permissions() %}
  GRANT SELECT ON {{ this }} TO {{ get_roles_for_grants() }};
{% endmacro %}

{% macro bigquery__grant_model_permissions() %}

{% endmacro %}

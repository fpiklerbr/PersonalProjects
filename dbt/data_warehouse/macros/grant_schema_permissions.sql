{% macro grant_schema_permissions() %}
 {{ adapter.dispatch('grant_schema_permissions')() }}
{% endmacro %}

{% macro default__grant_schema_permissions() %}
  {% set roles = get_roles_for_grants() %}
  {% for schema in schemas %}
    GRANT USAGE ON SCHEMA {{ schema }} TO {{ roles }};
    GRANT SELECT ON ALL TABLES IN SCHEMA {{ schema }} TO {{ roles }};
    ALTER DEFAULT PRIVILEGES IN SCHEMA {{ schema }}
      GRANT SELECT ON TABLES TO {{ roles }};
  {% endfor %}
  {% if target.name == 'prod' %}
    {% for table_under_audit in ['stadium_invoiced_costs', 'stadium_transactions'] %}
      GRANT SELECT ON {{ ref(table_under_audit) }} TO bdo_auditor;
    {% endfor %}
  {% endif %}
{% endmacro %}

{% macro bigquery__grant_schema_permissions() %}

{% endmacro %}

{% macro get_roles_for_grants() %}
  dbt_dev{%- if target.name == 'prod' -%}, read_data{% endif %}
{% endmacro %}

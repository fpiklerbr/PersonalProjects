{% macro ether_inventory_unit_attribute_history(attribute_name) %}

{% if execute %}
  {% set source_columns = source_model_columns('seller_portal', 'ether_wms_inventory_units') %}
  {% set source_column = source_columns.get(attribute_name) %}
  {% set old_value_transformed = source_column.expression|replace(adapter.quote(attribute_name), adapter.quote('old_value')) %}
  {% set old_value_alias = adapter.quote('previous_' ~ source_column.alias) %}
  {% set new_value_transformed = source_column.expression|replace(adapter.quote(attribute_name), adapter.quote('new_value')) %}
  {% set new_value_alias = adapter.quote(source_column.alias) %}
{% else %}
  {% set old_value_transformed = adapter.quote('old_value') %}
  {% set old_value_alias = adapter.quote('previous_' ~ attribute_name) %}
  {% set new_value_transformed = adapter.quote('new_value') %}
  {% set new_value_alias = adapter.quote(attribute_name) %}
{% endif %}

SELECT
    *
  , {{ old_value_transformed }} AS {{ old_value_alias }}
  , {{ new_value_transformed }} AS {{ new_value_alias }}
FROM {{ ref('stg_ether_inventory_unit_attribute_changes') }}
WHERE attribute_name = '{{ attribute_name }}'
  AND object_type = 'Ether::Wms::InventoryUnit'
{% if is_incremental() %}
  AND ether_wms_inventory_unit_version_id > (SELECT max(ether_wms_inventory_unit_version_id) FROM {{ this -}} )
{% endif %}

{% endmacro %}

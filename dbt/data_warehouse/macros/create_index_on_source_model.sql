{% macro create_index_on_source_model(model, index_columns, is_unique = False) %}

{%- set source_aliases = {
  'link__tmall_order_id_to_zebra_ship_reference': 'base_link_tmall_order_id_to_zebra_ship_reference'
  ,'flow__orders': 'base_flow_orders'
  ,'link__x3_order_line_to_mag_order_item_id': 'base_link_x3_order_line_to_mag_order_item_id'
  ,'magento__serializedproduct_product_serial_log': 'base_magento_serializedproduct_product_serial_log'
  ,'x3__stopred': 'base_x3_stopred'
  , 'magento__serializedproduct_product_serial':'base_magento_serializedproduct_product_serial'
  , 'x3__spackd':'base_x3_spackd'
  , 'x3__sreturnd':'base_x3_sreturnd'
  , 'sales_channel__webhook_log': 'base_sales_channel_webhook_log'
    , 'x3__sorderq' : 'base_x3_sorderq'
    , 'x3__sinvoiced' : 'base_x3_sinvoiced'
    , 'x3__stoprelis': 'base_x3_stoprelis'
    , 'x3__sorderp' : 'base_x3_sorderp'
    , 'x3__stopreh': 'base_x3_stopreh'
    , 'x3__sdelivery': 'base_x3_sdelivery'
} -%}

{% if target.type == 'postgres' %}

  {% if target.name == 'prod' %}
    {% set model_schema = model.schema %}
    {% set model_table = source_aliases.get(model.identifier) if source_aliases.get(model.identifier) else model.identifier %}
  {% else %}
    {% set model_schema = model.schema ~ '_sources' %}
    {% set model_table = model.identifier %}
  {% endif %}

{%- set index_name -%}
{{ model_table }}_index_on_{%- for index_column in index_columns -%}{{ index_column }}{%- if not loop.last -%}_and_{%- endif %}{%- endfor -%}
{%- endset -%}

{%- set dummy_statements %}
DROP INDEX IF EXISTS {{ adapter.quote(model.database) }}.{{ adapter.quote(model_schema) }}.{{ adapter.quote(index_name) }}
;

CREATE {% if is_unique == True %}UNIQUE {% endif %}INDEX {{ adapter.quote(index_name) }}
  ON {{ adapter.quote(model.database) }}.{{ adapter.quote(model_schema) }}.{{ adapter.quote(model_table) }} (
{%- for index_column in index_columns -%}
{{ adapter.quote(index_column) }}{%- if not loop.last -%}, {% endif -%}
{%- endfor -%}
  )
;
{%- endset %}

{{ dummy_statements }}

{% endif %}

{% endmacro %}

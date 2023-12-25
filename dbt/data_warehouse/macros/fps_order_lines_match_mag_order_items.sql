{% macro fps_order_lines_match_mag_order_items(match_column) %}

{% if match_column == 'serial_number' %}
    {% set context = {'previous': 'attempted', 'next': 'simple_product_id'} %}
{% elif match_column == 'simple_product_id' %}
    {% set context = {'previous': 'serial_number', 'next': 'configurable_product_id'} %}
{% elif match_column == 'configurable_product_id' %}
    {% set context = {'previous': 'simple_product_id', 'next': 'sales_flat_order_id'} %}
{% elif match_column == 'sales_flat_order_id' %}
    {% set context = {'previous': 'configurable_product_id', 'next': ''} %}
{% endif %}

, {{ match_column }}_match AS (

  SELECT DISTINCT
      fps.fps_order_id
    , fps.sales_flat_order_id
    , fps.farfetch_order_line_id
    , fps.configurable_product_id
    , fps.simple_product_id
    , fps.serial_number
    , mag.order_item_id
  FROM fps_no_{{ context['previous'] }}_match AS fps
  INNER JOIN mag_no_{{ context['previous'] }}_match AS mag
    ON fps.sales_flat_order_id = mag.sales_flat_order_id
    AND fps.{{ match_column }} = mag.{{ match_column }}
    AND fps.{{ match_column }}_row = mag.{{ match_column }}_row

), fps_no_{{ match_column }}_match AS (

  SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , {{ match_column }}_row
    , {%- if match_column == 'sales_flat_order_id' %}
      row_number() OVER (PARTITION BY sales_flat_order_id ORDER BY farfetch_order_line_id)
      {%- else %}
      row_number() OVER (PARTITION BY sales_flat_order_id, {{ context['next'] }} ORDER BY farfetch_order_line_id)
      {%- endif %}
     AS {{ context['next'] }}_row
  FROM fps_no_{{ context['previous'] }}_match AS fps
  WHERE NOT EXISTS (
    SELECT *
    FROM {{ match_column }}_match
    WHERE farfetch_order_line_id = fps.farfetch_order_line_id
      AND fps_order_id = fps.fps_order_id
  )

), mag_no_{{ match_column }}_match AS (

  SELECT
      sales_flat_order_id
    , order_item_id
    , serial_number
    , simple_product_id
    , configurable_product_id
    , {{ match_column }}_row
    , {%- if match_column == 'sales_flat_order_id' %}
        row_number() OVER (PARTITION BY sales_flat_order_id ORDER BY order_item_id)
      {%- else %}
        row_number() OVER (PARTITION BY sales_flat_order_id, {{ context['next'] }} ORDER BY order_item_id)
      {%- endif %}
        AS {{ context['next'] }}_row

  FROM mag_no_{{ context['previous'] }}_match AS mag
  WHERE NOT EXISTS (
    SELECT *
    FROM {{ match_column }}_match
    WHERE order_item_id = mag.order_item_id
  )

), unioned AS (

    SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , CAST(NULL AS {{data_type('int')}}) order_item_id
    , {{ match_column }}_row
    , {%- if match_column == 'sales_flat_order_id' %}CAST(NULL AS {{data_type('int')}}) AS {{ context['next'] }}_row{%- else %}{{ context['next'] }}_row{%-endif%}
    , 'fps_no_{{ match_column }}_match' AS source
    FROM fps_no_{{ match_column }}_match
    UNION ALL
    SELECT
      CAST(NULL AS {{data_type('text')}}) AS fps_order_id
    , sales_flat_order_id
    , CAST(NULL AS {{data_type('text')}}) AS farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , order_item_id
    , {{ match_column }}_row
    , {%- if match_column == 'sales_flat_order_id' %}CAST(NULL AS {{data_type('int')}}) AS {{ context['next'] }}_row{%- else %}{{ context['next'] }}_row{%-endif%}
    , 'mag_no_{{ match_column }}_match' AS source
    FROM mag_no_{{ match_column }}_match
    UNION ALL
    SELECT
      fps_order_id
    , sales_flat_order_id
    , farfetch_order_line_id
    , configurable_product_id
    , simple_product_id
    , serial_number
    , order_item_id
    , CAST(NULL AS {{data_type('int')}}) AS {{ match_column }}_row
    , CAST(NULL AS {{data_type('int')}}) AS {{ context['next'] }}_row
    , '{{ match_column }}_match' AS source
    FROM {{ match_column }}_match

)

{% endmacro %}




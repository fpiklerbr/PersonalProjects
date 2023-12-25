{%- macro generate_magento_product_attribute_value_cte(attribute_code) -%}

    {%- set eav_attribute = dbt_utils.get_query_results_as_dict(
        "SELECT attribute_id, attribute_code, backend_type FROM " ~ ref('magento__eav_attribute') ~ " WHERE entity_type_id = 4 AND attribute_code = '" ~ attribute_code ~ "'"
    ) -%}

    {%- if execute -%}
        {%- set attribute_id = eav_attribute.attribute_id[0] -%}
        {%- set backend_type = eav_attribute.backend_type[0] -%}

        product_{{ attribute_code }} AS (

            {% if backend_type == 'int' -%}
                {%- if attribute_code == 'status' %}
                    SELECT DISTINCT
                        product_id
                      , attribute_value AS {{ attribute_code }}_value
                    FROM {{ ref('magento__catalog_product_entity_int') }}
                    WHERE attribute_id = {{ attribute_id }}
                      AND attribute_value IS NOT NULL
                      AND product_id IS NOT NULL
                      AND store_id IN (0, 1)
                {% else %}
                    SELECT DISTINCT
                        entity_option.product_id
                      , option_value.option_value AS {{ attribute_code }}_value
                    FROM {{ ref('magento__catalog_product_entity_int') }} AS entity_option
                    INNER JOIN {{ ref('magento__eav_attribute_option_value') }} AS option_value
                      ON entity_option.attribute_value = option_value.option_id
                      AND entity_option.store_id = option_value.store_id
                    WHERE entity_option.attribute_id = {{ attribute_id }}
                      AND option_value.option_value IS NOT NULL
                      AND entity_option.product_id IS NOT NULL
                      AND entity_option.store_id IN (0, 1)
                {% endif -%}
            {%- elif backend_type != '' -%}
                {%- set ref_model = 'magento__catalog_product_entity_' ~ backend_type %}
                SELECT DISTINCT
                    product_id
                  , attribute_value AS {{ attribute_code }}_value
                FROM {{ ref(ref_model) }}
                WHERE attribute_id = {{ attribute_id }}
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            {% endif %}

        )
    {%- endif -%}
{%- endmacro -%}

{% macro get_order_id_from_alipay_transaction(channel_or_gateway, output_type='text') %}

  {{adapter.dispatch('get_order_id_from_alipay_transaction')(channel_or_gateway, output_type)}}

{% endmacro %}

{% macro default__get_order_id_from_alipay_transaction(channel_or_gateway, output_type='text') %}

  {%- if channel_or_gateway == 'flow' -%}
    coalesce(
        {{ regexp_extract("partner_transaction_id" , 'ord-[A-z0-9]{32}')}}
      , {{ regexp_extract("original_partner_transaction_id" , 'ord-[A-z0-9]{32}')}}
      , {{ regexp_extract("remarks" , 'ord-[A-z0-9]{32}')}}
    )
  {%- elif channel_or_gateway == 'magento' -%}
    coalesce(
        {{ regexp_extract("partner_transaction_id" , '-[0-9]([0-9]{9})-[0-9]') }}
      , {{ regexp_extract("original_partner_transaction_id" , '[0-9]{9}') }}
      , {{ regexp_extract("remarks" , '#([0-9]{9})') }}
    )
  {% endif %}

{% endmacro %}

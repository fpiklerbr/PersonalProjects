{% macro magento_parse_serial_logs(change_type) %}

{%- set serial_orig_data -%}
nullif(ltrim(rtrim(serial_orig_data)), '')
{%- endset -%}

{%- set serial_data -%}
nullif(ltrim(rtrim(serial_data)), '')
{%- endset -%}

{%- set regex_extract = '\"' ~ change_type ~ '\";.*?;' -%}

{%- set regex_replace -%}
'\"{{ change_type }}\";(N|s:.*?:|d:|i:)'
{%- endset -%}

  SELECT
      serial_log_id
    , _synched_from_source_at
    , cast(nullif(replace(
          replace(
              replace(
                  regexp_replace(
                      {{ regexp_extract(serial_orig_data, regex_extract) }}
                    , {{ regex_replace }}
                    , ''
                  )
                , '"'
                ,''
              )
            , ';'
            , ''
          )
        , ','
        , ''
      ), '') AS {{ data_type('numeric') -}} ) AS old_{{ change_type }}
    , cast(nullif(replace(
          replace(
              replace(
                  regexp_replace(
                      {{ regexp_extract(serial_data, regex_extract) }}
                    , {{regex_replace}}
                    , ''
                  )
                , '"'
                ,''
              )
            , ';'
            , ''
          )
        , ','
        , ''
      ), '') AS {{ data_type('numeric') -}} ) AS {{ change_type }}
  FROM {{ ref('magento__serializedproduct_product_serial_log') }}
  WHERE (
    {{ serial_orig_data }} IS NOT NULL
    OR {{ serial_data }} IS NOT NULL
  )
{% if is_incremental() %}
    AND _synched_from_source_at > (SELECT max(_synched_from_source_at) from {{ this -}} )
{% endif %}

{% endmacro %}

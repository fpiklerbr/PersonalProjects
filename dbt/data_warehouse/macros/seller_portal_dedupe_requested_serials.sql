{% macro seller_portal_dedupe_requested_serials(request_type) %}

{% set requests = 'seller_portal__' ~ request_type ~ '_requests' %}
{% set requested_products = 'seller_portal__' ~ request_type ~ '_requested_products' %}

serials_with_requests AS
(

  SELECT DISTINCT
      serial_number
    , {{ request_type }}_request_id AS request_id
  FROM {{ ref(requested_products) }} AS requested_products
  WHERE {{ request_type }}_request_id IS NOT NULL

), serial_requests AS (

  SELECT *
  FROM serials_with_requests
  UNION ALL
  SELECT DISTINCT
      serial_number
    , CAST(NULL AS {{data_type('bigint')}}) AS request_id
  FROM {{ ref(requested_products) }} AS serials_without_requests
  WHERE NOT EXISTS (
    SELECT *
    FROM serials_with_requests
    WHERE serials_with_requests.serial_number = serials_without_requests.serial_number
  )

), first_requested_product_by_serial AS (

  SELECT
      serial_number
    , min(created_at) AS first_requested_product_created_at
  FROM {{ ref(requested_products) }}
  GROUP BY 1

), source_joins AS (

  SELECT DISTINCT
    first_requested_product_by_serial.*
  , serial_requests.request_id
  , requests.created_at
  , requests.{{ request_type }}_request_id
  , first_value(serial_requests.request_id) OVER (
      PARTITION BY serial_requests.serial_number
      ORDER BY requests.created_at DESC
    ) AS last_request_id
{% if request_type == 'payment' %}
  , requests.sla_deadline
{% endif %}
  FROM first_requested_product_by_serial
  INNER JOIN serial_requests
    ON first_requested_product_by_serial.serial_number = serial_requests.serial_number
  LEFT JOIN {{ ref(requests) }} AS requests
    ON serial_requests.request_id = requests.{{ request_type }}_request_id

), first_and_last_request_by_serial AS (

  SELECT
	serial_number
  , last_request_id
  , {{ array_agg(col_name="request_id", distinct=False, ignore_nulls=True) }} AS request_ids
  , COALESCE(MIN(created_at) , MIN(first_requested_product_created_at)) AS first_request_created_at
{% if request_type == 'payment' %}
  , min(sla_deadline) AS sla_deadline
{% endif %}
  FROM source_joins
  GROUP BY 1,2

)

{% endmacro %}

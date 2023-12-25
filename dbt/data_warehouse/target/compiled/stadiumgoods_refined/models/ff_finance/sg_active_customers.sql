

WITH orders_grouped AS (

  SELECT
      coalesce(stadium_order_id, payment_id) AS order_id
    , CASE WHEN sales_channel = 'Farfetch' THEN payment_id ELSE NULL END AS farfetch_order_id
    , business_unit
    , sales_channel
    , lower(unique_email) AS customer_email
    , lower(
  CAST(regexp_extract(unique_email, 
  r'@(.*)$'
) AS string)
) AS email_domain
    , order_date
    , min(dispatch_date) AS dispatch_date
    , min(CASE WHEN reporting_status = 'Returned' THEN refund_date END) AS return_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS stadium_finance_lines
  WHERE business_unit IN ('DTC', 'Omnichannel')
  GROUP BY 1, 2, 3, 4, 5, 6, 7
  HAVING min(order_date) >= '2018-01-01'

), final AS (

  SELECT
      CASE
        WHEN orders_grouped.customer_email IS NULL
        THEN ''
        ELSE upper(to_hex(sha256(orders_grouped.customer_email))) -- dbt_utils.hash uses MD5; FF wants SHA-256 for compatibility
      END AS customer_email
    , orders_grouped.order_id
    , orders_grouped.order_date
    , orders_grouped.dispatch_date AS send_date
    , orders_grouped.return_date
    , orders_grouped.sales_channel AS channel
    , coalesce(lookup_email_domains.not_identifiable, FALSE) AS email_is_masked
    , orders_grouped.customer_email IS NULL AS email_is_not_unique
    , orders_grouped.farfetch_order_id
  FROM orders_grouped
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_email_domains` AS lookup_email_domains
    ON orders_grouped.email_domain = lookup_email_domains.email_domain

)

SELECT * FROM final
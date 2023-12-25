WITH customers AS (

  SELECT
      private_client_customer_id
    , string_agg(DISTINCT customer_name, ', ') AS customer_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`private_client__customers`
  GROUP BY 1

), activation_by_customer AS (

  SELECT
      private_client_customer_id
    , cast(min(valid_from) AS date) AS activated_at
    , CASE
        WHEN max(valid_to) < cast('2038-01-19 03:14:08' AS timestamp)
        THEN max(valid_to)
      END AS deactivated_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_private_client_email_stylist_history`
  GROUP BY 1

), orders_by_customer AS (

  SELECT
      private_client_customer_id
    , min(order_date) AS first_order_date
    , max(order_date) AS last_order_date
    , count(DISTINCT order_or_payment_id) AS total_order_count
    , min(CASE WHEN private_customer_status = 'Private Client' THEN order_date END) AS first_active_order_date
    , max(CASE WHEN private_customer_status = 'Private Client' THEN order_date END) AS last_active_order_date
    , count(DISTINCT CASE WHEN private_customer_status = 'Private Client' THEN order_or_payment_id END) AS active_order_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS stadium_finance_lines
  WHERE private_client_customer_id IS NOT NULL
  GROUP BY 1

), history AS (

  SELECT
    *
  FROM activation_by_customer
  FULL JOIN orders_by_customer
    USING (private_client_customer_id)

), final AS (

  SELECT
      history.*
    , customers.customer_name
  FROM history
  LEFT JOIN customers
    ON history.private_client_customer_id = customers.private_client_customer_id

)

SELECT * FROM final
--TODO with or after DE-3760: get Ether data into `stadium_serials.status_document` and `stadium_serials.document_date` to support this logic

WITH consignors AS (

  SELECT
      consignor_id
    , CASE
        WHEN sum(CASE WHEN is_dss IS TRUE THEN 1 ELSE 0 END) > 0
        THEN cast('Dropshipper' AS string)
        ELSE cast('Consignor' AS string)
      END AS consignor_type
    , string_agg(DISTINCT inventory_relationship, ', ') AS inventory_relationship
    , string_agg(DISTINCT inventory_type, ', ') AS inventory_type
    , string_agg(DISTINCT email, ', ') AS consignor_email
    , string_agg(DISTINCT full_name, ', ') AS consignor_name
    , string_agg(DISTINCT city, '; ') AS consignor_city
    , string_agg(DISTINCT region, ', ') AS consignor_state
    , string_agg(DISTINCT country, ', ') AS consignor_country
    , string_agg(DISTINCT base_currency, ', ') AS base_currency
    , string_agg(DISTINCT business_entity, ', ') AS business_entity
    , string_agg(DISTINCT seller_tier, ', ') AS seller_tier
    , (sum(CASE WHEN is_exempt_from_storage_fee THEN 1 ELSE 0 END) > 0) AS is_exempt_from_storage_fee
    , (sum(CASE WHEN has_flat_rate_storage_fee THEN 1 ELSE 0 END) > 0) AS has_flat_rate_storage_fee
    , MIN(created_at) AS consignor_creation_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users`
  WHERE consignor_total_user_count = 1
    OR (
      consignor_total_user_count > 1
      AND (
        deleted_at IS NULL
        OR consignor_deleted_user_count = consignor_total_user_count
      )
    )
  GROUP BY 1

), gtv_by_order_serial AS (

  SELECT
      order_serial
    , sum(gtv_total) AS last_6_months_gtv
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE order_date >= 

        datetime_add(
            cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS date) as datetime),
        interval -6 month
        )


  GROUP BY 1

), serials_by_consignor AS (

  SELECT 
      stadium_serials.consignor_id
    , cast(
    timestamp_trunc(
        cast(min(stadium_serials.original_intake_date) as timestamp),
        month
    )


        AS date) AS consignor_intake_cohort
    , cast(
    timestamp_trunc(
        cast(min(CASE WHEN stadium_serials.status_document = 'Issue' THEN stadium_serials.document_date END) as timestamp),
        month
    )


        AS date) AS consignor_sales_cohort
    , count(CASE WHEN stadium_serials.status_document ='Issue' THEN stadium_serials.serial_number END) AS qty_sold
    , sum(CASE WHEN stadium_serials.status_document ='Issue' THEN stadium_serials.price END) AS value_sold
    , count(CASE WHEN stadium_serials.status_document ='Withdrawal' THEN stadium_serials.serial_number END) AS qty_withdrawn
    , sum(CASE WHEN stadium_serials.status_document ='Withdrawal' THEN stadium_serials.price END) AS value_withdrawn
    , count(CASE WHEN stadium_serials.status_document NOT IN ('Issue', 'Withdrawal') THEN stadium_serials.serial_number END) AS qty_available
    , sum(CASE WHEN stadium_serials.status_document NOT IN ('Issue', 'Withdrawal') THEN stadium_serials.price END) AS value_available
    , max(stadium_serials.original_intake_date) AS latest_intaken_serial
    , sum(gtv_by_order_serial.last_6_months_gtv) AS last_6_months_gtv
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  LEFT JOIN gtv_by_order_serial
    ON stadium_serials.serial_number = gtv_by_order_serial.order_serial
  GROUP BY 1

)

SELECT
    consignors.*
  , serials_by_consignor.consignor_intake_cohort
  , serials_by_consignor.consignor_sales_cohort
  , coalesce(serials_by_consignor.qty_sold, 0) AS qty_sold
  , serials_by_consignor.value_sold
  , coalesce(serials_by_consignor.qty_withdrawn, 0) AS qty_withdrawn
  , serials_by_consignor.value_withdrawn
  , coalesce(serials_by_consignor.qty_available, 0) AS qty_available
  , serials_by_consignor.value_available
  , coalesce(serials_by_consignor.last_6_months_gtv, 0) AS last_6_months_gtv
  , CASE
      WHEN serials_by_consignor.last_6_months_gtv >= 20000
      THEN TRUE
      ELSE FALSE
    END AS is_enterprise
  , serials_by_consignor.latest_intaken_serial
  , CASE
      WHEN serials_by_consignor.latest_intaken_serial >= 

        datetime_add(
            cast( safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS date) as datetime),
        interval -6 month
        )


      THEN TRUE
      ELSE FALSE
    END AS is_active
  , CASE
      WHEN serials_by_consignor.qty_available IS NULL AND serials_by_consignor.qty_sold IS NULL AND serials_by_consignor.qty_withdrawn IS NULL
        THEN NULL
      WHEN coalesce(serials_by_consignor.qty_available, 0) + coalesce(serials_by_consignor.qty_sold, 0) + coalesce(serials_by_consignor.qty_withdrawn, 0) < 10
        THEN 'small timer'
      WHEN coalesce(serials_by_consignor.qty_available, 0) + coalesce(serials_by_consignor.qty_sold, 0) + coalesce(serials_by_consignor.qty_withdrawn, 0) < 50
        THEN 'hobbyist'
      WHEN coalesce(serials_by_consignor.qty_available, 0) + coalesce(serials_by_consignor.qty_sold, 0) + coalesce(serials_by_consignor.qty_withdrawn, 0) < 500
        THEN 'enthusiast'
      WHEN coalesce(serials_by_consignor.qty_available, 0) + coalesce(serials_by_consignor.qty_sold, 0) + coalesce(serials_by_consignor.qty_withdrawn, 0) >= 500
        THEN 'enterprise'
    END AS consignor_persona
  , current_timestamp AS rebuild_timestamp
FROM consignors
LEFT JOIN serials_by_consignor
  ON consignors.consignor_id = serials_by_consignor.consignor_id
WHERE consignors.inventory_type = 'Consignment'
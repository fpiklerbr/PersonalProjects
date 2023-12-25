

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_withdrawal_requested_serials`
  
  
  OPTIONS()
  as (
    

-- dependency on `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requested_products` via macro
WITH 




serials_with_requests AS
(

  SELECT DISTINCT
      serial_number
    , withdrawal_request_id AS request_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requested_products` AS requested_products
  WHERE withdrawal_request_id IS NOT NULL

), serial_requests AS (

  SELECT *
  FROM serials_with_requests
  UNION ALL
  SELECT DISTINCT
      serial_number
    , CAST(NULL AS int64) AS request_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requested_products` AS serials_without_requests
  WHERE NOT EXISTS (
    SELECT *
    FROM serials_with_requests
    WHERE serials_with_requests.serial_number = serials_without_requests.serial_number
  )

), first_requested_product_by_serial AS (

  SELECT
      serial_number
    , min(created_at) AS first_requested_product_created_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requested_products`
  GROUP BY 1

), source_joins AS (

  SELECT DISTINCT
    first_requested_product_by_serial.*
  , serial_requests.request_id
  , requests.created_at
  , requests.withdrawal_request_id
  , first_value(serial_requests.request_id) OVER (
      PARTITION BY serial_requests.serial_number
      ORDER BY requests.created_at DESC
    ) AS last_request_id

  FROM first_requested_product_by_serial
  INNER JOIN serial_requests
    ON first_requested_product_by_serial.serial_number = serial_requests.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requests` AS requests
    ON serial_requests.request_id = requests.withdrawal_request_id

), first_and_last_request_by_serial AS (

  SELECT
	serial_number
  , last_request_id
  , array_agg( request_id
        IGNORE NULLS) AS request_ids
  , COALESCE(MIN(created_at) , MIN(first_requested_product_created_at)) AS first_request_created_at

  FROM source_joins
  GROUP BY 1,2

)



SELECT
    first_and_last_request_by_serial.serial_number
  , first_and_last_request_by_serial.request_ids AS withdrawal_request_ids
  , first_and_last_request_by_serial.first_request_created_at AS first_withdrawal_request_created_at
  , first_and_last_request_by_serial.last_request_id AS last_withdrawal_request_id
  , last_withdrawal_request.created_at AS last_withdrawal_request_created_at
  , last_withdrawal_request.submitted_at AS last_withdrawal_request_submitted_at
  , last_withdrawal_request.deleted_at AS last_withdrawal_request_deleted_at
  , last_withdrawal_request.warehouse AS last_withdrawal_request_warehouse
  , last_withdrawal_request.withdrawal_request_status AS last_withdrawal_request_status
  , last_withdrawal_request.note AS last_withdrawal_request_note
  , last_withdrawal_request.user_id AS last_withdrawal_request_user_id
  , users.consignor_id AS last_withdrawal_request_consignor_id
FROM first_and_last_request_by_serial -- cte returned by macro
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requests` AS last_withdrawal_request
  ON first_and_last_request_by_serial.last_request_id = last_withdrawal_request.withdrawal_request_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__users` AS users
  ON last_withdrawal_request.user_id = users.user_id
  );
    
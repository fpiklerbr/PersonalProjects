

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_external_orders`
  OPTIONS()
  as WITH fancy_timestamps AS (

  SELECT
      fancy_order_id
    , min(created_at) AS created_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_fancy_order_queue`
  GROUP BY 1

), fancy_orders AS (

  SELECT
      fancy_orders.sales_flat_order_id
    , fancy_orders.fancy_order_id AS external_order_id
    , coalesce(fancy_timestamps.created_at, fancy_orders.created_at) AS created_at
    , CAST('fancy' AS string) AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_fancy_order` AS fancy_orders
  LEFT JOIN fancy_timestamps
    ON fancy_orders.fancy_order_id = fancy_timestamps.fancy_order_id

), jet_timestamps AS (

  SELECT
      merchant_order_id
    , min(created_at) AS created_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_jet_order_queue`
  GROUP BY 1

), jet_orders AS (

  SELECT
      jet_orders.sales_flat_order_id
    , jet_orders.jet_order_id AS external_order_id
    , coalesce(jet_timestamps.created_at, jet_orders.created_at) AS created_at
    , CAST('jet' AS string) AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_jet_order` AS jet_orders
  LEFT JOIN jet_timestamps
    ON jet_orders.merchant_order_id = jet_timestamps.merchant_order_id

), tmall_timestamps AS (

  SELECT
      tmall_order_id
    , min(created_at) AS created_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_tmall_order_queue`
  GROUP BY 1

), tmall_orders AS (

  SELECT
      tmall_orders.sales_flat_order_id
    , tmall_orders.tmall_order_id AS external_order_id
    , coalesce(tmall_timestamps.created_at, tmall_orders.created_at) AS created_at
    , CAST('tmall' AS string) AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_tmall_order` AS tmall_orders
  LEFT JOIN tmall_timestamps
    ON tmall_orders.tmall_order_id = tmall_timestamps.tmall_order_id

), walmart_orders AS (

  SELECT
      sales_flat_order_id
    , walmart_order_id AS external_order_id
    , created_at
    , CAST('walmart' AS string) AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_walmart_order`

), m2epro_orders AS (

  SELECT
      sales_flat_order_id
    , m2epro_order_id
    , component_mode
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_order`

), amazon_orders AS (

  SELECT
      sales_flat_order_id
    , amazon_order_id AS external_order_id
    , created_at
    , CAST('amazon' AS string) AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_amazon_order` AS amazon_orders
  INNER JOIN m2epro_orders
    ON amazon_orders.m2epro_order_id = m2epro_orders.m2epro_order_id
  WHERE m2epro_orders.component_mode = 'amazon'

), ebay_orders AS (

  SELECT
      sales_flat_order_id
    , ebay_order_id AS external_order_id
    , created_at
    , CAST('ebay' AS string) AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_ebay_order` AS ebay_orders
  INNER JOIN m2epro_orders
    ON ebay_orders.m2epro_order_id = m2epro_orders.m2epro_order_id
  WHERE m2epro_orders.component_mode = 'ebay'

), farfetch_orders AS (

  SELECT
      sales_flat_order_id
    , fps_order_id AS external_order_id
    , farfetch_order_created_at
    , CAST('farfetch' AS string) AS order_channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_fps_orders`

), final AS (

  SELECT *
  FROM amazon_orders
  UNION ALL
  SELECT *
  FROM ebay_orders
  UNION ALL
  SELECT *
  FROM fancy_orders
  UNION ALL
  SELECT *
  FROM farfetch_orders
  UNION ALL
  SELECT *
  FROM jet_orders
  UNION ALL
  SELECT *
  FROM tmall_orders
  UNION ALL
  SELECT *
  FROM walmart_orders

)

SELECT * FROM final;





WITH codes AS (

  SELECT
      fps_stock_point_id
    , fps_stock_point_code
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_headers`
  WHERE fps_stock_point_id IS NOT NULL
    AND fps_stock_point_code IS NOT NULL
  UNION DISTINCT
  SELECT
      fps_stock_point_id
    , fps_stock_point_code
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order`
  WHERE fps_stock_point_id IS NOT NULL
    AND fps_stock_point_code IS NOT NULL

), currencies AS (

  SELECT DISTINCT
      fps_stock_point_id
    , base_currency
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_base_currency_by_order` AS base_currency_by_order
  WHERE base_currency IS NOT NULL
    AND fps_stock_point_id IS NOT NULL

), all_stock_points AS (

  SELECT
    fps_stock_point_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_fps_stock_points`
  UNION DISTINCT
  SELECT
    fps_stock_point_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_stockpoint`
  UNION DISTINCT
  SELECT
    fps_stock_point_id
  FROM codes
  UNION DISTINCT
  SELECT
    fps_stock_point_id
  FROM currencies

), final AS (

  SELECT
      all_stock_points.fps_stock_point_id
    , codes.fps_stock_point_code
    , COALESCE(currencies.base_currency, merchants.base_currency) AS base_currency
    , seed.channel_or_gateway_footer
    , merchants.fps_merchant_name
    , coalesce(seed.is_excluded_from_financial_reporting, FALSE) AS is_excluded_from_financial_reporting
    , coalesce(stockpoint.api_key, seed.api_key) AS api_key
    , stockpoint.`sg_farfetch_stockpoint_id`,
  stockpoint.`sg_farfetch_stockpoint_name`,
  stockpoint.`price_channel_id`,
  stockpoint.`warehouse_id`,
  stockpoint.`integration_type`,
  stockpoint.`inventory_sync`,
  stockpoint.`sg_farfetch_merchant_id`,
  stockpoint.`is_default_for_merchant`,
  stockpoint.`created_at`,
  stockpoint.`updated_at`,
  stockpoint.`_synched_from_source_at`
  FROM all_stock_points
  LEFT JOIN codes
    ON all_stock_points.fps_stock_point_id = codes.fps_stock_point_id
  LEFT JOIN currencies
    ON all_stock_points.fps_stock_point_id = currencies.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_fps_stock_points` as seed
    ON all_stock_points.fps_stock_point_id = seed.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_stockpoint` as stockpoint
    ON all_stock_points.fps_stock_point_id = stockpoint.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_merchant` AS merchants
    ON stockpoint.sg_farfetch_merchant_id = merchants.sg_farfetch_merchant_id

)

SELECT * FROM final
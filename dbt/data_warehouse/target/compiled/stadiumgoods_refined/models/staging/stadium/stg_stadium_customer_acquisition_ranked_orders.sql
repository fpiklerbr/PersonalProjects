SELECT *
  , row_number() OVER (PARTITION BY unique_email ORDER BY order_creation_nyc, stadium_order_id) AS gtv_rank
  , count(*) OVER (PARTITION BY unique_email) AS gtv_count
  , CASE
      WHEN gmv_order_creation_nyc IS NULL
      THEN NULL
      ELSE row_number() OVER (PARTITION BY unique_email ORDER BY gmv_order_creation_nyc, stadium_order_id)
    END AS gmv_rank
FROM (
  SELECT
      stadium_finance_lines.unique_email
    , stadium_finance_lines.stadium_order_id
    , string_agg(
          DISTINCT CASE
            WHEN stadium_finance_lines.affiliate_publisher IS NOT NULL
            THEN 'affiliate'
            ELSE stadium_finance_lines.acquisition_medium
          END
        , ', '
      ) AS acquisition_medium
    , string_agg(
          DISTINCT CASE
            WHEN stadium_finance_lines.affiliate_publisher IS NOT NULL
            THEN 'linkshare'
            ELSE stadium_finance_lines.acquisition_source
          END
        , ', '
      ) AS acquisition_source
    , string_agg(DISTINCT stadium_finance_lines.acquisition_campaign, ', ') AS acquisition_campaign
    , string_agg(DISTINCT stadium_finance_lines.affiliate_publisher, ', ') AS affiliate_publisher
    , string_agg(DISTINCT stadium_finance_lines.acquisition_channel, ', ') AS acquisition_channel
    , string_agg(DISTINCT stadium_finance_lines.default_channel_grouping, ', ') AS default_channel_grouping
    , string_agg(DISTINCT stadium_finance_lines.customer_name, ', ') AS customer_name
    , string_agg(DISTINCT stadium_finance_lines.customer_city, ', ') AS customer_city
    , min(stadium_finance_lines.order_creation_nyc) AS order_creation_nyc
    , MIN( CASE WHEN gmv_qty > 0 THEN stadium_finance_lines.order_creation_nyc END ) AS gmv_order_creation_nyc
    , string_agg(DISTINCT stadium_products.brand, ', ') AS brand
    , string_agg(DISTINCT stadium_products.gender, ', ') AS gender
    , string_agg(DISTINCT upper(stadium_finance_lines.geography), ', ') AS geography
    , string_agg(DISTINCT upper(stadium_finance_lines.geography_type), ', ') AS geography_type
    , string_agg(DISTINCT stadium_finance_lines.shipping_postcode, ', ') AS shipping_postcode
    , string_agg(DISTINCT stadium_finance_lines.coupon_code, ', ') AS coupon_code
    , string_agg(DISTINCT sale_dates.promo_type, ', ') AS sale_type
    , string_agg(DISTINCT stadium_finance_lines.marketing_channel, ', ') AS marketing_channel
    , sum(stadium_finance_lines.gtv_total) AS gtv_revenue
    , count(*) AS gtv_qty
    , sum(stadium_finance_lines.gmv_total) AS gmv_revenue
    , sum(stadium_finance_lines.gmv_qty) AS gmv_qty
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS stadium_finance_lines
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS stadium_products
    ON stadium_finance_lines.simple_sku = stadium_products.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`calendars_dtc_promos` AS sale_dates
    ON stadium_finance_lines.order_date = sale_dates.promo_date
  WHERE stadium_finance_lines.unique_email IS NOT NULL
  AND stadium_finance_lines.business_unit = 'DTC'
  GROUP BY 1, 2
) AS all_orders


  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_customer_acquisition`
  
  
  OPTIONS()
  as (
    

SELECT
    gtv.*
  , last.customer_name
  , last.customer_city
  , gmv.first_gmv_order_creation_nyc
  , gmv.first_gmv_order_id
  , gmv.gmv_acquisition_channel
  , gmv.gmv_default_channel_grouping
  , gmv.gmv_revenue
  , gmv.gmv_qty
  , current_timestamp AS rebuild_timestamp
FROM (
  SELECT
      unique_email
    , order_creation_nyc AS first_order_creation_nyc
    , stadium_order_id AS first_order_id
    , acquisition_medium
    , acquisition_source
    , acquisition_campaign
    , affiliate_publisher
    , marketing_channel AS acquisition_channel
    , default_channel_grouping
    , sale_type
    , coupon_code
    , brand
    , gender
    , geography
    , geography_type
    , shipping_postcode
    , gtv_revenue
    , gtv_qty
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_customer_acquisition_ranked_orders`
  WHERE gtv_rank = 1
) AS gtv
INNER JOIN (
  SELECT
      unique_email
    , customer_name
    , customer_city
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_customer_acquisition_ranked_orders`
  WHERE gtv_rank = gtv_count
) AS last
  ON gtv.unique_email = last.unique_email
LEFT JOIN (
  SELECT
      unique_email
    , order_creation_nyc AS first_gmv_order_creation_nyc
    , stadium_order_id AS first_gmv_order_id
    , marketing_channel AS gmv_acquisition_channel
    , default_channel_grouping AS gmv_default_channel_grouping
    , gmv_revenue
    , gmv_qty
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_customer_acquisition_ranked_orders`
  WHERE gmv_rank = 1
) AS gmv
  ON gtv.unique_email = gmv.unique_email
  );
    
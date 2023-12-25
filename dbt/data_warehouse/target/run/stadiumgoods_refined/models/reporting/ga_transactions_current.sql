

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`ga_transactions_current`
  
  
  OPTIONS()
  as (
    WITH distinct_ga AS (

  SELECT DISTINCT
      campaign
    , device_category
    , medium
    , source
    , transaction_id
    , transaction_revenue
    , source_date
    , file_time
    , channel_grouping
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`google_analytics__transactions`
  WHERE transaction_id IS NOT NULL

), distinct_mag_order AS (

  SELECT DISTINCT
    mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_lines`

), distinct_external_order AS (

  SELECT DISTINCT
      item_lines.mag_order_id
    , mag_orders.mag_external_order_id AS external_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_lines` AS item_lines
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_orders` AS mag_orders ON mag_orders.mag_order_id = item_lines.mag_order_id
    /* solve the circular dependency */
  UNION DISTINCT
  SELECT DISTINCT
    fps.mag_order_id
  , fps.fps_order_code AS external_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` AS fps

), transaction_agg AS (

  SELECT
      coalesce(
          distinct_mag_order.mag_order_id
        , distinct_external_order.mag_order_id
        , distinct_ga.transaction_id
      ) AS mag_order_id
    , string_agg(DISTINCT device_category, ', ') AS device_category
    , string_agg(DISTINCT medium, ', ') AS medium
    , string_agg(DISTINCT source, ', ') AS source
    , string_agg(DISTINCT campaign, ', ') AS campaign
    , replace(replace(string_agg(DISTINCT channel_grouping, ', '), 'Direct, ', ''), ', Direct', '') AS channel_grouping
    , min(source_date) AS min_source_date
    , sum(transaction_revenue) AS total_revenue
  FROM distinct_ga
  LEFT JOIN distinct_external_order
    ON distinct_external_order.external_order_id = distinct_ga.transaction_id
  LEFT JOIN distinct_mag_order
    ON distinct_mag_order.mag_order_id = distinct_ga.transaction_id
  GROUP BY 1

), final AS (

  SELECT
      mag_order_id
    , device_category
    , medium
    , source
    , campaign
    , CASE WHEN 


  regexp_contains(channel_grouping, r',')

 THEN 'Multiple' ELSE channel_grouping END AS channel_grouping
    , min_source_date
    , total_revenue
    , current_timestamp AS rebuild_timestamp
  FROM transaction_agg

)

SELECT * FROM final
  );
    




WITH final AS (

  SELECT
      fps.order_item_id
    , string_agg(DISTINCT fps.fps_order_line, ', ') AS external_line_id
    , string_agg(DISTINCT fps.farfetch_order_status_id, ', ') AS farfetch_order_status_id
    , string_agg(DISTINCT fps.farfetch_order_status, ', ') AS farfetch_order_status
    , coalesce(
          string_agg(DISTINCT fps.tracking_number, ', ')
        , string_agg(DISTINCT financial.tracking_number, ', ')
      ) AS external_tracking_number
    , coalesce(
          string_agg(DISTINCT fps.fps_return_id, ', ')
        , CASE WHEN 
coalesce(min(fps.fps_return_created_at), min(financial.return_timestamp))
 IS NOT NULL THEN string_agg(DISTINCT fps.fps_order_id, ', ') END
      ) AS external_return_id
    , safe_cast(datetime(safe_cast(
coalesce(min(fps.fps_return_created_at), min(financial.return_timestamp))
 AS timestamp), 'America/New_York') AS datetime) AS external_return_creation_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_lines` AS fps
	LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_order_items` AS financial
	ON fps.fps_order_id = financial.fps_order_id
	AND fps.fps_parent_product_id = financial.fps_parent_product_id
	AND fps.fps_product_size = financial.fps_product_size
  WHERE fps.order_item_id IS NOT NULL
  GROUP BY 1

)

SELECT * FROM final
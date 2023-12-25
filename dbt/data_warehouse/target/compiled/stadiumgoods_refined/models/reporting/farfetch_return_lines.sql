

WITH final AS (

  SELECT
      farfetch_order_line_ids AS farfetch_line_id
    ,  fps_return_id AS farfetch_return_id
    , coalesce(fps_return_timestamp, financial_return_timestamp) AS farfetch_return_timestamp
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_items`
  WHERE coalesce(fps_return_timestamp, financial_return_timestamp) IS NOT NULL

)

SELECT * FROM final
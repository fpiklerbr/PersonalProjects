


  SELECT
    sol.tracking_number
  , count(*) AS count_tracking
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_returns_logic` AS sol
  GROUP BY 1
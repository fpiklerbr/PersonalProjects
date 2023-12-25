

  SELECT
    sol.stadium_order_id
  , count(*) AS count_stadium_order
  , count(coalesce(sol.mag_creditmemo_ids, sol.x3_creditmemo_id)) count_creditmemo
  , count(CASE WHEN sol.refund_expected IS TRUE THEN 1 END) AS count_refund
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_returns_logic` AS sol
  GROUP BY 1
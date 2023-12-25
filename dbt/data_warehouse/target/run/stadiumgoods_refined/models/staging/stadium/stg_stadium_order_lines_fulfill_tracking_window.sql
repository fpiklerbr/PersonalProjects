

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_fulfill_tracking_window`
  
  
  OPTIONS()
  as (
    


  SELECT
    sol.tracking_number_from_fulfillment
  , count(*) AS count_fulfill_tracking
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_returns_logic` AS sol
  GROUP BY 1
  );
    
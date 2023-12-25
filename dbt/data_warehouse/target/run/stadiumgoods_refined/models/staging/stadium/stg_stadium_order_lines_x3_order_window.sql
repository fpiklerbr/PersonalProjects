

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_x3_order_window`
  
  
  OPTIONS()
  as (
    


  SELECT
    sol.x3_order_id
  , sol.x3_order_line
  , count(*) AS count_x3_order
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_lines_returns_logic` AS sol
  GROUP BY 1,2
  );
    